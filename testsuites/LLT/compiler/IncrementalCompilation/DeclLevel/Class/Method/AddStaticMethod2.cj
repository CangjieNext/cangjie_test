// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC-2: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:Child in file AddStaticMethod2.old.cj in line 13 in column 14
// ASSERT: scan the changed decl after Spreading is:test in file AddStaticMethod2.old.cj in line 14 in column 30
// ASSERT: scan the changed decl after Spreading is:test2 in file AddStaticMethod2.old.cj in line 19 in column 13
// ASSERT: scan the changed decl after Spreading is:main in file AddStaticMethod2.old.cj in line 23 in column 1
// EXEC-3: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
