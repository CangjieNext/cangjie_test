/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkga

public class Fruit<T> {
    public var name: T
    public init(x: T) {
        name = x
    }
}

var a0: Int64 = 1
public var a: Fruit<Int64> = Fruit<Int64>(a0)
