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
// ASSERT: scan A_first
// ASSERT: scan B_first
class A {
    public init() {
        print("A_first")
    }
    public init(a: Int64) {
        print("A_second")
    }
}

struct B {
    public init() {
        print("B_first")
    }
    public init(a: Int64) {
        print("B_second")
    }
}

main(): Int64 {
    var i = A()
    var j = B()
    return 0
}
