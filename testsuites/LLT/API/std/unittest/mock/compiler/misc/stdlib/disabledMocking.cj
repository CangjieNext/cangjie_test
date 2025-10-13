/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt -Woff=all %n.cj -o %output 2>&1 | compare %f

main() {
    0
}

/* SCAN-IN
error: dependent package 'std.core' is compiled with mocking support, the current package must be compiled with mocking support too (pass '--mock=on' compilation option)
 */
