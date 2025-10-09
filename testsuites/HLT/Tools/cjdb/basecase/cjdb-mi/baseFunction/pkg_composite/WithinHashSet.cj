/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_composite

import std.collection.*


public class WithinHashSet{
    public let range_1: Range<Int64> = 0..=10
    public let range_2: Range<Int64> = 10..0:-2
    public let range_3: Range<Int64> = 10..=0:-1
    public let range_4: Range<Int64> = 0..0:1  // Define an empty range.

    public let set_int8 : HashSet<Int8> = HashSet<Int8>([76,9,-7])
    public var set_int16 : HashSet<Int16> = HashSet<Int16>([9,24,12])
    public var set_int32 : HashSet<Int32> = HashSet<Int32>([-74,9,-6954])
    public var set_int64 : HashSet<Int64> = HashSet<Int64>(260,{i => i+1000}) //超长
	public var set_uint8 : HashSet<UInt8> = HashSet<UInt8>([4,9,6])
	public var set_uint16 : HashSet<UInt16> = HashSet<UInt16>([49,56])
	private var set_pri : HashSet<UInt16> = set_uint16.clone() // private
	static var set_static : HashSet<UInt16> = HashSet<UInt16>([429,79,56]) //static
	public var set_uint32 : HashSet<UInt32> = HashSet<UInt32>([9458,625654,12])
	public static let set_uint64 : HashSet<UInt64> = HashSet<UInt64>([2000, 12,46,897])
	public var set_uint64_size :UInt64 = UInt64(set_uint64.size)
	public var set_float16 : HashSet<Float16> = HashSet<Float16>([6.5, 8.4])
	public var set_float32 : HashSet<Float32> = HashSet<Float32>([63.56744, 8.423567])
	public let set_float64 : HashSet<Float64> = HashSet<Float64>([-637.5986555, 89.1221124])
	public var set_char : HashSet<Rune> = HashSet<Rune>(['h', 'C','\\','\u{597d}'])
	public var set_bool : HashSet<Bool> = HashSet<Bool>(['\\' is Rune,false,12 >> 2 < 1,true,true])

    let cla_ins = WithinString()
    public var set_string_1 : HashSet<String> = HashSet<String>([cla_ins.arr_str17, "collection_HashSet",cla_ins.arr_str1, cla_ins.arr_str16])
    public var set_string_2 : HashSet<String> = HashSet<String>([cla_ins.arr_str2,cla_ins.arr_str4,cla_ins.arr_str5, cla_ins.arr_str6,cla_ins.arr_str7,cla_ins.arr_str8]) //单行
    public var set_string_3 : HashSet<String> = HashSet<String>([cla_ins.arr_str11, cla_ins.arr_str12,cla_ins.arr_str13]) //多行
    public var set_string_4 : HashSet<String> = HashSet<String>([cla_ins.arr_str9, cla_ins.arr_str10,cla_ins.arr_str14,cla_ins.arr_str15])//单 多混排

    public var multiset_1 : HashSet<Cla_1> = HashSet<Cla_1>([Cla_1(25), Cla_1(63)]) //Cla_1重写hashcode()
    public var multiset_2 : HashSet<Struct_1> = HashSet<Struct_1>([Struct_1(56), Struct_1(894)]) //Struct_1重写hashcode()
    public var multiset_3 : HashSet<Enum_1> = HashSet<Enum_1>([Enum_1.Week(56), Enum_1.Year]) //Enum_1重写hashcode()
    public var multiset_4 : HashSet<Range<Int64>> = HashSet<Range<Int64>>([range_1,range_2,range_3,range_4])



}
