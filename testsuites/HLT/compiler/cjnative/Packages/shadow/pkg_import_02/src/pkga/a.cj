/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkga

class Coo<T> {
    public static func foo<V>(x: V): V {
        return x
    }
    public var a: Int64 = pkga.Boo<T>()
    public var b: Int64 = pkga.foo()
}

func foo() {
    return 1
}

public var a: Int64 = 1
