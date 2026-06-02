// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.collection.*
interface I1 {
    func foo1():Int32 {
        return 1
    }
}
class testc2{
    let age:Int64 = 10
    var scores:Float64 = 12.12
    public var dcore:Int32 = 32
    public var bool1:Bool = true
    private let str1:String = "aaa"
    let lrun:Rune = 'A'
    var range1:Range<Int64> = 1..10:2
    var structinvar07:Array<Range<Int64>>=[range1,range1,range1]
    private var arr:ArrayList<Int64> = ArrayList<Int64>([0, 1, 2]) 
    let structinvar09 = HashSet<Int64>([0, 1, 2])
    var structinvar10 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)]) 
    var structinvar11:(UInt8, Int64,Float32,Bool,String,Rune,UInt8) = (1,32,13.31,true,"hello",r'a',b'x')
}
class C1 <: I1 {
    var fl:Float16 = 16.16
    public var b1:Bool = true
    private var s1:String = "aaab"
    let r1:Rune = 'A'
    var ra1:Range<Int64> = 1..10:2
    var s7:Array<Range<Int64>>=[ra1,ra1,ra1]
    private var arr:ArrayList<Int64> = ArrayList<Int64>([0, 1, 2]) 
    let s09 = HashSet<Int64>([0, 1, 2])
    var s10 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)]) 
    var s11:(UInt8, Int64,Float32,Bool,String,Rune,UInt8) = (1,32,13.31,true,"hello",r'a',b'x')
    public var vara:VArray<Int64,$3> = [1, 2, 3]
    var ssss:testc2 = testc2()
    public func foo1():Int32 {
        return 6
    }    
}

main() {
    let a:I1 = C1()
    return 0
}