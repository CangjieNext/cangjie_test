to test the '--test' option ('cmp_utest_opt') under incremental compilation

// DEPENDENCE: %n.old.cj %n.new.cj %n.diag.txt
// EXEC: %compiler %incrementalCompile %noStackInfo %cmp_opt %n.old.cj -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args >%redirectNull
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %noStackInfo %cmp_opt %n.old.cj -o %output %cmp_utest_opt 2>&1 | compare %n.diag.txt
// EXEC: (cd .cached && %cat *.log) | compare %f
// ASSERT: scan 2 order changed decl(s).
// ASSERT: scan order change 7default1bV$$
// ASSERT: scan order change 1c1d

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
