// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// RUN-EXEC-2: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// RUN-EXEC-1: %run %run_opt %output %run_args

// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:k in file ExtendCString.old.cj in line 4 in column 13
// ASSERT: scan the changed decl after Spreading is:main in file ExtendCString.old.cj in line 10 in column 1
// ASSERT: scan the changed decl after Spreading is:foo in file ExtendCString.old.cj in line 14 in column 10

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
