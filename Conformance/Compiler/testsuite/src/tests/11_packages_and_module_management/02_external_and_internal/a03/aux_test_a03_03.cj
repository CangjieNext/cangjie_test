/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Structure:       complex-aux
*/

package pkga3

var a1  : Int8       = 1
var a2  : Int16      = 2023
var a3  : Int32      = 2023
var a4  : Int64      = 2023
var a5  : IntNative  = 2023
var a6  : UInt16     = 2023
var a7  : UInt32     = 2023
var a8  : UInt64     = 2023
var a9  : UIntNative = 2023
var a10 : Float16    = 20.23
var a11 : Float32    = 20.23
var a12 : Float64    = 20.23

var c1  : Rune       = 'c'

var s1  : String     = "string"

var r1  : Range<Int8> = 0..10

var arr1 : Array<Int32> = [0, 1, 2]

var b1 : Bool = true

func f1() { 
    return "foo"
}

struct S1 {
    static var structName = "S1"
}

enum E1 {
    | First(Float32)
    | Second(Float32, Float32)
}

class C1 {
    static func add(p1: Int64, p2:Int64) {
        return p1 + p2
    }
}
