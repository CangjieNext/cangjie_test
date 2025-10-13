// DEPENDENCE: ../%n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj -o %output
// EXEC-5: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %n.inc.cj -o %output 2>&1 | compare %f
// ASSERT: scan the changed decl after Spreading is:fi1 in file test.inc.cj in line 9 in column 10
// ASSERT: scan the changed decl after Spreading is:A in file test.inc.cj in line 21 in column 12
// ASSERT: scan the changed decl after Spreading is:fi1 in file test.inc.cj in line 25 in column 22
// ASSERT: scan the changed decl after Spreading is:fi2 in file test.inc.cj in line 33 in column 22
// ASSERT: scan the changed decl after Spreading is:B in file test.inc.cj in line 38 in column 7
// ASSERT: scan the changed decl after Spreading is:fi2 in file test.inc.cj in line 39 in column 17
// ASSERT: scan the changed decl after Spreading is:fi1 in file test.inc.cj in line 42 in column 17
// ASSERT: scan the changed decl after Spreading is:test in file test.inc.cj in line 47 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file test.inc.cj in line 52 in column
// EXEC-5: %run %run_opt %output %run_args

// add new open function, affect A,B.
// fi2,test,main are affect by position changing


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
