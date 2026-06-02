/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A_second
// ASSERT: scan B_second
class A<T> {
    public init(a: T) {
        print("A_first")
    }
    public init(a: Int64) {
        print("A_second")
    }
}

struct B<T> {
    public init(a: T) {
        print("B_first")
    }
    public init(a: Int64) {
        print("B_second")
    }
}

main(): Int64 {
    var i = A<Int32>(1)
    var j = B<Int32>(1)
    return 0
}
