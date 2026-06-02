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
interface I<T> {
    func foo(a: T): Int32
}

interface J<T> {
    func foo(a: T): Int32
}

public open class A<T> {}

abstract class B<X, Y, Z> <: A<Int32> & I<Int8> & J<Int8> {}

main() {
    var a: B<Int8, Int16, Int32>
    return 0
}
