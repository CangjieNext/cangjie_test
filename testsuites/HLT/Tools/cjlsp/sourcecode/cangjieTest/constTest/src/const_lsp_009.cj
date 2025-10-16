/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package constTest

let numbers9 = [12, 18, 25, 36, 49, 55]
const expr9 = for (number in numbers9) {
    if (number % 5 == 0) {
        println(number)
        continue
    }
}
