/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Pattern_matching

func foo3() {
    let (x, y) = (100, 200)
    print("x = ${x}\n")
    print("y = ${y}\n")

    for ((i, j1) in [(1, 2), (3, 4), (5, 6)]) {
        print("Sum = ${i+j1}\n")
    }
}
