/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p1

public func foo<T>(a: T): T {
    var a1 = Aoo<T>(a)
    return a1.a
}

class Aoo<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
}
