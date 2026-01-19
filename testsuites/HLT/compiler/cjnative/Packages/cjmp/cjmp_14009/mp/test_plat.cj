/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package mp

public platform open class C1 {
    public var v2: Int64 = 1
}

public platform class C2 <: C1 {}

public func f2() {
    var c1: C1 = C2()
    var c2: C2 = C2()
    return c2.v1 + c1.v2 + c2.v2
}
