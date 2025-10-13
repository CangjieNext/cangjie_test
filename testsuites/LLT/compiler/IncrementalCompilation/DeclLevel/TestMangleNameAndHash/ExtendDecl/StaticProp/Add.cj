// DEPENDENCE: template.cj %n.new.cj
// EXEC: %cpfile template.cj main.cj
// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj main.cj
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan 1A<:X main.cj 5:
// ASSERT: scan added members 1: 7default7Extend!1A<:X5size2P 
// ASSERT: scan incremental compilation triggered
// ASSERT: scan begin dump incremental compile result:
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:A in file main.cj in line 1 in column 7
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file main.cj in line 5 in column 1
// ASSERT: scan the changed decl after Spreading is:size2 in file main.cj in line 24 in column 10
// ASSERT: scan the changed decl after Spreading is:set in file main.cj in line 27 in column 9
// ASSERT: scan the changed decl after Spreading is:get in file main.cj in line 30 in column 9
// ASSERT: scan incremental sema
 


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
