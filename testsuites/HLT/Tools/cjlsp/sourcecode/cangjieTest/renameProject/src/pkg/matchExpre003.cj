/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

enum RGBColor {
    Red(Int64) | Green(Int64) | Blue(Int64)
}

func ff_2() {
    let c = RGBColor.Green(-100)
    let cs = match (c) {
        case Red(r) => "Red =${r}"
        case Green(g) => "Green  = ${g}"
        case Blue(bb1) => "Blue = ${bb1}"
    }
}
