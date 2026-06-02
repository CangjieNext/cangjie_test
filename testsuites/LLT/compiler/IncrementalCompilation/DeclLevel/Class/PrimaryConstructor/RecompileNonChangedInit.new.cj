struct A {
    private let c: Int64
    public A(
        c_!: Int64,
        let a!: Int64,
        let b!: Int64
    ) {
        this.c = c_
    }

    public init(tup:(Int64, Int64, Int64)) {
        this.a = tup[0]
        this.b = tup[1]
        this.c = tup[2]
    }
}


main(): Int64 {
    let a = A(a: 2, b: 2, c_: 2)
    return a.b - a.a
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
