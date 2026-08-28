// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %dumpCHIRDebug %enableO2 -Woff all %f -o %n.%suffix
// EXEC-PIPE-0: %run %run_opt %output %run_args

interface A<R> {
    static func foo<T>() {
        println("A.foo")
    }
}

class B<R> <: A<R> {
    static public func foo<T>() {
        println("B.foo")
    }
}

main() {
    B<Bool>.foo<Bool>()
}