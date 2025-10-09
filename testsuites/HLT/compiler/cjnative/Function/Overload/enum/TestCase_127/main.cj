/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package packageA

enum E<T> {
    | A
    | B
    | C
}

interface Interface {
    func f(p: Bool) {
    }

    func f(p: Int64) {
    }

    func f(p: Float64) {
    }

    func f(p: Unit) {
    }

    func f(p: String) {
    }
}

class ChildClass <: Interface {}

main(): Unit {
    ChildClass().f(A is Int32)
}
