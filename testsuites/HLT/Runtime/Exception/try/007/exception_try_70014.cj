/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class A <: Exception {}

class B {
    public B(input: Int64) {
        func foo(a!: Int64 = throw A()) {}
        foo()
    }
}

main() {
    B(1)
    return 0
}
