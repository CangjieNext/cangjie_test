/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class A {
    var I64: ?Int64 = Some(16)
    var UI64: ?UInt64 = Some(16)
    var F16: ?Float16 = Some(16.0)
    let Bool_F: ?Bool = Some(false)
    let Char_c: ?Rune = Some(r'c')
    var s_native: ?String = Some("helloCangjie")
    var Arr_I64: ?Array<Int64> = Some([1,2,3,4])
    let Arrlist_char: ?ArrayList<Rune> = Some(ArrayList<Rune>([r'c', r'a', r'n', r'g', r'j', r'i', r'e']))
    let Hset_String: ?HashSet<String> = Some(HashSet<String>(["CANGJIE", "HELLLO", "WORLD"]))
    var Hmap_BC: ?HashMap<Bool, Rune> = HashMap<Bool, Rune>([(true,r'c'), (false, r'w')])
    var Hmap_hmap: ???HashMap<Int64, String> = HashMap<Int64, String>([(1,"cangjie"), (2, "hello")])
}

struct B {
    var Inative: Option<IntNative> = Some(128)
    var UI64: Option<UInt64> = Some(64)
    let BB: ?UInt8 = Some(UInt8(UInt32(r'\n')))
    var F32: Option<Float32> = Some(2.4e-1)
    var Arr_none: ?Array<Int64> = None
    let Arrlist_char: ?ArrayList<Rune> = Some(ArrayList<Rune>([r'c', r'a', r'n', r'g', r'j', r'i', r'e']))
    let Hset_F64: ?HashSet<Float64> = Some(HashSet<Float64>([16.0, 128.0]))
    var Hmap_IS: ?HashMap<Int64, String> = HashMap<Int64, String>([(1,"cangjie"), (2, "hello")])
    var Hset_hset: ???HashSet<String> =  HashSet<String>(["CANGJIE", "HELLLO", "WORLD"])
}

enum C {
    | C1(?Int64) | C2(Option<Float32>) | C3(?ArrayList<Rune>) | C4(?HashSet<Float64>) | C5(?HashMap<Int64, String>)
}

main() {
    var a: A = A()
    var b: B = B()

    var c1 = C.C1(Some(16))
    var c2 = C.C2(Some(2.4e-1))
    var c3 = C.C3(Some(ArrayList<Rune>([r'c', r'a', r'n', r'g', r'j', r'i', r'e'])))
    var c4 = C.C4(HashSet<Float64>([16.0, 128.0]))
    var c5 = C.C5(HashMap<Int64, String>([(1,"cangjie"), (2, "hello")]))
}
