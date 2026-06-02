// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp
func foo() { 1 }

func test() {
    func foo() { 2 }
    func foo2() {
        func foo() { 3 }
        println(foo())
    }
    println(foo()) // will print 2
    foo2() // will print 3
}

main() {
    test()
}