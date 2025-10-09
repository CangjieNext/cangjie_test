/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.case01

class AA {
    public prop testccc: Int64 {
        get() {
            123
        }
    }
}

func test_01() {
    var a_11 = AA()
    println(a_11.testccc) // 123
}
