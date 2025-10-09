/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Android）EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// (not Android）RUN-EXEC-PIPE: %export MRT_LOG_LEVEL=i && %run %run_opt %output %run_args 2>&1 | compare %f
// (not Android）ASSERT:scan The threshold must be greater than 0.

import std.runtime.*

main() {
    SetGCThreshold(0)
}
