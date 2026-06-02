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

interface B <: A {}

class C <: A {}

class D <: B {
    public func foo() {
        return 2
    }
}

class E <: A & B {
    public func foo() {
        return 3
    }
}

extend C <: B {
    public func foo() {
        return 1
    }
}

main() {
    var a = Aoo<D>(D())
    if (a.a.foo() != 2) {
        return 1
    }
    var b = Aoo<E>(E())
    if (b.a.foo() != 3) {
        return 1
    }
    var c = Aoo<C>(C())
    if (c.a.foo() != 1) {
        return 1
    }
    return 0
}
