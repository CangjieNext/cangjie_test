/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Pattern_matching

enum RedColor {
    Red1(Int64)
}

func fff() {
    let Red1(red) = RedColor.Red1(2)
    print("red = ${red}\n")

    for (Red1(r) in [Red1(10), Red1(20), Red1(30)]) {
        print("r = ${r}\n")
    }
}
