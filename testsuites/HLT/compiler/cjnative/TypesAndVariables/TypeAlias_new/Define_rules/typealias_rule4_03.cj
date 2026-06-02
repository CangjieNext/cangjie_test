/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
class classA<T> {
    public var a: T
    public init(i: T) {
        a = i
    }
}

class B {
    public func a(a: Int64): Int64 {
        a
    }
}

type A<T> = classA<T>

func foo<T>(p: A<T>) where T <: B {
    var a: A<Int64> = classA<Int64>(1)
    return a.a
}

main(): Int64 {
    var x: A<B> = classA<B>(B())
    if (foo<B>(x) == 1) {
        return 0
    } else {
        return 1
    }
}
