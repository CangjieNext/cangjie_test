/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*
class Rectangle{
    var arru8: Array<UInt8> = [1, 2, 3]
    var arru16: Array<UInt16> = [1, 2, 3]
    var arru32: Array<UInt32> = [1, 2, 3]
    var arru64: Array<UInt64> = [1, 2, 3]
    var arruin: Array<UIntNative> = [1, 2, 3]
    var arr8: Array<Int8> = [1, 2, 3]
    var arr16: Array<Int16> = [1, 2, 3]
    var arr32: Array<Int32> = [1, 2, 3]
    var arr64: Array<Int64> = [1, 2, 3]
    var arrin: Array<IntNative> = [1, 2, 3]
}
main(): Int64 {
    var rec = Rectangle()
    var lInt8: Int8 = 8
    var lInt16: Int16 = 16
    var lInt32: Int32 = 32
    var lInt64: Int64 = 64
    var lIntN: IntNative = 100
    var gui8: UInt8 = 8
    var gui16: UInt16 = 16
    var gui32: UInt32 = 32
    var gui64: UInt64 = 64
    var guiN: UIntNative = 100
    var listi8: ArrayList<Int8> = ArrayList<Int8>([1, 2, 3])
    var listi16: ArrayList<Int16> = ArrayList<Int16>([1, 2, 3])
    var listi32: ArrayList<Int32> = ArrayList<Int32>([1, 2, 3])
    var listi64: ArrayList<Int64> = ArrayList<Int64>([1, 2, 3])
    var listin: ArrayList<IntNative> = ArrayList<IntNative>([1, 2, 3])
    var listui8: ArrayList<UInt8> = ArrayList<UInt8>([1, 2, 3])
    var listui16: ArrayList<UInt16> = ArrayList<UInt16>([1, 2, 3])
    var listui32: ArrayList<UInt32> = ArrayList<UInt32>([1, 2, 3])
    var listui64: ArrayList<UInt64> = ArrayList<UInt64>([1, 2, 3])
    var listuin: ArrayList<UIntNative> = ArrayList<UIntNative>([1, 2, 3])
    println("hello world")
    return 0
}
