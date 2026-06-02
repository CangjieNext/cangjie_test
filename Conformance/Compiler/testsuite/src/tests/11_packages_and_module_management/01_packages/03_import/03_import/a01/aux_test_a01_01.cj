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

package p1

public var a1  : Int8       = 1
public var a2  : Int16      = 2023
public var a3  : Int32      = 2023
public var a4  : Int64      = 2023
public var a5  : IntNative  = 2023
public var a6  : UInt16     = 2023
public var a7  : UInt32     = 2023
public var a8  : UInt64     = 2023
public var a9  : UIntNative = 2023
public var a10 : Float16    = 20.23
public var a11 : Float32    = 20.23
public var a12 : Float64    = 20.23

public var c1  : Rune       = 'c'
public var c2  : Rune       = '\u{2023}'

public var s1  : String     = "string"
public var s2  : String     = """
          This is a multi-line string"""

public var r1  : Range<Int8> = 0..10

public var arr1 : Array<Int32> = [0, 1, 2]

public var b1 : Bool = true

public func f1() { 
    return "foo"
}

public struct S1 {
    public static var structName = "S1"
}

public enum E1 {
    | First(Float32)
    | Second(Float32, Float32)
}

public class C1 {
    public static func add(p1: Int64, p2:Int64) {
        return p1 + p2
    }
}
