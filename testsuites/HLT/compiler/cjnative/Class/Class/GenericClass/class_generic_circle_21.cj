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

main(): Int64 {
    return run()
}

open class E<T> {
    public var e: Rune = r'e'
    public init(x: T) {}
}

open class D<T> <: E<Int32> {
    public var d: Rune = r'd'
    public init(x: T) {
        super(0)
    }
}

open class C<T> <: D<Int32> {
    public var c: Rune = r'c'
    public init(x: T) {
        super(0)
    }
}

open class B<T> <: C<Int32> {
    public var b: Rune = r'b'
    public init(x: T) {
        super(0)
    }
}

class A<T> <: B<Int32> {
    public var a: Rune = r'a'
    public init(x: T) {
        super(0)
    }
}

func run(): Int64 {
    let classA: A<Int32> = A<Int32>(0)
    var res1: Rune = classA.a
    var res2: Rune = classA.b
    var res3: Rune = classA.c
    var res4: Rune = classA.d
    var res5: Rune = classA.e
    if (res1 == r'a' && res2 == r'b' && res3 == r'c' && res4 == r'd' && res5 == r'e') {
        return 0
    }
    return 1
}
