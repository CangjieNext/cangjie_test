// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.collection.*

class A {
    var cls = 500
}

enum E {
    K(Int64) | M(Int64) | B(Int64)
}

main() {
    var local_aaa: ?ArrayList<A> = Some(ArrayList<A>([A(), A()]))
    var local_bbb: ?ArrayList<A> = None
    var local_ccc: ?ArrayList<String> = Some(ArrayList<String>(["0.0", "0.o", "O.O", "o.o"]))
    var local_ddd: ?ArrayList<String> = None
    var local_fff: ?ArrayList<E> = Some(ArrayList<E>([E.K(1), E.M(2), E.B(3)]))
    var local_ggg: ?ArrayList<E> = None
    var local_hhh: ?HashMap<Int64, String> = Some(HashMap<Int64, String>([(1, "0.0"), (2, "0.o")]))
    var local_iii: ?HashMap<Int64, String> = None
    var local_jjj: ?HashMap<Int64, E> = Some(HashMap<Int64, E>([(1, E.K(1)), (2, E.M(2)), (3, E.B(3))]))
    var local_kkk: ?HashMap<Int64, E> = None
    var local_lll: ?HashSet<String> = Some(HashSet<String>(["0.0", "0.o", "O.O", "o.o"]))
    var local_mmm: ?HashSet<String> = None
    0
}
