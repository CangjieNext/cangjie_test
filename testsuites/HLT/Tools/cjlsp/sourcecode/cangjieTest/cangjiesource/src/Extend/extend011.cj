/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Extend

open class ClassB {}

extend ClassB {
    func f() {}
}

class D <: ClassB {
    func g() {
        f()
    }
    func f1() {}
}

func test18() {
    let x = D()
    x.f()
    x.g()
}
