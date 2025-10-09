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

class ExtendedClass {}

extend ExtendedClass {
    func f(p: Int64) {
    }
    func f(p: Float64) {
    }
    func f(p: Bool) {
    }
    func f(p: Unit) {
    }
    func f(p: String) {
    }
}

main(): Unit {
    ExtendedClass().f(A is UInt16)
}
