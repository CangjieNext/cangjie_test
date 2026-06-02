// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: path1 path2 path3
// EXEC: %compiler %cmp_opt path1/test1.cj path2/test2.cj path3/test3.cj main.cj -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

main() {}

/* SCAN
path3
path2
path1
*/