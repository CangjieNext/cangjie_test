// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Const evaluator (BCHIRInterpreter) must accept INT_MIN % -1 and fold it to 0.
// Pass bounds as arguments so ConstAnalysis cannot fold inside the const func body;
// only the constant evaluator computes the result (see testOverflowNeg1.cj).

// EXEC: %cjc %compile_exe_opt %n.cj %cmp_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not error: an exception was thrown while evaluating constant
// ASSERT: scan 0\n0\n0\n0\n

const func modNeg1Int8(x: Int8, y: Int8): Int8 {
    x % y
}

const func modNeg1Int16(x: Int16, y: Int16): Int16 {
    x % y
}

const func modNeg1Int32(x: Int32, y: Int32): Int32 {
    x % y
}

const func modNeg1Int64(x: Int64, y: Int64): Int64 {
    x % y
}

const X8 = modNeg1Int8(-128, -1)
const X16 = modNeg1Int16(-32768, -1)
const X32 = modNeg1Int32(-2147483648, -1)
const X64 = modNeg1Int64(-9223372036854775808, -1)

main() {
    println(X8.toString())
    println(X16.toString())
    println(X32.toString())
    println(X64.toString())
    0
}
