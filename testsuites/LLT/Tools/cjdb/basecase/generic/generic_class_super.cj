// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class C1<T> {
    let a: Int64
    let b: ?T
    const init(input: T) {
        this.a = 0
        this.b = input
    }
}

class C2<T> <: C1<T> {
    let c: T
    const init(input: T) {
        super(input)
        this.c = input
    }
}

main() {
    const c1 = C1<Int64>(100) //expr c1
    const c2 = C2<Int64>(-1) //expr c2
    c1.b
    c2.a
    c2.c
    return 1
}
