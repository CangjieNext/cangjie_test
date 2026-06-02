/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not O2) EXEC-PIPE-0: %compiler  %cmp_opt %f -o %output 2>&1 | compare %f
// (not O2) RUN-EXEC: %run %run_opt %output %run_args
// (not O2) ASSERT: scan chir_dce_unused_operator
class A {
    func test() {
        1 + 1
        return 1
    }
}

main() {
    return 0
}
