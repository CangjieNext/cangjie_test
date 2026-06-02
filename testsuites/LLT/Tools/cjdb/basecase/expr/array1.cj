// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.collection.*
var globals_rune:Rune = 'B'
struct rect{
    let age:Int64 = 10
    var scores:Float64 = 12.12
    public var dcore:Int32 = 32
    public var bool1:Bool = true
    private let str1:String = "aaa"
    let lrun:Rune = 'A'
    var range1:Range<Int64> = 1..10:2
    public var ui:UInt64 = 64
    var s7:Array<Range<Int64>>=[range1,range1,range1]
    private var arr:ArrayList<Int64> = ArrayList<Int64>([0, 1, 2]) 
    let s09 = HashSet<Int64>([0, 1, 2])
    var s10 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)]) 
    var s11:(UInt8, Int64,Float32,Bool,String) = (1,32,13.31,true,"hello")
    var s12:Array<Int32> = [32, 33]    
    public var vara:VArray<Int64,$3> = [1, 2, 3]

}
class student {
    let age:Int64 = 10
    var scores:Float64 = 12.12
    public var dcore:Int32 = 32
    public var bool1:Bool = true
    private let str1:String = "aaa"
    let lrun:Rune = 'A'
    var range1:Range<Int64> = 1..10:2
    var structinvar07:Array<Range<Int64>>=[range1,range1,range1]
    public var vara:VArray<Int64,$3> = [1, 2, 3]
    var s07:Array<Int64>=[1,2,3]
    var s071:Array<Array<Int64>>=[s07,s07,s07]
    var s0711:Array<Array<Array<Int64>>>=[s071,s071,s071]
    public var s07111:Array<Array<Array<Array<Int64>>>>=[s0711,s0711,s0711]
}

main(): Int64 {
    var arrl:ArrayList<Int64> = ArrayList<Int64>([0, 1, 2]) 
    let arrt:Array<ArrayList<Int64>> = [arrl, arrl, arrl]
    let arr1:Array<Int64> = [1,2,3]
    var range1:Range<Int64> = 1..10:2
    let s7:Array<Range<Int64>>=[range1,range1,range1]
    var a:Int64 = 20
    let stu = student()
    let rect1 = rect()
    let lrune:Rune = 'A'
    var vrune:Rune = 'C'
    println("hello world")
    return 0
}