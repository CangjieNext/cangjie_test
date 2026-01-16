/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific public struct C1 {
    specific public func f1(): Int64 {
        0
    }
    specific public prop p1: Int64 {
        get() {
            0
        }
    }
}

specific public struct C2 {
    private var a = 0
    specific public mut prop p1: Int64 {
        get() {
            0
        }
        set(v) {
            a = v
        }
    }
}
