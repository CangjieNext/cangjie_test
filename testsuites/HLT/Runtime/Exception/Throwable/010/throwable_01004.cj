/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class A {}

struct B {}

class C {}

var A1: Int64 = 1
var A2: Int32 = 1
var A3: Int16 = 1
var A4: Int8 = 1
var A5: UInt64 = 1
var A6: UInt32 = 1
var A7: UInt16 = 1
var A8: UInt8 = 1
var A9: Float16 = 1.0
var A10: Float32 = 1.0
var A11: Float64 = 1.0
var A12: String = "1"
var A13: Rune = '1'
var A14: Bool = true
var A15: A = A()
var A16: B = B()
var A17: C = C()
var foo = {
    a1: Int64, a2: Int32, a3: Int16, a4: Int8, a5: UInt64, a6: UInt32, a7: UInt16, a8: UInt8, a9: Float16, a10: Float32, 
    a11: Float64, a12: String, a13: Rune, a14: Bool, a15: A, a16: B => throw Exception()
}

main() {
    try {
        foo(A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16)
    } catch (x: Exception) {
        x.printStackTrace();
        return 0
    }
    return 1
}
