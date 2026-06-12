/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %enableO2 %disableReflection %disableDevirtualization --lto=full %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-begin BBB<T>::foo
// ASSERT: scan-next CCC<T>::foo

interface III<T> {
    func foo():Unit
}

class AAA<P, Q> {}

class BBB <: III<AAA<Int64, Int64>> {
    public func foo() {
        println("BBB<T>::foo")
    }
}

class CCC <: III<AAA<Int64, Int32>> {
    public func foo() {
        println("CCC<T>::foo")
    }
}

func moo(iii:III<AAA<Int64, Int64>>) {
    iii.foo()
}

func noo(iii:III<AAA<Int64, Int32>>) {
    iii.foo()
}

main(): Unit {
    moo(BBB())
    noo(CCC())
}
