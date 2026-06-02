/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p1

public var a = A<Int32>(1, 1)
public let b = A<Int32>(2, 2)

public class A<T> {
    public var a: T
    public let b: T
    public init(x: T, y: T) {
        a = x
        b = y
    }
}
