/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkga.*

class B3 <: A3 {
    public mut override prop ii_1: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

func test3() {
    var a1 = B3().ii_1
}
