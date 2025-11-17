/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
class A {
    public func test1() {
        func test2(a!: Int64 = {=> return 0}()) {
            return 1
            return 1
        }
        return 1
        return 1
    }
}

main() {
    A().test1()
    return 0
}
// ASSERT: scan chir_dce_unused_function
// ASSERT: scan chir2_dce_unreachable_expression
