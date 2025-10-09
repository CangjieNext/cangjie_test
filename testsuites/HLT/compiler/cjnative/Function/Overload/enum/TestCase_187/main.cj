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

class Class {
    static func f(p: Bool) {
    }

    static func f(p: Int64) {
    }

    static func f(p: Float64) {
    }

    static func f(p: Unit) {
    }

    static func f(p: String) {
    }

    static func f(p: Rune) {
    }

    static func f(p: Int32) {
    }
}

main(): Unit {
    Class.f(A is Float64)
}
