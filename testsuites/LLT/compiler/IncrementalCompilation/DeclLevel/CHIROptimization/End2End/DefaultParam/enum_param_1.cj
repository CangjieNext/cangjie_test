// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj main.cj

// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt %optimization_level_2 main.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj main.cj
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt %optimization_level_2 main.cj -o %output 2>&1 | compare %f
// RUN-EXEC-1: %run %run_opt %output %run_args

// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan E 7default1EU main.cj 1: body 
// ASSERT: scan     changed members 1:
// ASSERT: scan          7default1EU3fooFl!5param=$$l: body 
// ASSERT: scan incremental compilation triggered
// ASSERT: scan begin dump incremental compile result:
// ASSERT: scan changed decls to recompile: 6
// ASSERT: scan the changed decl after Spreading is:E in file main.cj in line 1 in column 13
// ASSERT: scan the changed decl after Spreading is:R in file main.cj in line 2 in column 5
// ASSERT: scan the changed decl after Spreading is:G in file main.cj in line 2 in column 9
// ASSERT: scan the changed decl after Spreading is:B in file main.cj in line 2 in column 13
// ASSERT: scan the changed decl after Spreading is:foo in file main.cj in line 3 in column 17
// ASSERT: scan the changed decl after Spreading is:main in file main.cj in line 8 in column 1
// ASSERT: scan incremental sema


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
