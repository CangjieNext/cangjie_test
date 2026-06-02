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
// (not O2) ASSERT: scan chir_unreachable_pattern
class A {
    func test() {
        match (1) {
            case 1 | 2 | 3 => return 1
            case _ => return 2
        }
        return 1
    }
}

main() {
    return 0
}
