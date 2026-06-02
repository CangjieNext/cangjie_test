/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific extend Int64 {
    specific public prop p: Int64 {
        get() {
            1
        }
    }
    specific public func f(): Int64 {
        1
    }
}

public func f2() {
    if (1.f() + 1.p == 2) {
        return 0
    }
    return 1
}
