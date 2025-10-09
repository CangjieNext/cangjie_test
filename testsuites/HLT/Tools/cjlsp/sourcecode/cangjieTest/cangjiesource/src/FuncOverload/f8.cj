/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.FuncOverload

open class Base {}
class Sub <: Base {}

func outer() {
    func inner() {
        func g(a: Base) {
            print("2")
        }
        g(Sub())
    }
    func g(a: Base) {
        print("3")
    }
    g(Sub())
}
