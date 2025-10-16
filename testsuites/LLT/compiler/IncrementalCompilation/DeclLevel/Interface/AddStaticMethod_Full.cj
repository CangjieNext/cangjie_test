// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC-1: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:A in file AddStaticMethod_Full.old.cj in line 1 in column 11
// ASSERT: scan the changed decl after Spreading is:bar in file AddStaticMethod_Full.old.cj in line 2 in column 17
// ASSERT: scan the changed decl after Spreading is:B in file AddStaticMethod_Full.old.cj in line 4 in column 7
// ASSERT: scan the changed decl after Spreading is:main in file AddStaticMethod_Full.old.cj in line 8 in column 1
// EXEC-1: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
