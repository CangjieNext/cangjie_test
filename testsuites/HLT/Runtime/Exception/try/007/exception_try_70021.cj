/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A <: Exception {}

struct B {
    public B(input: Int64) {
        func test(a!: Int64 = throw A()) {}
        test()
    }
}

main() {
    B(1)
    return 0
}
// ASSERT: scan chir_dce_unused_expression
