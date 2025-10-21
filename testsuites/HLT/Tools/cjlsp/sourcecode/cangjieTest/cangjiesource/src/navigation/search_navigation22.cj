/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.navigation

struct A15 {
    func fasFunc2(a: Float64) {
        return 1.2
    }
}
extend A15 {
    func fasFunc2(a: Int64) {
        return 1
    }
}

extend A15 {
    func fasFunc2(a: Int32) {
        return 1
    }
}
extend A15 {
    func fasFunc2(a: String) {
        return 'a'
    }
}
