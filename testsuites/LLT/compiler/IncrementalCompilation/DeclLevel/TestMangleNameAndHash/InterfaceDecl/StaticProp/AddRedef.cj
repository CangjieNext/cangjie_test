// DEPENDENCE: template.cj %n.new.cj
// EXEC: %cpfile template.cj main.cj
// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj main.cj
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan added I 7default1II at 18,11
// ASSERT: scan S 7default1SI main.cj 1: sig 
// ASSERT: scan changed members 1:
// ASSERT: scan 7default1SI4sizeP: body 
// ASSERT: scan incremental compilation triggered
// ASSERT: scan begin dump incremental compile result:
// ASSERT: scan changed decls to recompile: 8
// ASSERT: scan the changed decl after Spreading is:S in file main.cj in line 1 in column 11
// ASSERT: scan the changed decl after Spreading is:size in file main.cj in line 6 in column 10
// ASSERT: scan the changed decl after Spreading is:set in file main.cj in line 9 in column 9
// ASSERT: scan the changed decl after Spreading is:get in file main.cj in line 12 in column 9
// ASSERT: scan the changed decl after Spreading is:I in file main.cj in line 18 in column 11
// ASSERT: scan the changed decl after Spreading is:size in file main.cj in line 19 in column 21
// ASSERT: scan the changed decl after Spreading is:set in file main.cj in line 20 in column 9
// ASSERT: scan the changed decl after Spreading is:get in file main.cj in line 23 in column 9
// ASSERT: scan incremental sema
 


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
