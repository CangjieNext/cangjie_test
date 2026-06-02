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

class CLS {
    var member_aaa: ArrayList<A> = ArrayList<A>([A(), A()])
    var member_bbb: ArrayList<String> = ArrayList<String>(["0.0", "0.o", "O.O", "o.o"])
    var member_ccc: ArrayList<E> = ArrayList<E>([E.K(1), E.M(2), E.B(3)])
    var member_ddd: HashMap<Int64, String> = HashMap<Int64, String>([(1, "0.0"), (2, "0.o")])
    var member_eee: HashMap<Int64, E> = HashMap<Int64, E>([(1, E.K(1)), (2, E.M(2)), (3, E.B(3))])
    var member_fff: HashSet<String> = HashSet<String>(["0.0", "0.o", "O.O", "o.o"])
}

main() {
    CLS()
    0
}
