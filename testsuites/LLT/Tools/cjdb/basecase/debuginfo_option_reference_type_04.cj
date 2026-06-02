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

struct S {
    var member_aaa: ?ArrayList<A> = Some(ArrayList<A>([A(), A()]))
    var member_bbb: ?ArrayList<A> = None
    var member_ccc: ?ArrayList<String> = Some(ArrayList<String>(["0.0", "0.o", "O.O", "o.o"]))
    var member_ddd: ?ArrayList<String> = None
    var member_fff: ?ArrayList<E> = Some(ArrayList<E>([E.K(1), E.M(2), E.B(3)]))
    var member_ggg: ?ArrayList<E> = None
    var member_hhh: ?HashMap<Int64, String> = Some(HashMap<Int64, String>([(1, "0.0"), (2, "0.o")]))
    var member_iii: ?HashMap<Int64, String> = None
    var member_jjj: ?HashMap<Int64, E> = Some(HashMap<Int64, E>([(1, E.K(1)), (2, E.M(2)), (3, E.B(3))]))
    var member_kkk: ?HashMap<Int64, E> = None
    var member_lll: ?HashSet<String> = Some(HashSet<String>(["0.0", "0.o", "O.O", "o.o"]))
    var member_mmm: ?HashSet<String> = None
}

main() {
    S()
    0
}
