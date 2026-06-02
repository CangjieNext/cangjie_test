/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package test

import std.collection.*

func foo<T>(): Bool where T <: ToString {
    let arr = [1, 2, 3]
    let f: () -> Bool = foo
    let x = match (arr[0]) {
        case 1 => true
        case _ => false
    }
}

