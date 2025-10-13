// DEPENDENCE: template.cj %n.new.cj
// EXEC: %cpfile template.cj main.cj
// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj main.cj
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan added 1m1nT2_ll at 0,0
// ASSERT: scan added m 7default1mV$$ at 3,2
// ASSERT: scan added n 7default1nV$$ at 3,5
// ASSERT: scan deleted 1x1yT2_ll
// ASSERT: scan deleted 7default1xV$$
// ASSERT: scan deleted 7default1yV$$
// ASSERT: scan incremental compilation triggered
// ASSERT: scan begin dump incremental compile result:
// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:VarWithPatternDecl in file main.cj in line 1 in column 1
// ASSERT: scan the changed decl after Spreading is:m in file main.cj in line 3 in column 2
// ASSERT: scan the changed decl after Spreading is:n in file main.cj in line 3 in column 5
// ASSERT: scan deleted decls: 3
// ASSERT: scan the deleted decl is:7default1xV$$
// ASSERT: scan the deleted decl is:7default1yV$$
// ASSERT: scan the deleted decl is:1x1yT2_ll
// ASSERT: scan incremental sema
 


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
