/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

enum Time {
    Year(Int32) | Year(Int32, Int64)
}

func main4(): Int64 {
    var time1 = Time.Year(1)
    var time2 = Time.Year(3, 4)

    match (time1) {
        case Time.Year(x) => x
        case Time.Year(x, y) => x
        case _ => Int32(0)
    }
    match (time2) {
        case Year(x) => x
        case Year(x, y) => x
    }

    return 0
}
