// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %frontendCompiler %cmp_opt %enableCompileDebug %f -o %n.%suffix -Woff unused %diag_json

func foo() {
    var a: UInt64 = 30
    var b: UInt64 = 18446744073709551610
    var c = a - b
}

func goo() {
    var a: UInt32 = 10
    var b: UInt32 = 4294967293
    var c = a - b
}

func hoo() {
    var a: UInt16 = 17
    var b: UInt16 = 65530
    var c = a - b
}

func koo() {
    var a: UInt8 = 3
    var b: UInt8 = 255
    var c = a - b
}

main(): Int64 {
    0
}
// ASSERT: scan-4 chir_arithmetic_operator_overflow
