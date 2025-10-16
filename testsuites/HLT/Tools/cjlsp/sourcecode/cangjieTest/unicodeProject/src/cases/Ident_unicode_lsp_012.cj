/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package unicodeProject.cases

struct 名ก {
    let width: Int64 = 10
    let height: Int64 = 10
    public func area():Int64 {
        this.width * this.height
    }
}

func test_012() {
    let r_test = 名ก()
}
