/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package downstream

import upstream.*
import std.reflect.*

public enum DownStreamTypeInheritingUpStreamChild <: UpStreamChild<String, Bool> {
    | A
}

public enum DownStreamTypeInheritingUpStreamParent <: UpStreamParent<String, Bool> {
    | A
}

main(): Unit {
    let child = DownStreamTypeInheritingUpStreamChild.A
    checkChild(child)
    let parent = DownStreamTypeInheritingUpStreamParent.A
    checkParent(parent)
    checkStatic<DownStreamTypeInheritingUpStreamParent, String, Bool>()
}
