// DEPENDENCE: %n.old.cj %n.new.cj %n.diag.txt
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// RUN-EXEC-3: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %n.diag.txt
// EXEC: cat .cached/*.log | compare %f
// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:A in file ModifyOperator.old.cj in line 1 in column 7
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file ModifyOperator.old.cj in line 8 in column 1
// ASSERT: scan the changed decl after Spreading is:- in file ModifyOperator.old.cj in line 9 in column 26
// ASSERT: scan the changed decl after Spreading is:main in file ModifyOperator.old.cj in line 14 in column 1
// ASSERT: scan deleted decls: 1
// ASSERT: scan the deleted decl is:7default7Extend!1A<:X1+F1A$$

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
