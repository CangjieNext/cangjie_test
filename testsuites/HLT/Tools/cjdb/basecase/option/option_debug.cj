/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

let globals_UI8: Option<UInt8> = Some(8)
let globals_UI16: ?UInt16 = Some(16)
let globals_UI32: Option<UInt32> = Some(32)
let globals_UI64: ?UInt64 = Some(64)
let globals_I8: Option<Int8> = Some(8)
let globals_I16: ?Int16 = Some(16)
let globals_I32: Option<Int32> = Some(32)
let globals_I64: ?Int64 = Some(64)
let globals_F16: ?Float16 = Some(16.16)
let globals_F32: Option<Float32> = Some(32.32)
let globals_F64: ?Float64 = Some(64.64)
var globals_Bool: Option<Bool> = Some(true)
let globals_Range: Option<Range<Int64>> = Some(1..10 : 1)
var globals_arrl: Option<ArrayList<Rune>> = Some(ArrayList<Rune>([r'a', r'b']))
let globals_ophm_none: ?HashMap<String, Bool> = None
var globals_arr_none: Option<Array<Range<Int64>>> = None

func test_optionhs(optiona: Option<HashMap<String, Bool>>, option_none: Option<HashMap<String, Bool>>) {
    var a = optiona
    return 0
}

func test_optionarrl(optiona: Option<ArrayList<Rune>>, option_none: Option<ArrayList<Rune>>) {
    var a = optiona
    return 0
}

main(): Int64 {
    let UI8: Option<UInt8> = Some(8)
    let UI16: ?UInt16 = Some(16)
    let UI32: Option<UInt32> = Some(32)
    let UI64: ?UInt64 = Some(64)
    var I8: Option<Int8> = Some(8)
    var I16: ?Int16 = Some(16)
    var I32: Option<Int32> = Some(32)
    var I64: ?Int64 = Some(64)
    let F16: ?Float16 = Some(16.16)
    let F32: Option<Float32> = Some(32.32)
    let F64: ?Float64 = Some(64.64)
    let Str: ?String = Some("Cangjie")
    let Run1: Option<Rune> = Some(r'a')
    var hm: HashMap<String, Bool> = HashMap<String, Bool>([("aaa", true)])
    var ophm: ?HashMap<String, Bool> = Some(hm)
    var ophm_none: ?HashMap<String, Bool> = None
    let hs: HashSet<Float64> = HashSet<Float64>([12.12, 13.13])
    var ophs: Option<HashSet<Float64>> = Some(hs)
    var ophs_none: Option<HashSet<Float64>> = None
    var oparrl: Option<ArrayList<Rune>> = Some(ArrayList<Rune>([r'a', r'b']))
    var oparrl_none: Option<ArrayList<Rune>> = None
    var vr: Range<Int64> = 1..10 : 1
    var arr: Array<Range<Int64>> = [vr, vr]
    let oap: Option<Array<Range<Int64>>> = Some(arr)
    let oap_none: Option<Array<Range<Int64>>> = None
    test_optionhs(ophm, ophm_none)
    test_optionarrl(oparrl, oparrl_none)
    let test_lambda = {
        a: Option<Array<Range<Int64>>>, 
        b: Option<Rune>, 
        c: Option<HashSet<Float64>>, 
        d: Option<ArrayList<Rune>>, 
        e: Option<HashSet<Float64>>, 
        f: Option<Array<Range<Int64>>>
        => 
        print("a")
    }(oap, Run1, ophs, oparrl_none, ophs_none, oap_none)
    return 0
}
