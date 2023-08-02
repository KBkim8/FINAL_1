package com.hp.app.meal.service;

import java.util.List;
import java.util.Map;

import com.hp.app.meal.vo.MealVo;
import com.hp.app.page.vo.PageVo;

public interface MealService {

	List<MealVo> getMealList(PageVo pv);

	List<MealVo> getMealList();

	int getMealCnt();

	int applyBreakFast(Map<String, String> paramMap);

	MealVo selectMeal(String no);

}
