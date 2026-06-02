/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*


var set_top_uint32 : HashSet<UInt32> = HashSet<UInt32>([32,126,5,6978,13354])
var set_top_empty_uint32 : HashSet<UInt32> = HashSet<UInt32>()
main() {
    var set_int8 : HashSet<Int8> = HashSet<Int8>([76,9,-7])
    var set_int16 : HashSet<Int16> = HashSet<Int16>([9,24,12])
    set_int8.add(-12)
    var set_int32 : HashSet<Int32> = HashSet<Int32>([-74,9,-6954])
    var set_int64 : HashSet<Int64> = HashSet<Int64>(260,
    {i => i+1000}) //超长
	var set_uint8 : HashSet<UInt8> = HashSet<UInt8>([4,9,6])
    set_int32.remove(-6954)
	var set_uint16 : HashSet<UInt16> = HashSet<UInt16>([49,56])
	var set_uint32 : HashSet<UInt32> = HashSet<UInt32>([9458,625654,12])
	var set_uint64 : HashSet<UInt64> = HashSet<UInt64>([2000, 12,46,897])
	var set_uint64_size :UInt64 = UInt64(set_uint64.size)
	set_uint64.add(set_uint64_size)
	var set_float16 : HashSet<Float16> = HashSet<Float16>([6.5, 8.4])
	var set_float32 : HashSet<Float32> = HashSet<Float32>([63.56744, 8.423567])
	var set_float64 : HashSet<Float64> = HashSet<Float64>([-637.5986555, 89.1221124])
	var set_char : HashSet<Rune> = HashSet<Rune>([r'h', r'y', r'$'])
	var set_bool : HashSet<Bool> = HashSet<Bool>([true,false,false,true,true])




  return -1
}
