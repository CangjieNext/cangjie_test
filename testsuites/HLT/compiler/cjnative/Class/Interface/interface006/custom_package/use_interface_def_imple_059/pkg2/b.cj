/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public enum enum1<T> {
    A | B(UIntNative)
}

extend<T> enum1<T> <: MyInterface {
    public func foo1(): UIntNative {
        10
    }
}

public enum enum2<T> {
    A | B(UIntNative)
}

extend<T> enum2<T> <: MyInterface {
    public func foo1(): UIntNative {
        20
    }
}

public enum enum3<T> {
    A | B(UIntNative)
}

extend<T> enum3<T> <: MyInterface {
    public func foo1(): UIntNative {
        30
    }
}
