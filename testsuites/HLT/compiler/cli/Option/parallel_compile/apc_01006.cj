/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not MAC and not Windows) EXEC: %compiler %cmp_opt --apc=0 %f -o %output 2>&1 | compare %f
// (not MAC and not Windows) RUN-EXEC: %run %run_opt %output %run_args
// (not MAC and not Windows) ASSERT: scan '--apc' value must be greater than 0, the compiler will use 1 as the value.

main() {
    return 0
}
