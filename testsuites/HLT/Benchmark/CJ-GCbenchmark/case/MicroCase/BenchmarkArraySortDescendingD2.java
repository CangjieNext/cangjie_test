/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkArraySortDescendingD2 {

    static int num32 = 32;
    static int num256 = 256;
    static int num2048 = 2048;

    static int[][] arr32 = new int[num32][num32];
    static int[][] arr256 = new int[num256][num256];
    static int[][] arr2048 = new int[num2048][num2048];

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
            if (arr[i] >= arr[j]) { 
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

    public void BenchmarkArraySortDescendingD2_N(int[][] array) {
        for (int[] ints : array) {
            mergeSort(ints, 0, ints.length -1);
        }
    }


    public static void main(String[] args) {
        var startTime = System.nanoTime();
        BenchmarkArraySortDescendingD2 benchmark = new BenchmarkArraySortDescendingD2();
        benchmark.setup();
        benchmark.BenchmarkArraySortDescendingD2_N(arr32);
        benchmark.BenchmarkArraySortDescendingD2_N(arr256);
        benchmark.BenchmarkArraySortDescendingD2_N(arr2048);
        var endTime = System.nanoTime();
        var perTime = endTime - startTime;
        System.out.println("BenchmarkArraySortDescendingD2" + ": ms = " + perTime / 1000000.0);
    }
}
