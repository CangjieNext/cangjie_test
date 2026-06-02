/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

main() {
    // Int-type
    var Arrlist_I8: ArrayList<Int8> = ArrayList<Int8>([1,2,3,4])
    var Arrlist_I16: ArrayList<Int16> = ArrayList<Int16>([1,2,3,127])
    var Arrlist_I32: ArrayList<Int32> = ArrayList<Int32>([1,2,3,1023])
    var Arrlist_I64: ArrayList<Int64> = ArrayList<Int64>([1,2,3,2048])

    // UInt-type
    var Arrlist_UI8: ArrayList<UInt8> = ArrayList<UInt8>([1,2,3,4,UInt8(UInt32(r'x'))])
    var Arrlist_UI16: ArrayList<UInt16> = ArrayList<UInt16>([1,2,3,127])
    var Arrlist_UI32: ArrayList<UInt32> = ArrayList<UInt32>([1,2,3,1023])
    var Arrlist_UI64: ArrayList<UInt64> = ArrayList<UInt64>([1,2,3,2048])

    // Float-type
    let Arrlist_F16: ArrayList<Float16> = ArrayList<Float16>([16.0, 128.0])
    let Arrlist_F32: ArrayList<Float32> = ArrayList<Float32>([16.0, 128.0])
    let Arrlist_F64: ArrayList<Float64> = ArrayList<Float64>([16.0, 128.0])

    // Bool-char-unit
    let Arrlist_bool: ArrayList<Bool> = ArrayList<Bool>([true, false])
    let Arrlist_rune: ArrayList<Rune> = ArrayList<Rune>([r'c', r'a', r'n', r'g', r'j', r'i', r'e'])
    let Arrlist_unit: ArrayList<Unit> = ArrayList<Unit>([(), ()])

    // Modify  
    Arrlist_I8[0] = 8
    Arrlist_UI16.add(99, at: 1)
    Arrlist_F64.add(all: [99.0,88.0], at: 1)
    Arrlist_bool.add(true)
    Arrlist_rune.add(all: [r'h',r'e',r'y'])
    Arrlist_I8.remove(at: 1)
    
    return 0
}
