/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common open class C1 {
    public var v = 0
    public init() {}
}

public common class C2 <: C1 {
    public init(a: Int64) {
        v = a
    }
}

public func f() {
    return C2(0).v
}
