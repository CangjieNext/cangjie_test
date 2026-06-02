/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package %f -o %output

import stdx.actors.*
import stdx.actors.macros.*

interface I {
    func foo(): Int64
}

open class Parent {
    protected let x: Int64 = 0
}

@Actor
class MyActor <: Parent & I {
    public func foo(): Int64 { 42 }
}

main() {}