/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not O2) EXEC: %compiler %cmp_opt %f -o %output
// (not O2) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (not O2) ASSERT: regex init
// (not O2) ASSERT: regex default.*b
// (not O2) ASSERT: scan exception_try_30009.cj:22
class A <: Exception {}

func a(): Int64 {
    throw A()
}

func b(): Int64 {
    a()
}

main() {
    b()
    a()
    return 0
}
