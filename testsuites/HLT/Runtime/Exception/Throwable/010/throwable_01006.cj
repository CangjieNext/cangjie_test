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

let A1: Int64 = 1
let A2: Int32 = 1
let A3: Int16 = 1
let A4: Int8 = 1
let A5: UInt64 = 1
let A6: UInt32 = 1
let A7: UInt16 = 1
let A8: UInt8 = 1
let A9: Float16 = 1.0
let A10: Float32 = 1.0
let A11: Float64 = 1.0
let A12: String = "1"
let A13: Rune = '1'
let A14: Bool = true
let A15: A = A()
let A16: B = B()
let A17: C = C()

class TEST {
    func test<T>(a1: Int64, a2: Int32, a3: Int16, a4: Int8, a5: UInt64, a6: UInt32, a7: UInt16, a8: UInt8, a9: Float16,
        a10: Float32, a11: Float64, a12: String, a13: Rune, a14: Bool, a15: A, a16: B, a17: T): Unit where T <: C {
        if (a1 < 100) {
            test(a1 + 1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17)
        } else {
            throw Exception()
        }
        return
    }
}

main() {
    try {
        TEST().test(A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17)
    } catch (x: Exception) {
        x.printStackTrace();
        return 0
    }
    return 1
}
