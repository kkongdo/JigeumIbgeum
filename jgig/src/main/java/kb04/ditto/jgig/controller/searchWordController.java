package kb04.ditto.jgig.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import kb04.ditto.jgig.entity.PopularWordDto;
import kb04.ditto.jgig.mapper.SearchWordMapper;

@Controller
public class searchWordController {
	@Autowired
	private SearchWordMapper searchWordMapper;

	private String totalCount;

	@GetMapping("/jgig/searchWord")
	public String loadSearchWord(Model model, HttpSession session) {
		// 로그인 유무에 따라 전체 인기 검색어 or 나이대별 검색어 분기처리하기
		String memId = (String) session.getAttribute("mem_id");
		if(memId == null) {
			List<PopularWordDto> list = searchWordMapper.allAgeList();
			model.addAttribute("word_list", list);
			return "search_word/searchWord";
		}
		
		int mem_age = searchWordMapper.selectAge(memId);
		
		List<PopularWordDto> list = searchWordMapper.list(mem_age);
		model.addAttribute("word_list", list);
		return "search_word/searchWord";
	}

	@PostMapping("/jgig/searchWordResult")
	public String getSearchWordHandler(PopularWordDto dto, @RequestParam("pw_word") String pw_word, @RequestParam("pageNo") String pageNo, Model model, HttpSession session) {
		// 로그인했을 때만 검색한 단어 popular_word에 insert
		String memId = (String) session.getAttribute("mem_id");
		if(memId != null) {
			pw_word = pw_word.replaceAll("\\s+", "");
			dto.setPw_word(pw_word);
			int mem_age = searchWordMapper.selectAge(memId);
			dto.setPw_age(mem_age);
			dto.setMem_id(memId); // 로그인 중인 멤버의 아이디 넣기
			searchWordMapper.insert(dto);
		}

		try {
			String apiResult = apiHandler(pw_word, pageNo);
			// 결과 값 담을 때 사용할 map
			List<Map<String, Object>> resultList = new LinkedList<Map<String, Object>>();
	
			List<HashMap<String, String>> list = getResultMap(apiResult);
			for (Map<String, String> tmpMap : list) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("word", tmpMap.get("fnceDictNm"));
				map.put("content", tmpMap.get("ksdFnceDictDescContent"));
				resultList.add(map);
			}
	
			model.addAttribute("result_list", resultList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("word", pw_word);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPage", "1");

		return "search_word/searchWordResult";
	}
	
	@PostMapping("/jgig/searchWordResult/{pageNo}")
	public String postSearchWordHandler(@RequestParam("pw_word") String pw_word, @PathVariable("pageNo") String pageNo, Model model) {
		try {
			String apiResult = apiHandler(pw_word, pageNo);
			// 결과 값 담을 때 사용할 map
			List<Map<String, Object>> resultList = new LinkedList<Map<String, Object>>();
	
			List<HashMap<String, String>> list = getResultMap(apiResult);
			for (Map<String, String> tmpMap : list) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("word", tmpMap.get("fnceDictNm"));
				map.put("content", tmpMap.get("ksdFnceDictDescContent"));
				resultList.add(map);
			}
	
			model.addAttribute("result_list", resultList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("word", pw_word);
		model.addAttribute("totalCount", totalCount);
		return "search_word/resultList";
	}

	// open api 처리 함수
	public String apiHandler(String pw_word, String pageNo) {
		StringBuilder sb = new StringBuilder();
		try {

			String serviceKey = "gfZIEuYu6OT%2Br8PNu78IYHzGerjvx0Lz8tfR90DZ9u1dJakIv42vQSVjK9803ivmD%2FO9eReLqIIrFuZd%2F6LoHg%3D%3D";

			StringBuilder urlBuilder = new StringBuilder(
					"https://api.seibro.or.kr/openapi/service/FnTermSvc/getFinancialTermMeaning"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + serviceKey); /* Service Key */
			urlBuilder.append(
					"&" + URLEncoder.encode("term", "UTF-8") + "=" + URLEncoder.encode(pw_word, "UTF-8")); /* LIKE 검색 */
			urlBuilder.append(
					"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /* 숫자로 관리 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode("10", "UTF-8")); /* 숫자로 관리 */

			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//	        System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}

			// StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			url = null;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return sb.toString();
	}

	// 결과 값 뽑아내는 함수
	public List<HashMap<String, String>> getResultMap(String data) throws Exception {

		// 결과값을 넣어줄 map을 선언해줍니다.
		List<HashMap<String, String>> resultMap = new LinkedList<HashMap<String, String>>();

		InputSource is = new InputSource(new StringReader(data));

		// Document 클래스로 xml데이터를 취득합니다.
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);

		// xPath 팩토리로 객체를 만듭니다.
		XPath xpath = XPathFactory.newInstance().newXPath();

		// xPath를 컴파일한 후에 node단위로 데이터를 수집합니다.
		NodeList nodeList = (NodeList) xpath.compile("/response/body/items/item").evaluate(document,
				XPathConstants.NODESET);
		int nodeListCount = nodeList.getLength();
		for (int i = 0; i < nodeListCount; i++) {
			NodeList childNode = nodeList.item(i).getChildNodes();
			HashMap<String, String> nodeMap = new HashMap<String, String>();
			int childNodeCount = childNode.getLength();
			for (int j = 0; j < childNodeCount; j++) {
				nodeMap.put(childNode.item(j).getNodeName(), childNode.item(j).getTextContent());
			}
			resultMap.add(nodeMap);
		}

		// totalCount (총 검색 결과)
		NodeList nodeList2 = (NodeList) xpath.compile("/response/body/totalCount").evaluate(document,
				XPathConstants.NODESET);
		if (nodeList2.getLength() > 0) {
			Node totalCountNode = nodeList2.item(0);
			String totalCountValue = totalCountNode.getTextContent();
			totalCount = totalCountValue;
		}
		return resultMap;
	}
}
