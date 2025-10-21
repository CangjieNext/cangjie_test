/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testVArray

func access() {
    let aa: VArray<Int64, $5> = [1, 2, 3, 4, 5]
    let intRange = 0..5
    for (i in intRange) {
        print("${aa[i]}")
    }
    let size = aa.size
}
