/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package array;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.Arrays;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkArraySortD3 {
    static int num32 = 32;
    static int num256 = 256;

    static int[][][] arr32 = new int[num32][num32][num32];
    static int[][][] arr256 = new int[num256][num256][num256];

    @Setup(Level.Invocation)
    public void setup() {
        for (int k = 0; k < arr32.length; k++) {
            for (int j = 0; j < arr32.length; j++) {
                for (int i = 0; i < arr32.length; i++) {
                    arr32[k][j][i] = (int) (Math.random() * 2147483647);
                }
            }
        }
        for (int k = 0; k < arr256.length; k++) {
            for (int j = 0; j < arr256.length; j++) {
                for (int i = 0; i < arr256.length; i++) {
                    arr256[k][j][i] = (int) (Math.random() * 2147483647);
                }
            }
        }
    }
    @Benchmark
    public void BenchmarkArrayUnstableSortD3_N32() {
        for (int j = 0; j < arr32.length; j++) {
            for (int i = 0; i < arr32.length; i++) {
                Arrays.sort(arr32[j][i]);
            }
        }
    }

    @Benchmark
    public void BenchmarkArrayUnstableSortD3_N256() {
        for (int j = 0; j < arr256.length; j++) {
            for (int i = 0; i < arr256.length; i++) {
                Arrays.sort(arr256[j][i]);
            }
        }
    }

    public static void stableSort(int[] arr) {
        int[] temp = new int[arr.length];
        mergeSort(arr, temp, 0, arr.length - 1);
    }

    private static void mergeSort(int[] arr, int[] temp, int left, int right) {
        if (left >= right) {
            return;
        }
        int mid = (left + right) / 2;
        mergeSort(arr, temp, left, mid);
        mergeSort(arr, temp, mid + 1, right);
        merge(arr, temp, left, mid, right);
    }

    private static void merge(int[] arr, int[] temp, int left, int mid, int right) {
        int i = left, j = mid + 1, k = left;
        while (i <= mid && j <= right) {
            if (arr[i] <= arr[j]) {
                temp[k++] = arr[i++];
            } else {
                temp[k++] = arr[j++];
            }
        }
        while (i <= mid) {
            temp[k++] = arr[i++];
        }
        while (j <= right) {
            temp[k++] = arr[j++];
        }
        for (i = left; i <= right; i++) {
            arr[i] = temp[i];
        }
    }

    @Benchmark
    public void BenchmarkArrayStableSortD3_N32() {
        for (int j = 0; j < arr32.length; j++) {
            for (int i = 0; i < arr32.length; i++) {
                stableSort(arr32[i][j]);
            }
        }
    }

    @Benchmark
    public void BenchmarkArrayStableSortD3_N256() {
        for (int j = 0; j < arr256.length; j++) {
            for (int i = 0; i < arr256.length; i++) {
                stableSort(arr256[i][j]);
            }
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArraySortD3.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
