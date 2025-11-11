// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp
func foo() {
    1
}

class B {
    func foo() {
        2
    }

    func print() {
        println(foo())
    }
}

main() {
    var b = B()
    b.print()
}