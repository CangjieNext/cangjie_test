// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public interface IA {
    public func foo(): Unit {
        println("IA foo")
    }
}

public struct SA <: IA {
    public func foo(): Unit {
        println("SA foo")
    }
}

public class CA <: IA {
    public func foo(): Unit {
        println("CA foo")
    }
}

public func goo(ia: IA) {
    ia.foo()
}

main() {
    let obj1: IA = SA()
    obj1.foo()
    goo(obj1)
    let obj2: IA = CA()
    obj2.foo()
    goo(obj2)
    0
}