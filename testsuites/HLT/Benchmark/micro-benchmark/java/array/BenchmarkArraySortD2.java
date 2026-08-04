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
public class BenchmarkArraySortD2 {
    static int num32 = 32;
    static int num256 = 256;
    static int num2048 = 2048;
    static int[][] arr32 = new int[num32][num32];
    static int[][] arr256 = new int[num256][num256];
    static int[][] arr2048 = new int[num2048][num2048];

    @Setup(Level.Invocation)
    public void setup() {
        for (int j = 0; j < arr32.length; j++) {
            for (int i = 0; i < arr32.length; i++) {
                arr32[j][i] = (int) (Math.random() * 2147483647);
            }
        }
        for (int j = 0; j < arr256.length; j++) {
            for (int i = 0; i < arr256.length; i++) {
                arr256[j][i] = (int) (Math.random() * 2147483647);
            }
        }
        for (int j = 0; j < arr2048.length; j++) {
            for (int i = 0; i < arr2048.length; i++) {
                arr2048[j][i] = (int) (Math.random() * 2147483647);
            }
        }
    }

    @Benchmark
    public void BenchmarkArrayUnstableSortD2_N32() {
        for (int i = 0; i < arr32.length; i++) {
            Arrays.sort(arr32[i]);
        }
    }

    @Benchmark
    public void BenchmarkArrayUnstableSortD2_N256() {
        for (int i = 0; i < arr256.length; i++) {
            Arrays.sort(arr256[i]);
        }
    }

    @Benchmark
    public void BenchmarkArrayUnstableSortD2_N2048() {
        for (int i = 0; i < arr2048.length; i++) {
            Arrays.sort(arr2048[i]);
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
    public void BenchmarkArrayStableSortD2_N32() {
        for (int[] ints : arr32) {
            stableSort(ints);
        }
    }

    @Benchmark
    public void BenchmarkArrayStableSortD2_N256() {
        for (int[] ints : arr256) {
            stableSort(ints);
        }
    }

    @Benchmark
    public void BenchmarkArrayStableSortD2_N2048() {
        for (int[] ints : arr2048) {
            stableSort(ints);
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArraySortD2.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
