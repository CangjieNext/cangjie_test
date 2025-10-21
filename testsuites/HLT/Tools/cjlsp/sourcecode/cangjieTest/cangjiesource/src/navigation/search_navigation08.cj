/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.navigation

class Te_1st {
    init(a: Int32) {}
    init(a: Int64) {}
    init(a!: Bool) {}
    init(c!: String = "cc") {}
    Te_1st(a: Int64, b!: Int64) {
        a + b
    }
    init(a: Int64, b!: Int32, c!: Bool = true) {}
}
