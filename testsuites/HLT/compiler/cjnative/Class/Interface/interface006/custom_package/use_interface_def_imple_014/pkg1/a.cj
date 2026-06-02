/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface faterInterface<T> {
    mut func foo1(): Rune
    mut func foo2(a: Rune): Rune {
        foo1()
    }
}

public interface MyInterface <: faterInterface<Rune> {}

public struct myStruct1 <: MyInterface {
    public var x: Rune = '1'
    public mut func foo1(): Rune {
        x = 'a'
        return x
    }
}

public struct myStruct2 <: MyInterface {
    public var x: Rune = '2'
    public mut func foo1(): Rune {
        x = 'b'
        return x
    }
}

public struct myStruct3 <: MyInterface {
    public var x: Rune = '3'
    public mut func foo1(): Rune {
        x = 'c'
        return x
    }
}
