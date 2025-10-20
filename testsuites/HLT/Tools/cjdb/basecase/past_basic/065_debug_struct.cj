/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
struct testc1{
    var age:Int64 = 10
    var scores:Float64 = 12.12
    public var dcore:Int32 = 32
    public var bool1:Bool = true
    private var str1:String = "aaa"
    var lrun:Rune = 'A'
    var range1:Range<Int64> = 1..10:2
    var structinvar07:Array<Range<Int64>>=[range1,range1,range1]
    private var arr:ArrayList<Int64> = ArrayList<Int64>([0, 1, 2])
    let structinvar09 = HashSet<Int64>([0, 1, 2])
    var structinvar10 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    var structinvar11:(UInt8, Int64,Float32,Bool,String) = (1,32,13.31,true,"hello")
}
class testc32{
    let age:Int64 = 10
    var scores:Float64 = 12.12
    public var dcore:Int32 = 32
    public var bool1:Bool = true
    private var str1:String = "aaa"
    var lrun:Rune = 'A'
    var range1:Range<Int64> = 1..10:2
    var structinvar07:Array<Range<Int64>>=[range1,range1,range1]
    private var arr:ArrayList<Int64> = ArrayList<Int64>([0, 1, 2])
    let structinvar09 = HashSet<Int64>([0, 1, 2])
    var structinvar10 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    var structinvar11:(UInt8, Int64,Float32,Bool,String) = (1,32,13.31,true,"hello")
}
struct Rect{
    var age:Int64 = 10
    var scores:Float64 = 12.12
    public var dcore:Int32 = 32
    public var bool1:Bool = true
    private var str1:String = "aaa"
    var lrun:Rune = 'A'
    var range1:Range<Int64> = 1..10:2
    public var ui:UInt64 = 64
    var s7:Array<Range<Int64>>=[range1,range1,range1]
    private var arr:ArrayList<Int64> = ArrayList<Int64>([0, 1, 2])
    let s09 = HashSet<Int64>([0, 1, 2])
    var s10 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    var s11:(UInt8, Int64,Float32,Bool,String) = (1,32,13.31,true,"hello")
    var s12:Array<String> = ["aaa", "bbb", "ccc"]
    private var s13:Array<Array<String>> = [s12, s12, s12]
    public var vara:VArray<Int64,$3> = [1, 2, 3]
    public var a:testc1 = testc1()
    public var b:testc32 = testc32()
}
main(): Int64 {
    var rr = Rect()
    println("hello world")
    return 0
}
