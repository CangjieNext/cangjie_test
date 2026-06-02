/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler  %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

protected open class T_a {}

protected class A_b <: T_a {}

public class A_A<T> {}

extend<T> A_A<T> where T <: T_a {
    public func a() {
        return 1
    }
}

main() {
    var test = A_A<A_b>()
    return test.a() - 1
}
