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
        return 1
        func test2(): Int64 {
            return 1
            return 1
        }
        return 1
    }
}

main() {
}
// ASSERT: scan chir2_dce_unreachable_expression
