/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Extend

class CC17 {}

extend CC17 {
    private func f() {}
    func g() {}
}

extend CC17 {
    func h() {
        g()
    }
    func j() {}
}
