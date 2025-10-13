class A {
    var a = 3
    let b = 18
    public let c = -21
    protected var d: UInt32 = 3
    static let e = 11
    static public var f: (Int32) -> Unit = { b => println("33 ${e}") }
    init() {
        a = 0; d=3
    }
    init(v: Int32) {
        this.d = UInt32(v)
    }
    static init() {
    }
    static const g = 5
}

main(): Int64 {
    let a = A()
    return a.a
}

struct B {
    var a = -1
    let b = (-1, (0x33fff, 0))
    private let c = "aabrr"
    public var d: Rune
    private static let f: (Int32) -> Unit = { b => b }
    static let g = ";"
    init() {
        a=1
        d='k'
    }
    init(v: Int64) {
        a = Int64(v);d=','
    }
    static init() {
    }
}

class C<T> {
    let a = 1
    var b = 21
    static const h = 'v'
}

struct D<T> {
    public static var c = 3
    static const g = 190
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
