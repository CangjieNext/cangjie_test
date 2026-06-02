/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type arrayint<T> = Array<Int32>

type arrayuint<T> = Array<UInt64>

type arrayfloat<T> = Array<Float32>

type arraychar<T> = Array<Rune>

type arraystr<T> = Array<String>

type arraybool<T> = Array<Bool>

main(): Int64 {
    var array1: arrayint<Int32> = [-1, 2]
    var array2: arrayuint<UInt64> = [1, 2]
    var array3: arrayfloat<Float16> = [3.14, 0.01]
    var array4: arraychar<String> = [r'仓', r'颉']
    var array5: arraystr<String> = ["hello", "char"]
    var array6: arraybool<Bool> = [true, false]
    let r1: Int32 = array1[0] + array1[1]
    let r2: UInt64 = array2[0] + array2[1]
    let r3: Float32 = array3[0] + array3[1]
    let r4: String = array4[0].toString() + array4[1].toString()
    let r5: String = array5[0] + array5[1]
    let r6: Bool = array6[0] && array6[1]
    if (r1 == 1 && r2 == 3 && (3.14 < r3 && r3 < 3.16) && r4 == "仓颉" && r5 == "hellochar" && r6 == false) {
        return 0
    }
    return 1
}
