/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows and not MAC and not Android)EXEC: %compiler %cmp_opt %f -o %output
// (not Windows and not MAC and not Android)RUN-EXEC-PIPE: %export cjGwpAsanHelp=true && %run %run_opt %output %run_args 2>&1 | compare %f
// (not Windows and not MAC and not Android)ASSERT: scan Available flags for cangjie GWP-ASan

main() {
    0
}
