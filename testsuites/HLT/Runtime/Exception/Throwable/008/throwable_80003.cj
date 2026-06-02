/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: use_80003.cj
// EXEC: %compiler %cmp_opt %f %compile_lib_opt -o define.%middle
// EXEC: %compiler %cmp_opt use_80003.cj define.%middle -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan b!a in pkg B 1
// ASSERT: scan success

package define

var a = 1

public func test():Int64 {
    return a
}
