import std.collection.*

var array1: Array<String> = ["aa", "bb"]
var array2: Array<Int64> = [1, 2]
var array3: Array<Array<String>> = [array1]
var set_top_uint32: HashSet<Int32> = HashSet<Int32>([32, 126, 5, 6978, 13354])
var Arrlist_I8: ArrayList<Int8> = ArrayList<Int8>([1, 2, 3, 4])
var map_top_k_int8: HashMap<Int8, Int16> = HashMap<Int8, Int16>([(-3, -42), (2, 12), (-72, 1682)])
var map_array_1 = HashMap<Int16, Array<Int64>>([(3, array2)])
var map_array_2: HashMap<String, Array<Array<String>>> = HashMap<String, Array<Array<String>>>(
    [('a', array3), ('b', array3)])
var map_array_3 = HashMap<String, HashSet<Int32>>([("a", set_top_uint32)])
var map_array_4 = HashMap<Int16, ArrayList<Int8>>()
var map_array_5 = HashMap<Int64, ArrayList<Int8>>([(1, Arrlist_I8)])
var map_array_6 = HashMap<Float64, HashMap<Int8, Int16>>([(1.0, map_top_k_int8), (2.0, map_top_k_int8)])

main() {
    var array1: Array<String> = ["aa", "bb"]
    var array2: Array<Int64> = [1, 2]
    var array3: Array<Array<String>> = [array1]
    var set_top_uint32: HashSet<Int32> = HashSet<Int32>([32, 126, 5, 6978, 13354])
    var Arrlist_I8: ArrayList<Int8> = ArrayList<Int8>([1, 2, 3, 4])
    var map_top_k_int8: HashMap<Int8, Int16> = HashMap<Int8, Int16>([(-3, -42), (2, 12), (-72, 1682)])

    var map_array_1 = HashMap<Int16, Array<Int64>>([(3, array2)])
    var map_array_2: HashMap<String, Array<Array<String>>> = HashMap<String, Array<Array<String>>>(
        [('a', array3), ('b', array3)])
    var map_array_3 = HashMap<String, HashSet<Int32>>([("a", set_top_uint32)])
    var map_array_4 = HashMap<Int16, ArrayList<Int8>>()
    var map_array_5 = HashMap<Int64, ArrayList<Int8>>([(1, Arrlist_I8)])
    var map_array_6 = HashMap<Float64, HashMap<Int8, Int16>>([(1.0, map_top_k_int8), (2.0, map_top_k_int8)])
    0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
