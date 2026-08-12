/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

public class LargeStringAndSubstrings {
    public static void main(String[] args) {
        var start_total = System.nanoTime();
        char[] array = new char[100000];
        Arrays.fill(array, 'a');

        String largeString = Arrays.toString(array);

        for (int i = 0; i < 1000000; i++) {
            largeString += 'a';
        }

        List<String> substrings = new ArrayList<>();

        for (int i = 0; i + 10 < largeString.length(); i++) {
                substrings.add(largeString.substring(i, i + 10));
        }
        var end_total = System.nanoTime();
        System.out.println("LargeStringAndSubstrings: ms = " + (end_total - start_total) / 1000000.0);

        System.out.println(substrings.size());


    }
}


