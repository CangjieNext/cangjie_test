/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

public func g2<T, T1>(a: T, b: T1): T {
    var gengricsvar = a
    var gengricsvar1 = b
    return gengricsvar
}

public func g1<T>():Int64 {
    return 2
}

main():Int64 {
    var a1 = [1]
    var a2 = [a1]
    var a3 = HashMap<String, Array<Int64>>([("a", a1)])
    var x1 = g1<Bool>()
    var x2 = g2(a2,3)
    var x3 = g2(a3,a3)
    return 0
}
