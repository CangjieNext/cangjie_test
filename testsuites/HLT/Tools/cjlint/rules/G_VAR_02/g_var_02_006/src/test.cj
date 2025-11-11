/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class A {
    func foo() {
        let a = 1
        var b = 1
        func goo() {
            println(a)
            println(b)
        }
    }
}

main() {
    A().foo()
}
