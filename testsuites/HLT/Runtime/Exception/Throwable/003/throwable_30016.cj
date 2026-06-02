/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Exception {}

var test = {
    =>
    func foo(a!: Int64 = if (true) {
            throw A();
            0
        } else {
            1
        }) {}
    foo()
}

main() {
    try {
        test()
    } catch (a: A) {
        print("success")
        return 0
    }
    return 5
}
