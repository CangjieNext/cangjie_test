/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows) EXEC-PIPE: rm -rf dir;mkdir dir
// (Windows) EXEC-PIPE: mkdir dir
// EXEC-PIPE: %compiler %cmp_opt %f -o %output --save-temps=./dir
// (CJNATIVE) EXEC-PIPE: %ls dir/*%n.bc dir/%n.o dir/*%n.opt.bc
// (not CJNATIVE) EXEC-PIPE: %ls dir/%n.bc
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Everything is great

main() {
    print("Everything is great")
}
