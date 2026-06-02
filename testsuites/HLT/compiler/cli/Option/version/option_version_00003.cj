/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -v %f -o test
// (not MAC and not Windows) EXEC-PIPE-2: %ls test 2>&1 | compare %f
// (MAC) EXEC-PIPE-1: %ls test 2>&1 | compare %f
// ASSERT: regex .*test.*: No such file or directory

main() {
    0
}
