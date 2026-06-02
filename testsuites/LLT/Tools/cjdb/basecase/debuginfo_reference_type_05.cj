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

func foo(para_aaa: ArrayList<A>, para_bbb: ArrayList<String>, para_ccc: ArrayList<E>, para_ddd: HashMap<Int64, String>, para_eee: HashMap<Int64, E>, para_fff: HashSet<String>) {
    0
}

main() {
    var local_aaa: ArrayList<A> = ArrayList<A>([A(), A()])
    var local_bbb: ArrayList<String> = ArrayList<String>(["0.0", "0.o", "O.O", "o.o"])
    var local_ccc: ArrayList<E> = ArrayList<E>([E.K(1), E.M(2), E.B(3)])
    var local_ddd: HashMap<Int64, String> = HashMap<Int64, String>([(1,"0.0"), (2, "0.o")])
    var local_eee: HashMap<Int64, E> = HashMap<Int64, E>([(1, E.K(1)), (2, E.M(2)), (3, E.B(3))])
    var local_fff: HashSet<String> = HashSet<String>(["0.0", "0.o", "O.O", "o.o"])
    foo(local_aaa, local_bbb, local_ccc, local_ddd, local_eee, local_fff)
    0
}