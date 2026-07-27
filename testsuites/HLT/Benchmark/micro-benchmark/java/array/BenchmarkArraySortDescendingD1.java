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

import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkArraySortDescendingD1 {
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

    private static void mergeSort(int[] arr, int left, int right) {
        if (left < right) {
            int mid = (left + right) / 2;
            mergeSort(arr, left, mid);
            mergeSort(arr, mid + 1, right);
            merge(arr, left, mid, right);
        }
    }

    private static void merge(int[] arr, int left, int mid, int right) {
        int[] temp = new int[right - left + 1];
        int i = left, j = mid + 1, k = 0;
        while (i <= mid && j <= right) {
            if (arr[i] >= arr[j]) { // 保证稳定性，当相等时，优先取左边的元素
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
        for (int p = 0; p < temp.length; p++) {
            arr[left + p] = temp[p];
        }
    }

    @Benchmark
    public void BenchmarkArraySortDescendingD1_N32() {
        mergeSort(arr32, 0, arr32.length -1);
    }

    @Benchmark
    public void BenchmarkArraySortDescendingD1_N256() {
        mergeSort(arr256, 0, arr256.length -1);
    }

    @Benchmark
    public void BenchmarkArraySortDescendingD1_N2048() {
        mergeSort(arr2048, 0, arr2048.length -1);
    }

    @Benchmark
    public void BenchmarkArraySortDescendingD1_N16384() {
        mergeSort(arr16384, 0, arr16384.length -1);
    }

    @Benchmark
    public void BenchmarkArraySortDescendingD1_N131072() {
        mergeSort(arr131072, 0, arr131072.length -1);
    }

    @Benchmark
    public void BenchmarkArraySortDescendingD1_N1048576() {
        mergeSort(arr1048576, 0, arr1048576.length -1);
    }

    @Benchmark
    public void BenchmarkArraySortDescendingD1_N8388608() {
        mergeSort(arr8388608, 0, arr8388608.length -1);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArraySortDescendingD1.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
