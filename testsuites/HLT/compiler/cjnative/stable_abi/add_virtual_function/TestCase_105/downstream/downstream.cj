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

public class DownStreamTypeInheritingUpStreamChild <: UpStreamChild<String, Bool> {
    ~init() {
    }
}

public interface DownStreamTypeInheritingUpStreamParent <: UpStreamParent<String, Bool> {}

public class ParentClass <: DownStreamTypeInheritingUpStreamParent {
    ~init() {
    }
}

main(): Unit {
    let child = DownStreamTypeInheritingUpStreamChild()
    checkChild(child)
    let parent = ParentClass()
    checkParent(parent)
    checkStatic<DownStreamTypeInheritingUpStreamParent, String, Bool>()
}
