/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Enum

// 重载决议
enum Time6 {
    Day1(Int64) | Day1(Int64, Int64)
}

func test6() {
    var res1 = Time6.Day1(2)
    var res2 = Time6.Day1(2, 3)
    var res3 = Day1(2)
    var res4 = Day1(2, 3)
}
