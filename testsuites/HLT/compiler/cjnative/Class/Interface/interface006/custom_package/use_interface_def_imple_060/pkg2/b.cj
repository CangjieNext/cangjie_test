/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public struct myStruct1<T> <: MyInterface {
    public var x: Rune = '1'
    public mut func foo1(): Rune {
        x = 'a'
        return x
    }
    public mut func foo3(): Rune {
        x
    }
}

public struct myStruct2<T> <: MyInterface {
    public var x: Rune = '2'
    public mut func foo1(): Rune {
        x = 'b'
        return x
    }
    public mut func foo3(): Rune {
        x
    }
}

public struct myStruct3<T> <: MyInterface {
    public var x: Rune = '3'
    public mut func foo1(): Rune {
        x = 'c'
        return x
    }
    public mut func foo3(): Rune {
        x
    }
}
