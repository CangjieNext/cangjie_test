// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

import b.macro_definition1.*
import b.macro_definition2.*
import b.macro_definition3.*

struct Composer {
    public init() {}
    public func start(id: Int32) {
        println("start ${id}")
    }
    public func end() {
        println("end")
    }
}

public enum A<T> {
    a(T)
}

func test<T>(input: T) {
    @M var a: A<T> = A<T>.a(input)
}

var counter = 0

@ModifyFunc
func MyFunc() {
    counter++
}

main(): Int64 {
    println("I'm in function body")
    let a: Int64 = @TestDef(1 + 2)
    println("a = ${a}")

    let comp = Composer()
    MyFunc(comp)
    println("MyFunc called: ${counter} times")

    test<Int64>(1)
    return 0
}
