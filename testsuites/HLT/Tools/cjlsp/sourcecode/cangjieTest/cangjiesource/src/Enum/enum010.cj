/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Enum

enum TimeUnit10 {
    Year
}

var foo1: (TimeUnit10, TimeUnit10) -> Int64 = {
    x: TimeUnit10, y: TimeUnit10 =>
    var res = match (x) {
        case Year =>
            match (y) {
                case Year => 2021
            }
    }
    res
}

var bar1 = TimeUnit10.Year
