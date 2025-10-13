// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj -o %output -Woff unused
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %n.inc.cj -o %output -Woff unused 2>&1 | compare %f
// ASSERT: scan A 7default1AC acc.inc.cj 1: srcuse 
// ASSERT: scan B 7default1BC acc.inc.cj 5: sig 
// ASSERT: scan C 7default1CC acc.inc.cj 13: body 
// ASSERT: scan     changed members 1:
// ASSERT: scan          7default1CC3jerP: sig 
// ASSERT: scan changed decls to recompile: 6
// ASSERT: scan the changed decl after Spreading is:A in file acc.inc.cj in line 2 in column 7
// ASSERT: scan the changed decl after Spreading is:B in file acc.inc.cj in line 6 in column 14
// ASSERT: scan the changed decl after Spreading is:too in file acc.inc.cj in line 7 in column 27
// ASSERT: scan the changed decl after Spreading is:C in file acc.inc.cj in line 13 in column 7
// ASSERT: scan the changed decl after Spreading is:jer in file acc.inc.cj in line 14 in column 17
// ASSERT: scan the changed decl after Spreading is:get in file acc.inc.cj in line 15 in column 9


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
