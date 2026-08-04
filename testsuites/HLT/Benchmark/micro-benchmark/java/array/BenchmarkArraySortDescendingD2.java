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
public class BenchmarkArraySortDescendingD2 {

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
    public void BenchmarkArraySortDescendingD2_N32() {
        for (int[] ints : arr32) {
            mergeSort(ints, 0, ints.length -1);
        }
    }

    @Benchmark
    public void BenchmarkArraySortDescendingD2_N256() {
        for (int[] ints : arr256) {
            mergeSort(ints, 0, ints.length -1);
        }
    }

    @Benchmark
    public void BenchmarkArraySortDescendingD2_N2048() {
        for (int[] ints : arr2048) {
            mergeSort(ints, 0, ints.length -1);
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArraySortDescendingD2.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
