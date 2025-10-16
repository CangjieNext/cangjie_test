// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %enableO2 %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj

// ASSERT: scan closure convert out func recompile, roll back to full compilation
// ASSERT: scan the changed decl after Spreading is:test in file test_RedundantFuture01.old.cj in line 1 in column 6
// EXEC-PIPE-0: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
