/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Aoo<T> where T <: A & B {
    public var a: T
    public init(x: T) {
        a = x
    }
}

interface A {}

open class B {
    public func foo() {}
}

class C <: B & A {
    public func goo() {}
}

main() {
    var a = Aoo<C>(C())
    if (a.a.foo() != ()) {
        return 1
    }
    return 0
}
