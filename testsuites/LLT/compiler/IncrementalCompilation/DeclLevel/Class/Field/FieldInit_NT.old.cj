class A {
    var a = 30
    let b = 100
    public let c = -2
    protected var d: UInt32
    static let e = 1
    static public var f: (Int32) -> Unit = { a => println("33 ${e}") }
    init() {
        a = 0; d=3
    }
    init(v: Int32) {
        this.d = UInt32(v)
    }
    static init() {
    }
    static const g = 56
}

main(): Int64 {
    let a = A()
    return a.a
}

struct B {
    var a = -10
    let b = (-1, (0x3333efff, 0))
    private let c = "aabrr"
    public var d: Rune
    private static let f: (Int32) -> Unit = { a => a }
    static let g = ";;"
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
    let a = 17
    var b = 2
    static const h = "var"
}

struct D<T> {
    public static var c = 33
    static const g = 19
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
