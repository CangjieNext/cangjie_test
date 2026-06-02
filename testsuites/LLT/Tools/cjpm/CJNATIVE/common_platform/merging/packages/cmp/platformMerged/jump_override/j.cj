// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

features { user.cmp.arch.little, user.cmp.arch.big }
package cmp.jump_override

public specific func jumpOverride(): Unit {
    println("feature-set-jump-override: {  user.cmp.arch.little, user.cmp.arch.big }")
}