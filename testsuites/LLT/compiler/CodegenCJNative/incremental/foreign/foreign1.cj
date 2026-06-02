// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.old.cj %n.new.cj %n.c
// EXEC: gcc %n.c -c -fPIC
// EXEC: %compiler %cmp_opt %incrementalCompile %n.o %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %cmp_opt %incrementalCompile %n.o %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan error: '@FastNative' should have no arg
