// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %frontendCompiler %cmp_opt %enableCompileDebug %f -o %n.%suffix -Woff unused %diag_json

func foo1() {
    var a: Int64 = 92233720368547758
    var b: UInt64 = 2
    println(a ** b) // 9223372036854775807
}

func foo2() {
    var a: Int64 = -92233720368547757
    var b: UInt64 = 2
    println(a ** b) // 9223372036854775807
}

func foo3() {
    var a: Int64 = 9223372036854
    var b: UInt64 = 2038495435
    println(a ** b) // 9223372036854775807
}

func foo4() {
    var a: Int64 = -9223372036854
    var b: UInt64 = 2038495437
    println(a ** b) // -9223372036854775808
}

func foo5() {
    var a: Int64 = 121
    var b: UInt64 = 18446744073709551525
    println(a ** b) // 9223372036854775807
}

func foo6() {
    var a: Int64 = -121
    var b: UInt64 = 18446744073709551525
    println(a ** b) // -9223372036854775808
}

main() {
    0
}
// ASSERT: scan-6 chir_arithmetic_operator_overflow
