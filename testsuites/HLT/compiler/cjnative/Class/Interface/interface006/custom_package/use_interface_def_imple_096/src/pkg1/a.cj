/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

interface MyInterface<T> {
    mut func foo1(): T
    mut func foo2(): T {
        foo1()
    }
}

struct Mystruct <: MyInterface<Int32> {
    var x: Int32 = 10
    mut func f() {
        x = 20
        return x
    }
    public mut func foo1(): Int32 {
        f()
    }
}
