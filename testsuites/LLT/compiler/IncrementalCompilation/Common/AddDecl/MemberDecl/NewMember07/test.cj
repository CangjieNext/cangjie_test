// DEPENDENCE: ../%n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj -o %output
// EXEC-5: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %n.inc.cj -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:fi1 in file test.inc.cj in line 9 in column 10
// ASSERT: scan the changed decl after Spreading is:fi2 in file test.inc.cj in line 39 in column 10
// ASSERT: scan the changed decl after Spreading is:test in file test.inc.cj in line 42 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file test.inc.cj in line 47 in column 1

// EXEC-5: %run %run_opt %output %run_args

// fi2 in interface should not be influenced
// test,main are affected by position changing


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
