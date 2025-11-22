/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

func tuple(x: (Int64, Int64)) {
    match (x) {
        case (1, 2) => "(1,2)"
        case (2, a) => "(2,${a})"
        case (a, b) => "(${a},${b})"
    }
}
