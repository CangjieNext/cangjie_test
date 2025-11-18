/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_composite

import std.collection.*

public var tuple_top1 :(Float32,Range<Int64>,String)= (32642.32,-10..=10:2,"cangjie go")
public open class Cla_Super{
    var m_sup1:Int32 = 12306
    public Cla_Super(){

    }

    public func fun_cla1(p1:(Float32,Range<Int64>,String)) :(Float32,Range<Int64>,String){
        var v1:Range<Int64> = 10..0:1
        var v2:String = "10..0:1 => 磨人的小妖精"
        var res :(Float32,Range<Int64>,String) = (p1[0],v1,v2)
    return res
    }

}

public let list_top1 :ArrayList<Rune> = ArrayList<Rune>(['b', '\\', '\u{597d}', '\"'])
public var list_list_Char : ArrayList<ArrayList<Rune>> = ArrayList<ArrayList<Rune>>([list_top1,list_top1])
public  var arr_top1 : Array<Int64> = Array<Int64>(1200, {i => i+1})
public var multiArr_str_top1 : Array<Array<String>> = [["he ha hei you","yaoguainalipao"],["*^%$#@F^&*$##@",":?+)*^%L<>&￥"]]
public var set_float32 : HashSet<Float32> = HashSet<Float32>([63.56744, 8.423567])
public var set_string_top2 : HashSet<String> = HashSet<String>(["`~!@#$%^&*()_+-=[{}]\\|:;'\",./? %……&*（）——+-={}【】、|：；‘“”“，。、？", "collection_HashSet"])
public var map_list_top1 : HashMap<String, ArrayList<HashSet<String>>> = HashMap<String, ArrayList<HashSet<String>>>([("list_set_str",ArrayList([set_string_top2,set_string_top2]))])

public class WithinTuple <: Cla_Super{
    public let tuple_I:(Int8,Int16,Int32,Int64) = (-8,16,-32,64)
    public let tuple_UI:(UInt8,UInt16,UInt32,UInt64) = (8,165,3206,64521)
    private let tuple_pri:(UInt8,UInt16,UInt32,UInt64) = (45,167,306,6321)
    static let tuple_static:(UInt8,UInt16,UInt32,UInt64) = (8,165,257,64521)
    public let tuple_F:(Float16,Float32,Float64) = (16.12,32642.32,64.621325947594)
    public var tuple_O:(Bool,Rune,Rune,Rune) = ('\\' is Rune,'C','\\','\u{597d}')

    public var m_cla1:Int32 = tuple_I[2]
    public var m_cla2:Float32 = tuple_F[1]
    let struct_ins_1 = Struct_1(23)
    private var m_cla3:Array<Array<Int32>> = struct_ins_1.multiArr_1 //Array<Array<Int32>>
    private let m_cla4:HashMap<Int32, UInt32> = struct_ins_1.map_Struct1 //HashMap<Int32, UInt32>([(-329,1750), (-910,1732),(-76,1675)])

    public static let range_1: Range<Int64> = 0..10
    public let range_2: Range<Int64> = 0..=10
    public let range_3: Range<Int64> = -10..10:2
    private let range_4 = -10..=10:2
    public let range_5: Range<Int64> = 10..0:-2
    public let range_6: Range<Int64> = 10..=0:-1
    private let range_7 = 10..0:1 // Define an empty range.
    public let range_8: Range<Int64> = 0..0:1  // Define an empty range.
    protected let range_9 = 0..=0:1  // Define an empty range.
    public static let range_10: Range<Int64> = 0..=10:-1  // Define an empty range.
    public var tuple_range: Tuple<Range<Int64>, Range<Int64>, Range<Int64>, Range<Int64>, Range<Int64>, Range<Int64>, Range<Int64>, Range<Int64>, Range<Int64>, Range<Int64>, Range<Int64>> = (range_1,range_2,range_3,range_4,range_5,range_6,range_7,range_8,range_9,range_10,1..=10) //高维Tuple

    public var tuple_composite_1 :(Cla_1,Struct_1,Enum_1) = (Cla_1(12),Struct_1(56),Enum_1.Year) //非泛型自定义类型（重写hashcode()）
    protected var tuple_composite_2  = (subCla_1(),ClassViaInherit(12)) //非泛型子父类实例
    protected var tuple_composite_3  = (SubClaViaViaGenerices<Bool,UInt16,Int8>(tuple_O[0],tuple_UI[1]),
                             ClaInsViaGenerices<UInt16,Int32>(tuple_UI[1],tuple_I[2])) //泛型子父类实例
    protected var tuple_composite_4  = (SubClaViaViaGenerices<Bool,UInt16,Int8>(tuple_O[0],tuple_UI[1]),
                             R1<Float32>(tuple_F[1]),TimeUnit1.Year(tuple_I[2])) //泛型（class,struct,enum）

    let cla_ins_1 = WithinString()
    protected var tuple_str1 = (cla_ins_1.arr_str1,cla_ins_1.arr_str17,cla_ins_1.arr_str4,cla_ins_1.arr_str6,cla_ins_1.arr_str8,
                      cla_ins_1.arr_str9,cla_ins_1.arr_str10,cla_ins_1.arr_str11,cla_ins_1.arr_str12,cla_ins_1.arr_str13,
                      cla_ins_1.arr_str14,cla_ins_1.arr_str15,cla_ins_1.arr_str15+cla_ins_1.arr_str16) //高维Tuple
    public var multiset: HashSet<Range<Int64>> = HashSet<Range<Int64>>([range_1,range_2,range_3,range_4])
    public var tuple_composite_5 :(HashMap<String, ArrayList<HashSet<String>>>,HashSet<Range<Int64>>,ArrayList<ArrayList<Rune>>,Array<Int64>,Array<Array<String>>)=
            (map_list_top1,multiset,list_list_Char,arr_top1,multiArr_str_top1) //Tuple


}

public class Cla_1 <: Hashable & Equatable<Cla_1> {
    public var x:Int64
    public Cla_1(x:Int64){
        this.x = x
    }
    public func hashCode() : Int64 {
        return Int64(x)
    }
    public operator func ==(right : Cla_1) : Bool {
        return this.x == right.x
    }
    public operator func !=() : Bool {
        return false
    }
}

public struct Struct_1 <: Hashable & Equatable<Struct_1> {
    public var x:Int64
    public init(x:Int64){
        this.x = x
    }
    public func hashCode() : Int64 {
        return Int64(x)
    }
    public operator func ==(right : Struct_1) : Bool {
        return this.x == right.x
    }
    public operator func !=() : Bool {
        return false
    }

    public var m_struct1:Int32 = 32

    private static let tuple_Struct1 = (WithinString().arr_str1,"shit      ?|")
    private  let tuple_Struct2:(Int8,Float16,UInt32) = (12,16.1616,96)
    public var arrayInt32 : Array<Int32> = [8,-10,-2]
    public var multiArr_1 : Array<Array<Int32>> = [arrayInt32,arrayInt32]
    public var multiArr_2 : Array<Array<String>> = [["chou","T塔"],["come one *%$#","go GO Go"]]
    public var map_Struct1 : HashMap<Int32, UInt32> = HashMap<Int32, UInt32>([(-329,1750), (-910,1732),(-76,1675)])
    public var m_struct2:Float32 = 0.2358

    //默认形参，返回元组
    public func fun_struct1(p1: Float32,p2!:(Float32,Range<Int64>,String) = tuple_top1) :(Float32,Range<Int64>,String){
        var v1:String = "10..0:1 => 磨人的小妖精"
        var v2:Range<Int64> = 10..-2:-1
        var res :(Float32,Range<Int64>,String) = (p1,v2,p2[2] + v1)
        return res
    }
    //默认形参，返回一维数组
    public func fun_struct2(p1: Int64,p2!:Array<Int64> =[641,642,2574,644]) :Array<Int64>{
       p2[0] = 2022711 % p1
       var res :Array<Int64> = [p2[0],p1,126]
       return res
    }
    //默认形参，返回多维数组
    public func fun_struct3(p1: Int64,p2!:Array<Array<Int64>> = Array<Array<Int64>>([Struct_1(231).fun_struct2(-59)])) :Array<Array<Array<Int64>>>{
       p2[0][0] = 202358 % p1
       var res :Array<Array<Array<Int64>>> = Array<Array<Array<Int64>>>([p2,p2])
       return res
    }
    //默认形参，返回HashSet
    public func fun_struct4(p2!:HashSet<Float32> = set_float32) :HashSet<Float32>{
       p2.reserve(-5)
       var res :HashSet<Float32> = p2
       return res
    }
    //默认形参，返回HashMap
    public func fun_struct5(p1:HashSet<String>,p2!:HashMap<Int16, HashSet<String>> = HashMap<Int16, HashSet<String>>([(-16,set_string_top1)])) :HashMap<Int16, HashSet<String>>{
       p2[13] = p1
       var res :HashMap<Int16, HashSet<String>> = p2
       return res
    }

    //默认形参，返回HashMap
    public func fun_struct6(p1:Int32,p2!:HashMap<Int16, Array<Int32>> = HashMap<Int16, Array<Int32>>([(-16,arrayInt32)])) :HashMap<Int16, Array<Int32>>{
       p2[-16][1] = p1
       var res :HashMap<Int16, Array<Int32>> = p2
       return res
    }
}

public enum Enum_1 <: Hashable & Equatable<Enum_1> {
    | Year
    | Week(Int32)

    public func hashCode() : Int64 {
        return Int64(64)
    }
    public operator func ==() : Bool {
        return true
    }
    public operator func !=() : Bool {
        return false
    }

    public func fun_E1(p1: Float32,p2:(Int32,HashSet<Range<Int64>>,Array<Unit>),p3!:HashMap<Int16, UInt16> = HashMap<Int16, UInt16>([(16,51),(12,91)])) :(Float32,HashSet<Range<Int64>>,HashMap<Int16, UInt16>){
        var res :(Float32,HashSet<Range<Int64>>,HashMap<Int16, UInt16>) = (p1,p2[1],p3)
        return res
    }

    //非命名形参，返回一维数组
    public func fun_E2(p1: Int64,p2:Array<Int64>) :Array<Int64>{
       p2[0] = 2022711 - p1
       var res:Array<Int64> = p2
       return res
    }
    //非命名形参，返回多维数组
    public func fun_E3(p1: Int64,p2:Array<Array<Array<Int64>>>) :Array<Array<Array<Array<Int64>>>>{
       p2[0][0][0] = 20711 >> p1
       p2.reverse()
       var res :Array<Array<Array<Array<Int64>>>> = Array<Array<Array<Array<Int64>>>>([p2,p2])
       return res
    }
    //非命名形参，返回HashSet
    public func fun_E4(p1:HashSet<Float32>) :HashSet<Float32>{
       p1.reserve(3)
       var res :HashSet<Float32> = p1
       return res
    }
    //非命名形参，返回HashMap
    public func fun_E5(p1:HashMap<Int16, HashSet<String>>) :HashMap<Int16, HashSet<String>>{
       p1.reserve(-2)
       var res :HashMap<Int16, HashSet<String>> = p1
       return res
    }


}

