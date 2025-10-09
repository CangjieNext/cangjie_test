/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

enum TimeUnit7 {
    Year
}

func foo(x: TimeUnit7, y!: TimeUnit7 = Year): Int64 {
    var res = match (x) {
        case Year =>
            match (y) {
                case Year => 2021
            }
    }
    res
}

func bar(): TimeUnit7 {
    TimeUnit7.Year
}
