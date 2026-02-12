// DEPENDENCE: %n.old.cj %n.new.cj %n.diag.txt

// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output

// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %n.diag.txt
// EXEC: (cd .cached && %cat *.log) | compare %f

// ASSERT: scan incremental compilation triggered
// ASSERT: scan the changed decl after Spreading is:foo
// ASSERT: scan the changed decl after Spreading is:main
// ASSERT: scan the changed decl after Spreading is:useType

// EXEC: %run %run_opt %output %run_args


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
