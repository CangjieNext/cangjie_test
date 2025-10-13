// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// EXEC-4: %run %run_opt %output %run_args
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:bar_cc_wrapper in file AddCCWrapper.old.cj in line 21 in column 5
// ASSERT: scan the changed decl after Spreading is:foo_cc_wrapper in file AddCCWrapper.old.cj in line 20 in column 6
// ASSERT: scan the changed decl after Spreading is:got_cc_wrapper in file AddCCWrapper.old.cj in line 22 in column 5
// ASSERT: scan the changed decl after Spreading is:main in file AddCCWrapper.old.cj in line 16 in column 1
// ASSERT: scan the changed decl after Spreading is:u1 in file AddCCWrapper.old.cj in line 8 in column 6

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
