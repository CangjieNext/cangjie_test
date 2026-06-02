// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %frontendCompiler %cmp_opt %enableCompileDebug %f -o %n.%suffix -Woff unused %diag_json

func foo() {
    var a: Int64 = -9223372036854775808
    var c = -a
}

func goo() {
    var a: Int32 = -2147483648
    var c = -a
}

func hoo() {
    var a: Int16 = -32768
    var c = -a
}

func koo() {
    var a: Int8 = -128
    var c = -a
}

main(): Int64 {
    0
}
// ASSERT: scan-4 chir_arithmetic_operator_overflow
