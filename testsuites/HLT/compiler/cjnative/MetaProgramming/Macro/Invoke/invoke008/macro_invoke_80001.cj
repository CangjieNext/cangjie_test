/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  define_80001.cj
// EXEC: %compiler %cmp_macro define_80001.cj
// EXEC-PIPE: %run_macro %compiler %cmp_opt  %f -o %output | compare %f
// ASSERT: scan hello macro
// RUN-EXEC: %run %run_opt %output  %run_macro_opt %run_args

import define.*

main() {
    return @M(@M(1)) - 4
}
// ASSERT: regex-not no position error occurred
