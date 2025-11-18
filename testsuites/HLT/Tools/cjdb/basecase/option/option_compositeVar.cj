/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

main() {
    // Array-type
    var Arr_I8: ?Array<Int8> = [1,2,3,4]
    var Arr_I16: ?Array<Int16> = [1,2,3,4]
    var Arr_I32: ?Array<Int32> = [1,2,3,4]
    var Arr_I64: ?Array<Int64> = Some([1,2,3,4])
    var Arr_none: ?Array<Int64> = None

    // Arraylist-type
    let Arrlist_F16: ?ArrayList<Float16> = Some(ArrayList<Float16>([16.0, 128.0]))
    let Arrlist_F64: ?ArrayList<Float64> = Some(ArrayList<Float64>([16.0, 128.0]))
    let Arrlist_bool: ?ArrayList<Bool> = Some(ArrayList<Bool>([true, false]))
    let Arrlist_char: ?ArrayList<Rune> = Some(ArrayList<Rune>([r'c', r'a', r'n', r'g', r'j', r'i', r'e']))
    var Arrlist_none: ?ArrayList<Int64> = None

    // Hashset-type
    let Hset_I64: ?HashSet<Int64> = Some(HashSet<Int64>([1,2,3,4]))
    let Hset_F64: ?HashSet<Float64> = Some(HashSet<Float64>([16.0, 128.0]))
    let Hset_String: ?HashSet<String> = Some(HashSet<String>(["CANGJIE", "HELLLO", "WORLD"]))
    let Hset_none: ?HashSet<String> = None

    // HashMap-type
    var Hmap_IS: ?HashMap<Int64, String> = HashMap<Int64, String>([(1,"cangjie"), (2, "hello")])
    var Hmap_BC: ?HashMap<Bool, Rune> = HashMap<Bool, Rune>([(true,r'c'), (false, r'w')])
    let Hmap_none: ?HashMap<Bool, Rune> = None

    // option-option
    var Arr_arr: ??Array<Int16> = [1,3,4]
    var Arrlist_arrlist: ??ArrayList<Int64> = ArrayList<Int64>([1,3,4])
    var Hset_hset: ???HashSet<String> =  HashSet<String>(["CANGJIE", "HELLLO", "WORLD"])
    var Hmap_hmap: ???HashMap<Int64, String> = HashMap<Int64, String>([(1,"cangjie"), (2, "hello")])
}
