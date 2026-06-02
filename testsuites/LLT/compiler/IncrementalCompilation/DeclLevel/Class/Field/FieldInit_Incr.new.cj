class A {
    var a: Int64 = 30
    let b: Int64 = 100
    public let c: Int16 = -2
    protected var d: UInt32
    static let e: Int32 = 1
    static public var f: (Int32) -> Unit = { a => println("33 ${e}") }
    init() {
        a = 0; d=3
    }
    init(v: Int32) {
        this.d = UInt32(v)
    }
    static init() {
    }
    static const g: Int32 = 56
}

main(): Int64 {
    let a = A()
    return 0
}

struct B {
    var a: Int32 = -10
    let b: (Int32, (Int32, UInt8)) = (-1, (0x3333efff, 0))
    private let c: String = "aabrr"
    public var d: Rune
    private static let f: (Int32) -> Int32 = { a => a }
    static let g: String = ";;"
    init() {
        a=1
        d='k'
    }
    init(v: Int64) {
        a = Int32(v);d=','
    }
    static init() {
    }
}

class C {
    let a: Int32 = 17
    var b: Int32 = 2
    static const h: String = "var"
}

struct D {
    public static var c: Int32 = 33
    static const g: Int32 = 19
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
