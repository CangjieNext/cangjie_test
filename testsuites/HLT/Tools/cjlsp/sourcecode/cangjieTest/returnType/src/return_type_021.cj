/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package returnType

class C21 {
    func f21() {
        return 10i8
    }
}

public func base21() {
    var tmp = C21()
    0i8 + tmp.f21()
}

