/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.abc

import com::pkga.*
import std.reflect.*

public interface DownStreamTypeInheritingUpStreamParent <: UpStreamParent<String, Bool> {}

public class ParentClass <: DownStreamTypeInheritingUpStreamParent {
    ~init() {
    }
}

main(): Unit {
    println("begin")
    let child = UpStreamChild<String, Bool>()
    checkChild(child)
    let parent = ParentClass()
    checkParent(parent)
    checkStatic<DownStreamTypeInheritingUpStreamParent, String, Bool>()
}
