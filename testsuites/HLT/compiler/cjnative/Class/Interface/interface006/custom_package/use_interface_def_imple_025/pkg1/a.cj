/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface MyInterface {
    func foo1(): Rune
    func foo2(a: Int8): Rune {
        if (a == 10) {
            return foo1()
        }
        return r'1'
    }
    func foo3(): Rune
}

public class myClass {
    var x: Rune = 'a'
    func f() {
        x = 'b'
        return x
    }
}

extend myClass <: MyInterface {
    public func foo1(): Rune {
        f()
    }
    public func foo3(): Rune {
        x
    }
}

public func call(): Int64 {
    var c1: MyInterface = myClass()
    var c2: myClass = myClass()

    if (c1.foo2(11) == r'1' && c1.foo3() == r'a' && c1.foo2(10) == r'b' && c1.foo3() == r'b' && c2.foo2(10) == r'b' &&
        c2.x == r'b') {
        return 0
    } else {
        return 1
    }
    return 0
}
