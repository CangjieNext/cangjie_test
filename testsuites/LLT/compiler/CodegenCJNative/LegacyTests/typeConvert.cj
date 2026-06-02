// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func TypeConvert(a: Int64): Int32 {
    var ch = Rune(100)
    var x = UInt32(ch)
    var f32: Float32 = 3.14
    var f64 = Float64(f32) + Float64(10)
    var i64 = Int64(f64) + a
    let c = Int32(i64)
    return c + Int32(f64) + Int32(x)
}

func codegenUnitTest(): Int32 {
    return TypeConvert(-55)
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 71) {
        return 0
    } else {
        return -1
    }
}
