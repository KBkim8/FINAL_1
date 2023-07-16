package com.hp.app.data.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hp.app.data.captcha.CaptchaUtil;
import nl.captcha.Captcha;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("data")
public class DataController {
	@GetMapping("breakFast")
	public String breakFast(HttpServletRequest req, Model model) {
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			String root = req.getServletContext().getRealPath("/resources/data/diet.json");
			File jsonFile = new File(root);
			Object jsonData = objectMapper.readValue(jsonFile, Object.class);
			String jsonString = objectMapper.writeValueAsString(jsonData);
			model.addAttribute("jsonString", jsonString);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "data/breakFast";
	}

	@GetMapping(value = "weather", produces = "text/plain")
	@ResponseBody
	public String weather() throws Exception {
		String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
		String serviceKey = "Wyz5uylLIJYn%2BM7ddwH5EvX2ksfqBveLSQbOvXf%2Bb%2F0UdcgJRFVwGU3qj%2FLOkQoLdho99BTsY8e9RLq5WzxLFA%3D%3D";
		String numOfRows = "12";
		String nx = "60";
		String ny = "125";
		String baseDate = "20230715";
		String baseTime = "0500";
		String type = "json";

		StringBuilder urlBuilder = new StringBuilder(apiUrl);
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey);
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("nx", "UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("ny", "UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("base_date", "UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("base_time", "UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "=" + URLEncoder.encode(type, "UTF-8"));

		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");

		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}

		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		String result = sb.toString();
		return result;
	}

	// 페이지 매핑
	@GetMapping("/captcha.do")
	public String Captcha() {
		return "data/captcha";
	}

	// captcha 이미지 가져오는 메서드
	@GetMapping("/captchaImg.do")
	@ResponseBody
	public void captchaImg(HttpServletRequest req, HttpServletResponse res) throws Exception {
		new CaptchaUtil().getImgCaptCha(req, res);
	}

	// 전달받은 문자열로 음성 가져오는 메서드
	@GetMapping("/captchaAudio.do")
	@ResponseBody
	public void captchaAudio(HttpServletRequest req, HttpServletResponse res) throws Exception {
		Captcha captcha = (Captcha) req.getSession().getAttribute(Captcha.NAME);
		String getAnswer = captcha.getAnswer();
		new CaptchaUtil().getAudioCaptCha(req, res, getAnswer);
	}

	// 사용자가 입력한 보안문자 체크하는 메서드
	@PostMapping("/chkAnswer.do")
	@ResponseBody
	public String chkAnswer(HttpServletRequest req, HttpServletResponse res) {
		String result = "";
		Captcha captcha = (Captcha) req.getSession().getAttribute(Captcha.NAME);
		String ans = req.getParameter("answer");
		if (ans != null && !"".equals(ans)) {
			if (captcha.isCorrect(ans)) {
				req.getSession().removeAttribute(Captcha.NAME);
				result = "200";
			} else {
				result = "300";
			}
		}
		return result;
	}
}
