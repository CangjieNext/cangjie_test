// DEPENDENCE: template.cj %n.new.cj
// EXEC: %cpfile template.cj main.cj
// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj main.cj
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan S 7default1SI main.cj 1: virtual 
// ASSERT: scan added members 2: 7default4sizeP1SI3getF$$i 7default4sizeP1SI3setF$$i 
// ASSERT: scan deleted members 2: 7default4sizeP1SI3getF$$l 7default4sizeP1SI3setF$$l 
// ASSERT: scan changed members 1:
// ASSERT: scan 7default1SI4sizeP: srcuse 
// ASSERT: scan incremental compilation triggered
// ASSERT: scan begin dump incremental compile result:
// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:S in file main.cj in line 1 in column 11
// ASSERT: scan the changed decl after Spreading is:size in file main.cj in line 3 in column 10
// ASSERT: scan the changed decl after Spreading is:set in file main.cj in line 6 in column 9
// ASSERT: scan the changed decl after Spreading is:get in file main.cj in line 11 in column 9
// ASSERT: scan deleted decls: 2
// ASSERT: scan the deleted decl is:7default4sizeP1SI3getF$$l
// ASSERT: scan the deleted decl is:7default4sizeP1SI3setF$$l
// ASSERT: scan incremental sema
 


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
