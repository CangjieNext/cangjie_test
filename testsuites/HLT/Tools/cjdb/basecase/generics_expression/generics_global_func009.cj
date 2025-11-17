/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func foo<T>(para: T) {
    var a: T = para
    a
}

struct A {
    var a = 1
}

struct A2<T> {
    var a: T
    init(x1: T) {
        this.a = x1
    }
}

main(): Int64 {
    var aa = A()
    var bb = A2<Int64>(1)
    var aa2 = foo<A>(aa)
    var bb2 = foo<A2<Int64>>(bb)
    return 0
}
