/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Object {
    public var a: Int64 = 1
}

class C1 <: Object {}

class C2 <: Object {}

main(): Int64 {
    let arr1: Array<Object> = [C1(), C2(), Object()]
    let arr2 = Array<Int32>(100, repeat: 0)
    let arr3: Array<Array<Int32>> = [[1, 2], [3, 4]]
    let arr4: Array<Array<Rune>> = [[r'a', r'b'], [r'c', r'd']]
    let arr5: Array<Array<String>> = [["a1", "a2"], ["a3", "a4"]]
    let arr6 = Array<Array<Array<Int32>>>(10, repeat: Array<Array<Int32>>(10, repeat: Array<Int32>(10, repeat: 0)))
    let arr7: Array<Array<Array<Int32>>>
    if (arr2[0] == 0 && arr3[0][1] == 2 && arr6[1][1][1] == 0) {
        return 0
    }
    return 1
}
