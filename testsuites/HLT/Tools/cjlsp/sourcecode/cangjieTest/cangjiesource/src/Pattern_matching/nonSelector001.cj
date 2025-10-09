/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Pattern_matching

func ff3() {
    let x = -1
    match {
        case x > 0 => "x > 0"
        case x < 0 => "x < 0"
        case _ => "x = 0"
    }
}
