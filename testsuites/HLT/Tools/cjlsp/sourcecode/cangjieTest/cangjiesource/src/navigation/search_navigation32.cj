/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.navigation

interface MyInterface2 {
    func f1(): Unit
    static func f2(): Unit
    func f3(): Unit {
        return
    }
    func f4(a!: Int64): Unit
    static func f5(): Unit {
        return
    }
}
