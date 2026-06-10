/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %enableO2 %disableReflection %disableDevirtualization --lto=full %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan BBB<T>::foo

interface III<T> {
    func foo():Unit
}

struct AAA<G> {}

class BBB<M> <: III<AAA<M>> {
    public func foo() {
        println("BBB<T>::foo")
    }
}

func goo(a:III<AAA<Int64>>) {
    a.foo()
}

main(): Unit {
    goo(BBB<Int64>())
}
