/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Expressions

func foo8() {
    var set = [1, 2, 3]
    for (i in set) {
        if (i == 2) {
            continue
        }
        if (i == 3) {
            break
        }
    }
}
