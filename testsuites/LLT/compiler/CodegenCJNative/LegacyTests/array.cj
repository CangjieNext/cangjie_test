// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func arrInput(arr: Array<Int32>): Int32 {
    return arr[1]
}

func func0(): Unit {}

func func1(): Unit {}

var g_arr: Array<Array<Array<Array<Int64>>>> = [[[[]]]]
var g_arr2: Array<Array<Array<Array<Array<Array<Array<Int64>>>>>>> = [[[g_arr]]]

main(): Int64 {
    let n: Int32 = 37
    var arr: Array<Int32> = [31, n, 41]
    var arr1: Array<Int32> = [1, 2, 3, 4, 5, 6]
    arr1 = arr
    var arr2: Array<Array<Int32>> = [[11, 22, 33], [44, 55, 66]]
    let d: Int32 = arr2[1][2]
    let c: Int32 = arr[1] + d + arr1[1]
    let e: Int64 = 5
    var arr3 = Array<Array<Int32>>(e, repeat: Array<Int32>(5, repeat: n))
    if (arr1.size == 3) {
        var ans = arr3[4][3] + arrInput(Array<Int32>(7 - 2, repeat: 3 + 7))
        var ret = c + ans + arr[arr.size - 1]
        if (ret == 228) {
            return 0
        } else {
            return -1
        }
    }
    let myArray1: Array<(() -> Unit)> = [{=> ()}]
    let myArray2: Array<(() -> Unit)> = [func0, func1]
    let myArray3 = Array<Bool>(5, repeat: true || true)
    var size1 = [1, 1, 1].size
    var size2 = Array<Int32>(5, repeat: 5).size
    return 0
}
