/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
struct rect{
    private var s12:Array<String> = ["aaa", "bbb", "ccc"]
    private var s121:Array<Array<String>> = [s12, s12]
    public var s13:ArrayList<Rune> = ArrayList<Rune>([r'a', r'b'])
    private var s14:HashMap<Bool, UInt64> = HashMap<Bool, UInt64>([(true, 10), (false, 20)])
    protected let s09 = HashSet<UInt64>([0, 1, 2])
    static var sa:ArrayList<Bool> = ArrayList<Bool>([true, false])
    private var s13a:ArrayList<Int64> = ArrayList<Int64>([64, 65])
    var a = testc()
    let bools:Bool = true
    public var ui8:UInt8 = 8
    let width:Int64 = 10
    var height:Int32 = 32

}
class testc{
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
    var structinvar11:(UInt8, Int64,Float32,Bool,String,Rune,UInt8) = (1,32,13.31,true,"hello",r'a',10)
}
class student {
    let age:Int64 = 10
    var scores:Float64 = 12.12
    public var dcore:Int32 = 32
    public var bool1:Bool = true
    private let str1:String = "aaa"
    let lrun:Rune = 'A'
    var range1:Range<Int64> = 1..10:2
    var s12:Array<Int32> = [32,33]
    var structinvar07:Array<Range<Int64>>=[range1,range1,range1]
    private var arr:ArrayList<Int64> = ArrayList<Int64>([0, 1, 2])
    let structinvar09 = HashSet<Int64>([0, 1, 2])
    var structinvar10 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    var structinvar11:(UInt8, Int64,Float32,Bool,String) = (1,32,13.31,true,"hello")
    public var vara:VArray<Int64,$3> = [1, 2, 3]
    var s07:Array<Int64>=[1,2,3]
    var s071:Array<Array<Int64>>=[s07,s07,s07]
    var s0711:Array<Array<Array<Int64>>>=[s071,s071,s071]
    public var s07111:Array<Array<Array<Array<Int64>>>>=[s0711,s0711,s0711]
    public var s08:Array<Rune> = [r'a', r'b', r'c']
    var sa1:ArrayList<Bool> = ArrayList<Bool>([true, false])
    var alhm:ArrayList<HashMap<String, Int64>> = ArrayList<HashMap<String, Int64>>([structinvar10, structinvar10])
    private var alr:ArrayList<Range<Int64>>=ArrayList<Range<Int64>>([range1, range1])
    public var hm:HashMap<Int64, String> = HashMap<Int64, String>([(10, "aaaa"), (20,"bbb")])
    public var hs:HashSet<Bool> = HashSet<Bool>([true, false])
    public var hsr:HashSet<Range<Int64>> = HashSet<Range<Int64>>([range1, range1])
    private var ae = TimeUnit.Red
    let ar = rect()
    // protected var hs:HashSet<Bool> = HashSet<Bool>([true, false])
    private var ain:Int32 = 10
    protected var af:Float32 = 32.32
    public var tt: testc = testc()
    var aaa = 10
}
class S1{
    public var ss1:Int64
    public init(a:Int64) {
        this.ss1 = a
    }
}
enum TimeUnit{
    Red
}

var globals_hsr:HashSet<Rune> = HashSet<Rune>([r'a', r'b'])
let globals_hashset: HashSet<Int64> = HashSet<Int64>([0, 1, 2])
let globals_arrh:Array<HashSet<Int64>> = [globals_hashset, globals_hashset]
let globals_arrlah:ArrayList<Array<HashSet<Int64>>> = ArrayList<Array<HashSet<Int64>>>([globals_arrh, globals_arrh])
var globals_arrbool:Array<Bool> = [false,  true]
var globals_arrfloat64:Array<Float64> = [12.12,  22.22]
var globals_sa1:ArrayList<Float32> = ArrayList<Float32>([32.32, 12.12])
var globals_hm:HashMap<String, Float64> = HashMap<String, Float64>([("aaaa", 11.11), ("bbb", 22.22)])
var globals_hs:HashSet<Float64> = HashSet<Float64>([12.12, 13.13])
main(): Int64 {
    var arrl:ArrayList<Int64> = ArrayList<Int64>([0, 1, 2])
    let arrt:Array<ArrayList<Int64>> = [arrl, arrl, arrl]
    let arr1:Array<Int64> = [1,2,3]
    var range1:Range<Int64> = 1..10:2
    var s7:Array<Range<Int64>>=[range1,range1,range1]
    let s10 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    let s09 = HashSet<Int64>([0, 1, 2])
    let s09s = HashSet<String>(["aa", "bb"])
    let stu = student()
    var s1 = S1(10)
    let rect1 = rect()
    println("hello world")
    return 0
}
