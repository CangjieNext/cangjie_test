// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj main.cj

// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt %optimization_level_2 main.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj main.cj
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt %optimization_level_2 main.cj -o %output 2>&1 | compare %f
// RUN-EXEC-1: %run %run_opt %output %run_args

// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan S 7default1SS main.cj 1: memory 
// ASSERT: scan     changed members 3:
// ASSERT: scan          7default1SS1aV$$: body 
// ASSERT: scan          7default1SS1bV$$: body 
// ASSERT: scan          7default1SS1cV$$: body 
// ASSERT: scan incremental compilation triggered
// ASSERT: scan begin dump incremental compile result:
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:S in file main.cj in line 1 in column 15
// ASSERT: scan the changed decl after Spreading is:a in file main.cj in line 2 in column 16
// ASSERT: scan the changed decl after Spreading is:b in file main.cj in line 3 in column 16
// ASSERT: scan the changed decl after Spreading is:c in file main.cj in line 4 in column 25
// ASSERT: scan the changed decl after Spreading is:main in file main.cj in line 7 in column 1
// ASSERT: scan incremental sema


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
