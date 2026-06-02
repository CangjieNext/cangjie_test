/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: use_50001.cj
// EXEC: %compiler %cmp_opt %f %compile_lib_opt -o define.%middle
// EXEC: %compiler %cmp_opt use_50001.cj define.%middle -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (not O2) ASSERT: scan use_50001.cj:12
// (not O2) ASSERT: scan exception_try_50001.cj:22
package define

class A <: Exception {}

public func test():Int64 {
    try {
        throw A()
    } finally {}
    return 0
}

// ASSERT: scan An exception has occurred
