/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

struct structtype01<T> {
    var a: T
    public init(x: T) {
        a = x
    }
}

public class classtype01<T> {
    var a: T
    public init(x: T) {
        a = x
    }
}

type ST<T> = structtype01<T>
type CT<T> = classtype01<T>

main(): Int64 {
    let lst = ST<Int32>(32)
    let lct = CT<Int32>(16)
    let lst2 = structtype01<Int32>(32)
    let lct2 = classtype01<Int32>(16)
    return 0
}
