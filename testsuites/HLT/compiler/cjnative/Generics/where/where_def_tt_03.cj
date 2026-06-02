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

open class Aoo<T> where T <: A<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
}

open class A<T> {
    public func foo(x: T) {
        return x
    }
}

class B <: A<B> {
    public var b: Int64 = 1
}

main() {
    var a = Aoo<B>(B())
    if (a.a.b != 1) {
        return 1
    }
    return 0
}
