// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Const evaluator must accept INT_MIN % -1 and fold it to 0 (not treat as overflow).

// EXEC: %cjc %compile_exe_opt %n.cj %cmp_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 0\n0\n0\n0\n

const func modMinNeg1Int8(): Int8 {
    let a: Int8 = -128
    a % -1
}

const func modMinNeg1Int16(): Int16 {
    let a: Int16 = -32768
    a % -1
}

const func modMinNeg1Int32(): Int32 {
    let a: Int32 = -2147483648
    a % -1
}

const func modMinNeg1Int64(): Int64 {
    let a: Int64 = -9223372036854775808
    a % -1
}

const X8 = modMinNeg1Int8()
const X16 = modMinNeg1Int16()
const X32 = modMinNeg1Int32()
const X64 = modMinNeg1Int64()

main() {
    println(X8.toString())
    println(X16.toString())
    println(X32.toString())
    println(X64.toString())
    0
}
