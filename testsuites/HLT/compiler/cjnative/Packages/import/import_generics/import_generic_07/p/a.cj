/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a

public class Foo0 {
    public func bar<T>(a: T) {
        a
    }
}

public struct Foo1 {
    public func bar<T>(a: T) {
        a
    }
}

public enum Foo2 {
    A

    public func bar<T>(a: T) {
        a
    }
}
