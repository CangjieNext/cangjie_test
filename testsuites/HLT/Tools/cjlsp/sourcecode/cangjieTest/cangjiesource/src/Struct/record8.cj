/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Struct

interface I {
    func f1(): Unit {}
}

struct C88 <: I {
    public func f1(): Unit {}
    C88(a!: Int64) {}
}

var r1 = C88(a: 1).f1()
