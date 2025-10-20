/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Enum

import std.collection.*

enum TimeUnit11 {
    Year(Int64)
}

func test11() {
    var set = HashSet<Int64>([1, 2, 3, 4, 5])
    var time = TimeUnit11.Year(0)
    for (i in set) {
        time = TimeUnit11.Year(i)
    }
}
