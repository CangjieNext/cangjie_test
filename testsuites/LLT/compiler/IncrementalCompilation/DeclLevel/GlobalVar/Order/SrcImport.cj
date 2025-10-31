// LEVEL: 0
// DEPENDENCE: %n.old.cj %n.new.cj %n.chirtxt
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC-2: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj %dumpCHIRDebug -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:m1 in file SrcImport.old.cj in line 5 in column 5
// ASSERT: scan the changed decl after Spreading is:b in file SrcImport.old.cj in line 6 in column 5
// ASSERT: scan the changed decl after Spreading is:main in file SrcImport.old.cj in line 8 in column 1
// EXEC-2: %run %run_opt %output %run_args
// EXEC: compare %n.chirtxt <SrcImport_CHIR/0_AST_CHIR.chirtxt


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
