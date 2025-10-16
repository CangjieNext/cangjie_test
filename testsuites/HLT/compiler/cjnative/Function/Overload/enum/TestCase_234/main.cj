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

struct Struct {
    init(p: Int64) {
    }
    init(p: Float64) {
    }
    init(p: Bool) {
    }
    init(p: Unit) {
    }
    init(p: String) {
    }
    init(p: Rune) {
    }
    init(p: Int32) {
    }
}

main(): Unit {
    Struct(A is Float32)
}
