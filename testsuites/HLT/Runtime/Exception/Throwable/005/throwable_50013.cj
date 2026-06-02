/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args| compare %f
// ASSERT: scan success

class A<T> <: Exception {}

class B<T> <: Exception {}

open class C<T> {
    protected init() {
        var a: Int64 = if (true) {
            throw A<T>();
            1
        } else {
            0
        }
    }
}

class D<T> <: C<T> {
    public init() {}
}

main() {
    try {
        D<Int64>();
        ()
    } catch (a: A<Int64>) {
        print("success")
    }
    return 0
}
