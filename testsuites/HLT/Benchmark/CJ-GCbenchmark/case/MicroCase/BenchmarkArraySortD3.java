/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.io.*;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.Random;
import java.util.Arrays;

public class BenchmarkArraySortD3 {

    static long[] ARRAY_LENGTH = {32, 256};

    static long[][][] generateArrD3(int len) {
        long[][][] array = new long[len][len][len];
        for (int i = 0; i < len; i++) {
            for (int j = 0; j < len; j++) {
                for (int k = 0; k < len; k++) {
                    array[i][j][k] = 0;
                }
            }
        }
        return array;
    }

    static long[][][] randomize(long[][][] arr) {
        Random r = new Random();
        for (int i = 0; i < arr.length; ++i) {
            for (int j = 0; j < arr[i].length; ++j) {
                for (int k = 0; k < arr[i][j].length; ++k) {
                    arr[i][j][k] = r.nextLong();
                }
            }
        }
        return arr;
    }

    static long timeBenchmarkArraySortD3(long len) {
        var startTime = System.nanoTime();
        var srcArr = generateArrD3((int) len);

        var i = 0;
        var reps = 10;
        while (i < reps) {
            var srcArr1 = randomize(srcArr);
            for (int j = 0; j < len; ++j) {
                for (int k = 0; k < len; ++k) {
                    Arrays.sort(srcArr1[j][k]);
                }
            }
            i++;
        }
        var endTime = System.nanoTime();
        return endTime - startTime;
    }

    static void timeBenchmarkArrayUnstableSortD3(long len) {
        var perTime = timeBenchmarkArraySortD3(len);
    }

    public static void main(String[] args) {
        var start_total = System.nanoTime();
        for (int i = 0; i < ARRAY_LENGTH.length; ++i) {
            timeBenchmarkArrayUnstableSortD3(ARRAY_LENGTH[i]);
        }
        var end_total = System.nanoTime();
        System.out.println("BenchmarkArraySortD3: ms = " + (end_total - start_total) / 1000000.0);

        return;
    }
}
