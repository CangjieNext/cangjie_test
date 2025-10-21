/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Extend

class CC1 {}
extend CC1 {
    private prop v1: Int64 {
        get() {
            0
        }
    }
    public prop v2: Int64 {
        get() {
            0
        }
    }
    protected prop v3: Int64 {
        get() {
            0
        }
    }
    prop v4: Int64 {
        get() {
            0
        }
    }
}

func test1() {
    let d1 = CC1()
    d1.v2
    d1.v4
    d1.v3
}
