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

class cls {
    static let a1: Int8
    static let a2: Int16
    static let a3: Int32
    static let a4: Int64
    static let a5: UInt8
    static let a6: UInt16
    static let a7: UInt32
    static let a8: UInt64
    static let a9: Float16
    static let a10: Float32
    static let a11: Float64
    static var a12: Rune = r'1'
    static var a13: Bool
    static var a14: Unit
    static var a15: String
    static var a16: () -> Int64
    static var a17: (Int64, Int16)
    static var a18: Array<String> = ["a", "b"]

    static init() {
        a1 = 1
        a2 = 1
        a3 = 1
        a4 = 1
        a5 = 1
        a6 = 1
        a7 = 1
        a8 = 1
        a9 = 1.0
        a10 = 1.0
        a11 = 1.0
        a12 = r'2'
        a13 = true
        a14 = ()
        a15 = "hhhh"
        a16 = {=> 1}
        a17 = (1, 1)
        a18 = ["c", "d"]
    }
}

main(): Int64 {
    if (cls.a1 == 1 && cls.a2 == 1 && cls.a3 == 1 && cls.a4 == 1 && cls.a5 == 1 && cls.a6 == 1 && cls.a7 == 1 &&
        cls.a8 == 1 && cls.a9 == 1.0 && cls.a10 == 1.0 && cls.a11 == 1.0 && cls.a12 == r'2' && cls.a13 && cls.a14 == () &&
        cls.a15 == "hhhh" && cls.a16() == 1 && cls.a17[0] == 1 && cls.a18[0] == "c") {
        return 0
    }
    return 1
}
