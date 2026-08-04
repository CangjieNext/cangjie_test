/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.ArrayList;
import java.text.DecimalFormat;

public class BenchmarkStr2Float64 {

    static int reps = 100000;
    static int nums[] = {4096, 512, 64, 8};

    public static ArrayList<String> setUp(int num) {
        ArrayList<String> resultList = new ArrayList<>();
        for (int i = 0; i < num; i++) {
            String str = Integer.toString(i) + "." + Integer.toString(i);
            resultList.add(str);
        }
        return resultList;
    }

    public static void benchmarkStr2Float64 (ArrayList<String> floatArr) {
        for (int i = 0; i < reps; i++) {
            for (String str : floatArr) {
                Double.parseDouble(str);
            }
        }
    }

    public static void benchmarkStr2Float64(int num) {

        ArrayList<String> floatArr = setUp(num);
        DecimalFormat df = new DecimalFormat("#.00");

        benchmarkStr2Float64(floatArr);
    }
    public static void main(String[] args) {
        var startTime = System.nanoTime();
        for (int num : nums) {
            benchmarkStr2Float64(num);
        }
        var endTime = System.nanoTime();
        var perTime = endTime - startTime;

        System.out.println("BenchmarkStr2Float64: ms = " + perTime / 1000000.0);
    }
}