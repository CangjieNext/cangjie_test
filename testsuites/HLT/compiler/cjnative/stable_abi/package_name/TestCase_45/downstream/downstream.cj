/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.abc

import com.pkga.*
import std.reflect.*

public class DownStreamTypeInheritingUpStreamChild <: UpStreamChild<Float64> {
    ~init() {
    }
}

public class DownStreamTypeInheritingUpStreamParent <: UpStreamParent<Float64> {
    ~init() {
    }
}

main(): Unit {
    println("begin")
    let child = DownStreamTypeInheritingUpStreamChild()
    checkChild(child)
    let parent = DownStreamTypeInheritingUpStreamParent()
    checkParent(parent)
    checkStatic<DownStreamTypeInheritingUpStreamParent, Float64>()
}
