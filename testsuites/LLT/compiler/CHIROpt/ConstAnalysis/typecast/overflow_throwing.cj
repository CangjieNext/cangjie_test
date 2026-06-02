// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %frontendCompiler %cmp_opt %enableCompileDebug %f -o %n.%suffix -Woff unused %diag_json

func foo() {
    var a: Int16 = -2000
    var b: Int8 = Int8(a)
}

func goo() {
    var a: UInt16 = 2000
    var b: Int8 = Int8(a)
}

func hoo() {
    var a: Int16 = -2000
    var b: UInt8 = UInt8(a)
}

func koo() {
    var a: UInt16 = 2000
    var b: UInt8 = UInt8(a)
}

main(): Int64 {
    0
}
// ASSERT: scan-4 chir_typecast_overflow
