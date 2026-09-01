// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %dumpCHIRDebug %enableO2 -Woff all %f -o %n.%suffix
// EXEC-PIPE-0: %run %run_opt %output %run_args

interface A<R> {
    static func foo<T>(): Int64 {
        1
    }
    public mut func bar(): Int64 {
        foo<Bool>()
    }
}

struct B<R> {
    public mut func bar(): Int64 {
        foo<Bool>()
    }
    static public func foo<T>(): Int64 {
        1
    }
}

extend<R> B<R> <: A<R> {}

main(): Int64 {
    var a = B<Int64>()
    var b = B<Bool>()
    a.bar() + b.bar() - 2
}
