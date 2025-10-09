/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.ClassInitPara

interface I {
    func f1(): Unit {}
}

class C8 <: I {
    public func f1(): Unit {}
    init(a!: Int64) {}
}

var r1 = C8(a: 1)
var r2 = r1.f1()
