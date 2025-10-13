// DEPENDENCE: template.cj %n.new.cj
// EXEC: %cpfile template.cj main.cj
// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj main.cj
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan E 7default1E<1>U main.cj 1: memory 
// ASSERT: scan added members 1: 7default1E<1>U1RFi$$ 
// ASSERT: scan deleted members 1: 7default1E<1>U1RFl$$ 
// ASSERT: scan incremental compilation triggered
// ASSERT: scan begin dump incremental compile result:
// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:E in file main.cj in line 2 in column 6
// ASSERT: scan the changed decl after Spreading is:R in file main.cj in line 7 in column 7
// ASSERT: scan the changed decl after Spreading is:G in file main.cj in line 8 in column 7
// ASSERT: scan deleted decls: 1
// ASSERT: scan the deleted decl is:7default1E<1>U1RFl$$
// ASSERT: scan incremental sema
 


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
