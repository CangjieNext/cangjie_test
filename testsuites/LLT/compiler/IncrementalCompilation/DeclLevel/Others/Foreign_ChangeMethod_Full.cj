// DEPENDENCE: %n.old.cj %n.new.cj %n.c %n.new.c
// EXEC: %clang -c %n.c -o %n.o
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %n.o -o %output
// EXEC-1: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj %n.o
// EXEC: %move %n.new.cj %n.old.cj
// EXEC: %clang -c %n.new.c -o %n.o
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj %n.o -o %output 2>&1 | compare %f
// ASSERT: scan-not rollback
// ASSERT: scan incremental compilation triggered
// EXEC-2: %run %run_opt %output %run_args


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
