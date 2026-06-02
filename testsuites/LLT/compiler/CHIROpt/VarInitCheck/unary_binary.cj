// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj

class A {
    var a: Int32
    var b: Int32
    var c: Int32
    public init() {
        a++
        b *= 2
        var d = -c
    }
    public func foo() {
        c /= 2
    }
}

main(): Int32 {
    var a: Int32
    a++
    var b: Int32
    b--
    let c: Int32
    c += 2
    let d: Int32
    d -= 2
    var e: Int32
    e *= 2
    var f: Int32
    f /= 2
    var g: Int32
    g %= 2
    var h: Int32
    var h1 = -h
    var i: Int64
    i **= 2
    var j: Bool
    j &&= true
    var k: Bool
    k ||= true
    var l: Int64
    l <<= 2
    var m: Int64
    m >>= 2
    var n: Int64
    n ^= 2
    var o: Int64
    o |= 2
    var p: Int64
    p &= 2
    return 0
}
// ASSERT: scan chir_class_uninitialized_field
// ASSERT: scan-19 chir_used_before_initialization
