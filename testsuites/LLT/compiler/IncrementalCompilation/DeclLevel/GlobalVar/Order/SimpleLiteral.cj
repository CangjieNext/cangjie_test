// LEVEL: 0
// DEPENDENCE: %n.old.cj %n.new.cj %n.chirtxt
// EXEC: %compiler %incrementalCompile %cmp_opt %enableCompileDebug %n.old.cj -o %output
// EXEC-0: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %enableCompileDebug %n.old.cj -o %output %dumpCHIRDebug 2>&1 | compare %f
// EXEC: compare SimpleLiteral.chirtxt <SimpleLiteral_CHIR_Debug/0_AST_CHIR.chirtxt
// ASSERT: scan changed decls to recompile: 1
// ASSERT: scan the changed decl after Spreading is:main
// EXEC: %run %run_opt %output %run_args | compare %n.new.cj


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
