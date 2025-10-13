// DEPENDENCE: template.cj %n.new.cj
// EXEC: %cpfile template.cj main.cj
// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj main.cj
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan added I1 7default2I1I at 11,18
// ASSERT: scan added I2 7default2I2I at 15,18
// ASSERT: scan deleted 7default1II
// ASSERT: scan S 7default1S<1>S main.cj 2: sig 
// ASSERT: scan incremental compilation triggered
// ASSERT: scan begin dump incremental compile result:
// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:S in file main.cj in line 3 in column 8
// ASSERT: scan the changed decl after Spreading is:I1 in file main.cj in line 11 in column 18
// ASSERT: scan the changed decl after Spreading is:I2 in file main.cj in line 15 in column 18
// ASSERT: scan deleted decls: 1
// ASSERT: scan the deleted decl is:7default1II
// ASSERT: scan incremental sema
 


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
