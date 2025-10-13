class A {
    func a(b: Int32)
    : Unit {}
    func b(m!: Int32)
    : Unit {}
    func c(m!: Int64, n!: ?Int32 = Some(3))
    : Unit {}

    static func d(g: (Int32), h!: (Int32, Int32) = (1,2))
    : Unit {}

    init(f1: Int32)
    {}
}

struct B {
    func a(c: Int32)
    : Unit {}
    B(d!: Int32, 
    g!: Int32,
    let h!: Int64
    ) {}

    mut prop c: Int32 {
        get() {0}
        set(
            v 
        )
        {}
    }
}

enum C {
    R|K 

    func too(c: Int32,
    d!: Int32
    = 1)
    :Unit {}
}

main(
    args: Array<String>
): Int64 {
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
