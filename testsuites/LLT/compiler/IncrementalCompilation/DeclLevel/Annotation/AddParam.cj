// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// ASSERT: scan changed decls to recompile: 2
// ASSERT: scan the changed decl after Spreading is:a in file AddParam.old.cj in line 2 in column 6
// ASSERT: scan the changed decl after Spreading is:c in file AddParam.old.cj in line 5 in column 6
// ASSERT: scan error: '@C' should have no arg
// ASSERT: scan ==> AddParam.old.cj:1:4:
// ASSERT: scan | 
// ASSERT: scan 1 | @C[-3333]
// ASSERT: scan 1 error generated, 1 error printed.

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
