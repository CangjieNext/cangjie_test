// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC-PIPE-1: %run_macro %compiler %cmp_opt %macro_lib %f -o %output 2>&1 | compare %f
// (CJNATIVE)ASSERT: scan An exception has occurred:
// ASSERT: scan Exception

import define.*

@M
main() {
    return 0
}
