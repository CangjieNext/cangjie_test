/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package constTest

const func expr5_1(n: Int64, acc: Int64): Int64 {
    if (n <= 1) {
        return acc
    } else {
        return expr5_1(n - 1, n * acc)
    }
}

const expr5_2 = {a: Int64, b: Int64 => return a + b}
