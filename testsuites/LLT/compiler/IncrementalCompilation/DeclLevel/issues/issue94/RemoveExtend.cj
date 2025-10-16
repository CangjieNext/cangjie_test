// DEPENDENCE: main.old.cj main.new.cj
// EXEC: %compiler %incrementalCompile main.new.cj -o %output
// EXEC: %cpfile main.old.cj main.new.cj
// EXEC-PIPE-0: %compiler %incrementalCompile main.new.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:A in file main.new.cj in line 1 in column 7
// ASSERT: scan the changed decl after Spreading is:a in file main.new.cj in line 2 in column 23
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file main.new.cj in line 5 in column 1
// ASSERT: scan the changed decl after Spreading is:me in file main.new.cj in line 6 in column 24
// ASSERT: scan the changed decl after Spreading is:main in file main.new.cj in line 17 in column 1


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
