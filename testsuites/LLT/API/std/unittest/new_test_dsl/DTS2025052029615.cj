/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (JET) LEVEL:2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args

func selectionSort<T>(arr: Array<T>): Unit where T <: Comparable<T> {
    for (pivot in 0..arr.size - 1) {
        var minIndex = pivot
        for (i in pivot..arr.size) {
            if (arr[i] < arr[minIndex]) {
                minIndex = i
            }
        }
        if (minIndex != pivot) {
            (arr[pivot], arr[minIndex]) = (arr[minIndex], arr[pivot])
        }
    }    
}

@Test[array in random()]
@Types[T in <Float64>]
@Configure[randomSeed: 1]
func foo<T>(array: Array<T>) where T <: Comparable<T> {
    selectionSort(array)
    var i = 0
    while (i < array.size - 1) {
        @Expect(!(array[i] > array[i + 1]))
        i++
    }
}