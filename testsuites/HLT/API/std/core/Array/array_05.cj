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

main(): Int64 {
    var a0: Bool = false
    var a1: Int8 = -8
    var a2: Int16 = -16
    var a3: Int32 = -32
    var a4: Int64 = -64
    var a5: UInt8 = 8
    var a6: UInt16 = 16
    var a7: UInt32 = 32
    var a8: UInt64 = 64
    var a9: Float32 = 2.1
    var a10: Float64 = 4.2
    let arr0: Array<Bool> = [a0, true]
    let arr1: Array<Int8> = [a1, 8]
    let arr2: Array<Int16> = [a2, 16]
    let arr3: Array<Int32> = [a3, 32]
    let arr4: Array<Int64> = [a4, 64]
    let arr5: Array<UInt8> = [a5, 8]
    let arr6: Array<UInt16> = [a6, 16]
    let arr7: Array<UInt32> = [a7, 32]
    let arr8: Array<UInt64> = [a8, 64]
    let arr9: Array<Float32> = [a9, 2.0]
    let arr10: Array<Float64> = [a10, 4.0]
    if (arr0[0] == false && arr1[0] == -8 && arr2[0] == -16 && arr3[0] == -32 && arr4[0] == -64 && arr5[0] == 8 &&
        arr6[0] == 16 && arr7[0] == 32 && arr8[0] == 64 && arr9[0] == 2.1000 && arr10[0] == 4.2000) {
        return 0
    }
    return 1
}
