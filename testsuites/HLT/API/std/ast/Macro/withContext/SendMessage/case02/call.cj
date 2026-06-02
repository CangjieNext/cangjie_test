/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC-PIPE-0: %run_macro %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan inner 1 hello world
// ASSERT: scan inner 2 hello world
import define.*

main(): Int64 {
    @Outer(
  @Inner(var a = 1)
  @Inner(var b = 1))

    return a - b
}
