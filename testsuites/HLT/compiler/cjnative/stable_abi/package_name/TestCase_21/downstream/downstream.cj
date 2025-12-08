/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package abc.cde

import abc.*
import std.reflect.*

public class DownStreamTypeInheritingUpStreamChild <: UpStreamChild<Float64> {
    ~init() {
    }
}

public enum DownStreamTypeInheritingUpStreamParent <: UpStreamParent<Float64> {
    | A
}

main(): Unit {
    println("begin")
    let child = DownStreamTypeInheritingUpStreamChild()
    checkChild(child)
    let parent = DownStreamTypeInheritingUpStreamParent.A
    checkParent(parent)
    checkStatic<DownStreamTypeInheritingUpStreamParent, Float64>()
}
