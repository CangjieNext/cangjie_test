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
public class BenchmarkArraySortD1 {
    static int num32 = 32;
    static int num256 = 256;
    static int num2048 = 2048;
    static int num16384 = 16384;
    static int num131072 = 131072;
    static int num1048576 = 1048576;
    static int num8388608 = 8388608;
    static int[] arr32 = new int[num32];
    static int[] arr256 = new int[num256];
    static int[] arr2048 = new int[num2048];
    static int[] arr16384 = new int[num16384];
    static int[] arr131072 = new int[num131072];
    static int[] arr1048576 = new int[num1048576];
    static int[] arr8388608 = new int[num8388608];

    @Setup(Level.Invocation)
    public void setup() {
        for (int i = 0; i < arr32.length; i++) {
            arr32[i] = (int) (Math.random() * 2147483647);
        }
        for (int i = 0; i < arr256.length; i++) {
            arr256[i] = (int) (Math.random() * 2147483647);
        }
        for (int i = 0; i < arr2048.length; i++) {
            arr2048[i] = (int) (Math.random() * 2147483647);
        }
        for (int i = 0; i < arr16384.length; i++) {
            arr16384[i] = (int) (Math.random() * 2147483647);
        }
        for (int i = 0; i < arr131072.length; i++) {
            arr131072[i] = (int) (Math.random() * 2147483647);
        }
        for (int i = 0; i < arr1048576.length; i++) {
            arr1048576[i] = (int) (Math.random() * 2147483647);
        }
        for (int i = 0; i < arr8388608.length; i++) {
            arr8388608[i] = (int) (Math.random() * 2147483647);
        }
    }

    @Benchmark
    public void BenchmarkArrayUnstableSortD1_N32() {
        Arrays.sort(arr32);
    }

    @Benchmark
    public void BenchmarkArrayUnstableSortD1_N256() {
        Arrays.sort(arr256);
    }

    @Benchmark
    public void BenchmarkArrayUnstableSortD1_N2048() {
        Arrays.sort(arr2048);
    }

    @Benchmark
    public void BenchmarkArrayUnstableSortD1_N16384() {
        Arrays.sort(arr16384);
    }

    @Benchmark
    public void BenchmarkArrayUnstableSortD1_N131072() {
        Arrays.sort(arr131072);
    }

    @Benchmark
    public void BenchmarkArrayUnstableSortD1_N1048576() {
        Arrays.sort(arr1048576);
    }

    @Benchmark
    public void BenchmarkArrayUnstableSortD1_N8388608() {
        Arrays.sort(arr8388608);
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

    // 归并排序
    @Benchmark
    public void BenchmarkArrayStableSortD1_N32() {
        stableSort(arr32);
    }

    @Benchmark
    public void BenchmarkArrayStableSortD1_N256() {
        stableSort(arr256);
    }

    @Benchmark
    public void BenchmarkArrayStableSortD1_N2048() {
        stableSort(arr2048);
    }

    @Benchmark
    public void BenchmarkArrayStableSortD1_N16384() {
        stableSort(arr16384);
    }

    @Benchmark
    public void BenchmarkArrayStableSortD1_N131072() {
        stableSort(arr131072);
    }

    @Benchmark
    public void BenchmarkArrayStableSortD1_N8388608() {
        stableSort(arr8388608);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArraySortD1.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
