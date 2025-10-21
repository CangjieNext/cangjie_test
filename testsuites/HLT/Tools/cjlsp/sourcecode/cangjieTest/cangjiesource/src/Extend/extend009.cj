/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Extend

interface I9 {}

extend Int64 {
    static func f1<T>(a: T, b!: Int64 = 0) where T <: I9 {}
    func f(a: String, b: String) {}
}

func f9() {
    11.f("aa", "bb")

}
