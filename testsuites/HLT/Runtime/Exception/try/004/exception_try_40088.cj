/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex main
// (not O2) ASSERT: regex exception_try_40088.cj:20
class A <: Exception {}

main() {
    match ("1") {
        case _ where (if (true) {
            try {
                throw A();
                true
            } finally {}
        } else {
            true
        }) => 0
        case _ => 1
    }
    return 0
}
