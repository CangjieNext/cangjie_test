/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_composite

import std.collection.*

import pkg_class.*
import pkg_struct.*
import pkg_enum.*

let arrayTopInt8: Array<Int8> = [1, 2, 3]
var arrayTopcopy =  arrayTopInt8.clone()
var array_empty: Array<Array<Int64>> = Array<Array<Int64>>()  //空array

public let range_top1: Range<Int64> = 0..=10
public let range_top2: Range<Int64> = 10..0:-2
public let range_top3: Range<Int64> = 10..=0:-1
public let range_top4: Range<Int64> = 0..0:1  // Define an empty range.
public var map_top_1 : HashMap<Rune, Cla_1> = HashMap<Rune, Cla_1>([('\u{597d}',Cla_1(10)), ('Q',Cla_1(12))]) //Cla_1重写hashcode()
public var set_string_top1 : HashSet<String> = HashSet<String>(["`~!@#$%^&*()_+-=[{}]\\|:;'\",./? %……&*（）——+-={}【】、|：；‘“”“，。、？", "collection_HashSet"])
public var multiset_top1 : HashSet<Cla_1> = HashSet<Cla_1>([Cla_1(25), Cla_1(63)]) //Cla_1重写hashcode()

public class WithinArray {
    /*==========基础类型数组============*/
    public var arr_char :Array<Rune> = Array<Rune>(100,repeat:'\u{597d}') //
    public var arrayInt8 : Array<Int8> = [8,-10,-2]
    private var arr_pri1 : Array<Int8> = arrayInt8.clone() // private
    static let arr_static : Array<Int8> = [8,23,-2] //static
    public var arrayInt8_d : Array<Array<Int8>> = [arrayInt8,arrayInt8.clone()]

    public var arr_1 : Array<Int64> = Array<Int64>(1200, {i => i+1}) //给定数组大小和构造元素的函数创建Array
    public var arrayInt64 : Array<Int64> =[641,642,643,644]
    public var arrayInt64_d1 : Array<Array<Int64>> = [arrayInt64,arr_1]
    public var arrayInt64_d2 :Array<Array<Int64>> = Array<Array<Int64>>(90,repeat:{a: Int64 => Array<Int64>(a,{a => a+1})}(50))
    public var a_d :Array<Array<Int64>> = Array<Array<Int64>>([Array<Int64>(800, {i => i-1}),arr_1])
    public var arrayInt64_t1 : Array<Array<Array<Int64>>> = [a_d,arrayInt64_d1] //3维
    public var arrayInt64_q : Array<Array<Array<Array<Int64>>>> = [arrayInt64_t1,arrayInt64_t1] //4维
    public var arrayInt64_p : Array<Array<Array<Array<Array<Int64>>>>> = Array<Array<Array<Array<Array<Int64>>>>>(2,repeat:arrayInt64_q) //5维

    public var arrayUInt8 : Array<UInt8> = [11, 12, 13, 14, 15]
    public let arrayUInt8_d : Array<Array<UInt8>> = [arrayUInt8,arrayUInt8]

    public var arrayUInt64 : Array<UInt64> = [41, 42, 43, 44, 45, 46, 47, 48]
    public var arrayUInt64_d : Array<Array<UInt64>> = [arrayUInt64,arrayUInt64]

    public var arrayFloat16 : Array<Float16> = [1.1, 2.2]
    public var arrayFloat16_d : Array<Array<Float16>> = [arrayFloat16,arrayFloat16]

    public static var arrayFloat32 : Array<Float32> = [32.1, 32.2, 32.3]
    public static let arr_static_D2 : Array<Array<Float32>> = [arrayFloat32,arrayFloat32,[0.1f32, 12.2f32]]

    public var arrayFloat64 : Array<Float64> = [64.1, 64.2, 64.3, 64.4]
    public var arrayFloat64_d : Array<Array<Float64>> = [arrayFloat64,arrayFloat64]
    private var arr_pri_D2 : Array<Array<Float64>> = arrayFloat64_d

    public var arrayChar : Array<Rune> =['a', 'b', '\\', '\u{597d}', '\"', 'f', 'g', 'h', 'i', 'j']
    public var arrayChar_d : Array<Array<Rune>> = [arrayChar,arrayChar]

    public var arrayBool : Array<Bool> = [true, 'A'!='A', false, 'A'>='A' , true, 'A' is Rune, true]
    public var arrayBool_d : Array<Array<Bool>> = [arrayBool,arrayBool]

    /*==========复合类型数组============*/
    public let cla_ins = WithinString()
    public var array_str_1 : Array<String> =[cla_ins.arr_str1,cla_ins.arr_str17, cla_ins.arr_str2, cla_ins.arr_str3, cla_ins.arr_str4, cla_ins.arr_str5, cla_ins.arr_str6]
    public var array_str_2 : Array<String> =[cla_ins.arr_str7, cla_ins.arr_str8, cla_ins.arr_str9, cla_ins.arr_str10, cla_ins.arr_str11, cla_ins.arr_str12, cla_ins.arr_str13]

    public var array_str_3 : Array<String> =[cla_ins.arr_str1, cla_ins.arr_str14, cla_ins.arr_str15]
    //单行拼接单行
    public var array_str_4 : Array<String> =[cla_ins.arr_str5+cla_ins.arr_str15,cla_ins.arr_str8+cla_ins.arr_str6 , cla_ins.arr_str15]
   //多行字符串
    public var array_str_5 : Array<String> =[cla_ins.arr_str11+cla_ins.arr_str12,cla_ins.arr_str11+cla_ins.arr_str14 , cla_ins.arr_str14+cla_ins.arr_str15]
   //混拼
    public var array_str_6 : Array<String> =[cla_ins.arr_str6+cla_ins.arr_str11,cla_ins.arr_str9+cla_ins.arr_str14,cla_ins.arr_str3+cla_ins.arr_str14 , cla_ins.arr_str8+cla_ins.arr_str14]
    //多维
   public var multiArr_str_d1 : Array<Array<String>> = [array_str_1,array_str_2]
   public var multiArr_str_d2 : Array<Array<String>> = [array_str_1,array_str_3,array_str_4,array_str_5]
   public var multiArr_str_d3 : Array<Array<String>> = [array_str_4,array_str_5,array_str_6]

   public var multiArr_str_t1 : Array<Array<Array<String>>>= Array<Array<Array<String>>>([multiArr_str_d1,multiArr_str_d2])
   public var multiArr_str_t2 : Array<Array<Array<String>>>= Array<Array<Array<String>>>([multiArr_str_d2,multiArr_str_d3])

   public var multiArr_str_q : Array<Array<Array<Array<String>>>> = [multiArr_str_t1,multiArr_str_t2]
    public var multiArr_str_empty : Array<Array<Array<String>>>= Array<Array<Array<String>>>()
    //（非）泛型类做数组元素
    public var array_mc_1 : Array<ClassViaInherit> = [ClassViaInherit(32,par_2:21), ClassViaInherit()]
    public var multiArr_mc_d1 : Array<Array<ClassViaInherit>> = [array_mc_1,array_mc_1.clone()]
    public var array_mc_2 : Array<ClassViaInherit> = [subCla_1(), ClassViaInherit(32,par_2:56)]
    public var multiArr_mc_d2 : Array<Array<ClassViaInherit>> = [array_mc_2,array_mc_1] //非泛型继承类做数组元素

    public var multiArr_mcg_1 : Array<ClaInsViaGenerices<UInt32,Float16>> = [ClaInsViaGenerices<UInt32,Float16>(32,32.2655),ClaInsViaGenerices<UInt32,Float16>(312,422.2675)]
    public var multiArr_mcg_d1 : Array<Array<ClaInsViaGenerices<UInt32,Float16>>> = [multiArr_mcg_1.clone(),multiArr_mcg_1]  //泛型类数组
    public var multiArr_mcg_2 : Array<ClaInsViaGenerices<UInt32,Float16>> = [SubClaViaViaGenerices<UInt32,Float16,Bool>(12,12.2954),ClaInsViaGenerices<UInt32,Float16>(32,32.2655)]
    public var multiArr_mcg_d2 : Array<Array<ClaInsViaGenerices<UInt32,Float16>>> = [multiArr_mcg_2.clone(),multiArr_mcg_2]

    //（非）泛型struct做数组元素
    public var array_ms_1 : Array<StructViaExtend> = [StructViaExtend(32,21), StructViaExtend(69,457)]
    public var multiArr_ms_d1 : Array<Array<StructViaExtend>> = [array_ms_1,array_ms_1.clone()]

    public var multiArr_msg_1 : Array<R2<UInt32,Float16>> = [R2<UInt32,Float16>(32,32.2655),R2<UInt32,Float16>(312,422.2675)]
    public var multiArr_msg_d1 : Array<Array<R2<UInt32,Float16>>> = [multiArr_msg_1.clone(),multiArr_msg_1]  //泛型struct数组

    //（非）泛型enum做数组元素
    public var array_me_1 : Array<TimeUnit1> = [TimeUnit1.Year(19), TimeUnit1.Year]
    public var multiArr_me_d1 : Array<Array<TimeUnit1>> = [array_me_1,array_me_1.clone()]

    public var multiArr_meg_1 : Array<TimeUnit2<Int32,Int32>> = [TimeUnit2<Int32,Int32>.Year(32),TimeUnit2<Int32,Int32>.Year(256)]
    public var multiArr_meg_d1 : Array<Array<TimeUnit2<Int32,Int32>>> = [multiArr_meg_1.clone(),multiArr_meg_1]  //泛型enum数组

    public var multiArr_Unit :Array<Unit> = [(),()]
    public var multiArr_Range :Array<Range<Int64>> = Array<Range<Int64>>([range_top1,range_top2,range_top3,range_top4])
    public var multiArr_Tuple :Array<(Int64,Float32,Bool,Rune)> = Array<(Int64,Float32,Bool,Rune)>([(64,32.213,32.213 is Float32,'H'),(114,2.658,true,'Z')])
    public var multiArr_set :Array<HashSet<Cla_1>> = Array<HashSet<Cla_1>>([multiset_top1,multiset_top1])
    public var multiArr_map :Array<HashMap<Rune, Cla_1>> = Array<HashMap<Rune, Cla_1>>([map_top_1,map_top_1])

    //ArrayList
    public let list1 :ArrayList<Int64> = ArrayList<Int64>([95, 1, 2,5684443])
    public let list2 :ArrayList<Rune> = ArrayList<Rune>(['b', '\\', '\u{597d}', '\"'])
    public let list3 :ArrayList<Float16> = ArrayList<Float16>([0.1235, 1.1245, 2.4578])
    public var list_set_str : ArrayList<HashSet<String>> = ArrayList<HashSet<String>>([set_string_top1, HashSet<String>(["仓颉中文字符串测试","1 + 1"])])
    public var list_map_cla : ArrayList<HashMap<Rune, Cla_1>> = ArrayList<HashMap<Rune, Cla_1>>([map_top_1])
    public var list_list_Char : ArrayList<ArrayList<Rune>> = ArrayList<ArrayList<Rune>>([list2,list2])

    public var arr_list_set : Array<ArrayList<HashSet<String>>> = [list_set_str,list_set_str]


}
