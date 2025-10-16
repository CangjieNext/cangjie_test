/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct Foo<T> {
    public mut func f<T>(a: T): Unit {
        let aa = a
    }
    public mut operator func +(rhs: Foo<T>): Foo<T> {
        Foo<T>()
    }
}

main() {
    var a1 = Foo<Int64>()
    var a2 = Foo<Int64>()
    var a3 = a1.f<Int64>(1)
    var a4 = a1 + a2
    0
}
