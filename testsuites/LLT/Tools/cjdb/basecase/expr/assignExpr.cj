// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    var a: Int64 = 1
    var b: Int64 = 2
    var b2: IntNative = 2
    var b3: UIntNative = 2
    var c: Bool = true
    var d: Rune = 'c'
    var e: String = "abcd"
    a = 2
    b = 3
    // compound assignment expressions
    a += b
    a -= b
    a *= b
    // a/=b
    // Multi-assignment expressions 
    (a, b) = (3, 4)
}
