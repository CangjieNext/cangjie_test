/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package frozen

struct Boo {
    private var j = 0
    @Frozen
    public mut prop i: Int64 {
        get() {
            j
        }
        set(v) {
            j = v
        }
    }
}
