/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_composite

import std.collection.*


public class WithinHashMap {
    let cla_ins_2 = WithinArray()
    let cla_ins_4 = WithinHashSet()
    public let map_main_1 : HashMap<Int8, UInt8> = HashMap<Int8, UInt8>([(-3,42), (2,12),(-76,165)])
    public var map_main_2 : HashMap<Int16, UInt16> = HashMap<Int16, UInt16>([(-39,150), (-90,1662),(76,675)])
    public var map_main_3 : HashMap<Int32, UInt32> = HashMap<Int32, UInt32>([(-329,1750), (-910,1732),(-76,1675)])
    private var map_pri : HashMap<Int32, UInt32> = map_main_3.clone() //private
    static var map_static : HashMap<Int32, UInt32> = HashMap<Int32, UInt32>([(-379,1550), (-10,1732),(-76,1675)]) //static
    public var map_main_4 : HashMap<Int32, UInt32> = WithinHashMap.getLargeMap() //size大于100
    public var map_main_5 : HashMap<Int64, UInt64> = HashMap<Int64, UInt64>([(-759,17550), (-830,18972),(906,32245)])
    public var map_main_6 : HashMap<UInt16, Int64> = HashMap<UInt16, Int64>([(12,17750), (23,1836),(56,3594)])
    public var map_main_7 : HashMap<Float16, Float32> = HashMap<Float16, Float32>([(1.2,17.750),(2.3,1.836),(5.6,3.594)])
    public var map_main_8 : HashMap<Float32, Float64> = HashMap<Float32, Float64>([(12.15654,1.7755560), (2.457563,1.2545836),(5.6,35.45778794)])
    public var map_main_9 : HashMap<Int32, Rune> = HashMap<Int32, Rune>([(-29,'C'), (-10,'\\'),(76,'N')])
    public var map_main_10 : HashMap<Int64, Bool> = HashMap<Int64, Bool>([(129,true), (-1560,false),(756,true)])

    public var map_main_11 : HashMap<Rune, Cla_1> = HashMap<Rune, Cla_1>([('\u{597d}',Cla_1(10)), ('Q',Cla_1(12))]) //Cla_1重写hashcode()
    public var map_main_12 : HashMap<Cla_1, C1<Int64>> = HashMap<Cla_1, C1<Int64>>([(Cla_1(1),C1<Int64>(642598))]) // Cla_1重写hashcode() ,value为C1<Int64>
    public var map_main_13 : HashMap<Bool, Cla_1> = HashMap<Bool, Cla_1>([(true,Cla_1(4)),('\\' is Rune,Cla_1(6))])
    public var map_main_14 : HashMap<UInt32, UInt32> = HashMap<UInt32, UInt32>() //空map
    public var map_main_15 : HashMap<Struct_1, Cla_1> = HashMap<Struct_1, Cla_1>([(Struct_1(16),Cla_1(10)), (Struct_1(69),Cla_1(12))]) //Cla_1 Struct_1重写hashcode()
    public var map_main_16 : HashMap<String, TimeUnit1> = HashMap<String, TimeUnit1>([("Enum_1",TimeUnit1.Year), ("Enum_2",TimeUnit1.Year(-32))]) //value为非泛型enum
    public var map_main_17 : HashMap<String, TimeUnit2<Int32,UInt16>> = HashMap<String, TimeUnit2<Int32,UInt16>>([("Enum_g1",TimeUnit2<Int32,UInt16>.Year(32)), ("Enum_g2",TimeUnit2<Int32,UInt16>.Year(-32,69))]) //value为泛型enum
    public var map_main_18 : HashMap<String, R2<Float16,UInt64>> = HashMap<String, R2<Float16,UInt64>>([("struct_1",R2<Float16,UInt64>(16.2359,695478)), ("struct_2",R2<Float16,UInt64>(19.2364,75268))]) //value为泛型struct实例
    public var map_main_19 : HashMap<Enum_1, ClassViaInherit> = HashMap<Enum_1, ClassViaInherit>([(Enum_1.Week(56),ClassViaInherit(369,par_2: -32)), (Enum_1.Year,ClassViaInherit())]) //Enum_1重写hashcode()

    public var map_list_1 : HashMap<UInt8, ArrayList<Rune>> = HashMap<UInt8, ArrayList<Rune>>([(3,cla_ins_2.list2), (18,cla_ins_2.list2)])  // map的value值是List
    public var map_list_2 : HashMap<String, ArrayList<HashSet<String>>> = HashMap<String, ArrayList<HashSet<String>>>([("list_set_str",cla_ins_2.list_set_str)])
    public var map_list_3 : HashMap<String, ArrayList<HashMap<Rune, Cla_1>>> = HashMap<String, ArrayList<HashMap<Rune, Cla_1>>>([("list_map_cla",cla_ins_2.list_map_cla)])

    public var map_set_1 : HashMap<Int8, HashSet<Int32>> = HashMap<Int8, HashSet<Int32>>([(3,cla_ins_4.set_int32), (28,cla_ins_4.set_int32)])  // map的value值是Set
    public var map_set_2 : HashMap<Int16, HashSet<String>> = HashMap<Int16, HashSet<String>>([(13,cla_ins_4.set_string_1), (-62,cla_ins_4.set_string_2),(564,cla_ins_4.set_string_4)])
    public var map_set_3 : HashMap<String, HashSet<Cla_1>> = HashMap<String, HashSet<Cla_1>>([("13",cla_ins_4.multiset_1), ("key_str",cla_ins_4.multiset_1)])

    public var map_array_1 : HashMap<String, Array<Array<String>>> = HashMap<String, Array<Array<String>>>([("Hello Cangjie Lang\nthis is a new line",cla_ins_2.multiArr_str_d3), ("`~!@#$%^&*()_+-=[{}]\\|:;'\",./? %……&*（）——+-={}【】、|：；‘“”“，。、？",cla_ins_2.multiArr_str_d2)])  // map的value值是array
    public var map_array_2 : HashMap<Bool, Array<HashSet<Cla_1>>> = HashMap<Bool, Array<HashSet<Cla_1>>>([(2 <= 1+2,cla_ins_2.multiArr_set)])

    public var map_map_1 : HashMap<Int64, HashMap<Float32, Float64>> = HashMap<Int64, HashMap<Float32, Float64>>([(-32689,map_main_8), (2548,map_main_8)])  // map的value值是Map
    public var map_map_2 : HashMap<String, HashMap<String, Array<Array<String>>>> = HashMap<String, HashMap<String, Array<Array<String>>>>([("-32689",map_array_1), ("map_arr",map_array_1)])
    public var map_map_3 : HashMap<Float16, HashMap<Rune, HashSet<Cla_1>>> = HashMap<Float16, HashMap<Rune, HashSet<Cla_1>>>([(7.68,HashMap<Rune, HashSet<Cla_1>>([('\\',cla_ins_4.multiset_1),('K',cla_ins_4.multiset_1)]))])  // map的value值是Map
    public var map_map_4 : HashMap<Cla_1, HashMap<Bool,Array<HashSet<Cla_1>>>> = HashMap<Cla_1, HashMap<Bool,Array<HashSet<Cla_1>>>>([(Cla_1(-3278),map_array_2), (Cla_1(2536),map_array_2)])  // map的value值是Map
    public var map_map_5 : HashMap<Cla_1, HashMap<Struct_1, Cla_1>> = HashMap<Cla_1, HashMap<Struct_1, Cla_1>>([(Cla_1(15),map_main_15), (Cla_1(16),map_main_15)])  // map的value值是Map

    public var map_Unit:HashMap<Range<Int64>,Unit> = HashMap<Range<Int64>,Unit>([(cla_ins_4.range_1,()),(cla_ins_4.range_3,())])
    public var map_Range:HashMap<Float32,Range<Int64>> = HashMap<Float32,Range<Int64>>([(12.364,cla_ins_4.range_2),(3.6547,cla_ins_4.range_4)])


    static func getLargeMap() :HashMap<Int32, UInt32>{
        var map_f1 : HashMap<Int32, UInt32> = HashMap<Int32, UInt32>([(-32,32)])
        for(i in 0..120){
            map_f1.add(Int32(i+1),UInt32(i+100))
        }
       return map_f1
    }

}

