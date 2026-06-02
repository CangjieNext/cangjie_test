// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

var n: Int32 = 0
var count: Int32 = 0


public open class sub_C1 <: test_C4 {
    static let intx8: Int8 = 8;
    static let intx18: Int8 = 8;
    static let intx16: Int16 = 16;
    static let intx116: Int16 = 16;
    static let intx32: Int32 = 32;
    static let intx332: Int32 = 32;
    static let intx64: Int64 = 64;
    static let intx664: Int64 = 64;
    static let uintx8: UInt8 = 8;
    static let uintxu8: UInt8 = 8;
    static let uintx16: UInt16 = 16;
    static let uintxx16: UInt16 = 16;
    static let uintx32: UInt32 = 16;
    static let uintxx32: UInt32 = 16;
    static let uintx64: UInt64 = 64;
    static let uintxx64: UInt64 = 64;
    static let floatx32: Float32 = 32.32323232;
    static let floatxx32: Float32 = 32.32323232;
    static let floatx64: Float64 = 64.64646464;
    static let floatxx64: Float64 = 64.64646464;
    static let in64: Int64 = 11
    static let in65: Int64 = 12
    static let boola: Bool = true
    static let boolb: Bool = false
    static let chara: Rune = 'a'
    static let charb: Rune = 'b'
    static var zijiea: Byte = 'x' // a is 120 with type UInt8
    static var zijieb: Byte = 'x' // a is 120 with type UInt8
    static var zijieshuzua: Array<Byte> = [UInt8(UInt32(r"\u{78}")), UInt8(UInt32(r"\n")), UInt8(UInt32(r"\r"))]
    static var zijieshuzub: Array<Byte> = [UInt8(UInt32(r"\u{78}")), UInt8(UInt32(r"\n")), UInt8(UInt32(r"\r"))]
    static let s1 = "Hello Cangjie Lang 1"
    static let s2 = "Hello Cangjie Lang 2"
    static let arr01 = [0, 1, 2]
    static let arr02 = [2, 3, 4]
    static let arr03 = [2, 3, 4]
    static let age: Int64 = 10
    var sca: Int64 = 7
    var scb: Int64 = 8
    var scc: Int64 = 9
    static var scd: Int64 = 10
    static var sce: Int64 = 10
    static var scf: Int64 = 10
    public func add(sca: Int64, scb: Int64, scc: Int64): Int64 {
        this.sca = sca
        this.scb = scb
        this.scc = scc
        return sca + scb + scc
    }
}

public open class test_C4 {
    var c4a: Int64 = 1
    var c4b: Int64 = 2
    private var c4c: Int64 = 3
    static var c4d: Int64 = 4
    static var c4e: Int64 = 4
    public func add(c4a: Int64, c4b: Int64): Int64 {
        this.c4a = c4a
        this.c4b = c4b
        return c4a + c4b
    }
    public func add(c4a: Int64): Int64 {
        this.c4a = c4a
        this.c4b = 4
        return c4a + c4b
    }
}

main(): Int32 {
    var testclass_a = test_C4().add(9)
    var subclass_a = sub_C1().add(1, 2, 3)
    return 0
}
