/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


func foo<T>(para: T) {
    var a: T = para
    var f14=1.11
    var intt=Int8(f14)
    var pi = (3.14, "hello")
    var vChar:Rune ='C'
    var vFloat32:Float32 = 13.13
    var vInt16:Int16 = -16
    var vUInt16:UInt16 = 16
    var vrange = 1..10:1
    var sbf:Bool = false
    var sbt:Bool = true
    var sba = 'a'
    var sbarr = "abc"
    let runevar01:Rune='a'
    var var1: Int8 = -128
    var var2: Int8 = 127
    var var3: Int64 = 1
    var var4: Int16 = 1
    var var5: Int32 = 1
    var var6: Int64 = 1
    var var7: UInt8 = 1
    var var8: UInt16 = 1
    var var9: UInt32 = 1
    var var10: UInt64 = 1
    let str = "cangjie"
    let tuple1: (String, String) = ("String", "cangjie")
    var tuple2 = ('a', 'b')
    let tuple3: (Rune, Rune, Rune, Rune) = (r'b', r'\\', r'\u{597d}', r'\"')
    var tuple4: (Bool, Bool, ) = (true, false )
    let tuple_F:(Float16,Float32,Float64) = (16.12,32642.32,64.621325947594)
    let tuple_I:(Int8,Int16,Int32,Int64) = (-8,16,-32,64)
    let tuple_I1:(Int64,Int64) = (-8,16)
    let tuple_F1:(Float64,Float64) = (16.12,64.621325947594)
    var var11:IntNative = 10;
    var var22:UIntNative = 8;
    var vInt8: VArray<Int8, $3> = [-1, -2, -3]
    var vInt161: VArray<Int16, $3> = [-1, -2, -3]
    var vInt32: VArray<Int32, $3> = [-1, -2, -3]
    var vInt64: VArray<Int64, $3> = [-1, -2, -3]
    var vUInt8: VArray<UInt8, $3> = [1, 2, 3]
    var vUInt162: VArray<UInt16, $3> = [1, 2, 3]
    var vUInt32: VArray<UInt32, $3> = [1, 2, 3]
    var vUInt64: VArray<UInt64, $3> = [1, 2, 3]
    var vFloat16: VArray<Float16, $3> = [1.0, 2.0, 3.0]
    var vFloat323: VArray<Float32, $3> = [1.0, 2.0, 3.0]
    var vFloat64: VArray<Float64, $3> = [1.0, 2.0, 3.0]
    return a
}

main():Int64 {
    foo(7)
    return 0
}
