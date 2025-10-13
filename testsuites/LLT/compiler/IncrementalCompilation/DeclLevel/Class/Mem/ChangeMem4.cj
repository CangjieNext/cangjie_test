// DEPENDENCE: %n.old.cj %n.new.cj

// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC-3: %run %run_opt %output %run_args

// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj

// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// EXEC-3: %run %run_opt %output %run_args

// ASSERT: scan incremental compilation triggered
// ASSERT: scan-not the changed decl after Spreading is:useA
// ASSERT: scan-not the changed decl after Spreading is:useB
// ASSERT: scan-not the changed decl after Spreading is:a
// ASSERT: scan-not the changed decl after Spreading is:b
// ASSERT: scan the changed decl after Spreading is:c
// ASSERT: scan the changed decl after Spreading is:useC
// ASSERT: scan the changed decl after Spreading is:main

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
