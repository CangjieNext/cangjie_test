// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj -o %output
// EXEC-3: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %n.inc.cj -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:E in file test.inc.cj in line 19 in column 6
// ASSERT: scan the changed decl after Spreading is:E1 in file test.inc.cj in line 20 in column 5
// ASSERT: scan the changed decl after Spreading is:E2 in file test.inc.cj in line 20 in column 17
// ASSERT: scan the changed decl after Spreading is:getA in file test.inc.cj in line 23 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file test.inc.cj in line 28 in column 1

// EXEC-3: %run %run_opt %output %run_args



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
