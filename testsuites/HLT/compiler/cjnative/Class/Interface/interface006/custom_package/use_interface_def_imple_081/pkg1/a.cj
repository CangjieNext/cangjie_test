/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface MyInterface1 {
    mut func foo1(): Rune
    mut func foo2(a: Rune): String {
        a.toString() + foo1().toString()
    }
}

public interface MyInterface2 {
    mut func foo3(): Rune
    mut func foo4(a: Rune): String {
        a.toString() + a.toString() + foo3().toString()
    }
}

public interface MyInterface3 {
    mut func foo5(): Rune
    mut func foo6(a: Rune): String {
        a.toString() + foo5().toString() + foo5().toString()
    }
}

extend Float64 <: MyInterface1 & MyInterface2 & MyInterface3 {
    public func foo1(): Rune {
        foo3()
    }
    public func foo3(): Rune {
        foo5()
    }
    public func foo5(): Rune {
        r'1'
    }
}
