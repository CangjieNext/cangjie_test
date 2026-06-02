/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkga

public class Coo<T> {
    public static func foo<V>(x: V): V {
        return x
    }
}

public var i: Int32 = 3
public var res: Int32 = Coo<String>.foo<Int32>(i)
