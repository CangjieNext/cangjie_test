/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.ArrayList;
import java.text.DecimalFormat;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;


public class BenchmarkJsonArray2JsonStr {

    static int reps = 100000;
    static int nums[] = {4096, 512, 64, 8};

    public static JsonArray setUp(int num) {
        JsonArray jsonArray = new JsonArray();
        for (int i = 0; i < num; i++) {
            String str = Integer.toString(i) + "." + Integer.toString(i);
            jsonArray.add(str);
        }
        return jsonArray;
    }

    public static void benchmarkJsonArray2JsonStr (JsonArray floatArr) {
        for (int i = 0; i < reps; i++) {
            for (int j = 0; j < floatArr.size(); j++) {
                JsonElement element = floatArr.get(j);
                Double.parseDouble(element.getAsString());
            }
        }
    }

    public static void timeBenchmarkJsonArray2JsonStr(int num) {

        JsonArray floatArr = setUp(num);
        DecimalFormat df = new DecimalFormat("#.00");

        benchmarkJsonArray2JsonStr(floatArr);
    }
    public static void main(String[] args) {
        var startTime = System.nanoTime();
        for (int num : nums) {
            timeBenchmarkJsonArray2JsonStr(num);
        }
        var endTime = System.nanoTime();
        var perTime = endTime - startTime;

        System.out.println("BenchmarkJsonArray2JsonStr: ms = " + perTime / 1000000.0);
        return;
    }
}