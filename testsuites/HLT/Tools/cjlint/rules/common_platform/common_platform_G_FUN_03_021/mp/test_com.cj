/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

common class A {
    common func foo1(a: Int64): Unit
    common static func foo1(): Unit {}
    common func foo3(): Unit {}
    common func foo3(a: Int64) {
        a
    }
}
