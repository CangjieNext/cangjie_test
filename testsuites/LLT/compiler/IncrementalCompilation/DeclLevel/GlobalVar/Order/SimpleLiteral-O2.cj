// LEVEL: 0
// DEPENDENCE: SimpleLiteral.old.cj SimpleLiteral.new.cj SimpleLiteral.chirtxt
// EXEC: %compiler %incrementalCompile %cmp_opt %enableCompileDebug SimpleLiteral.old.cj -O2 -o %output
// EXEC-0: %run %run_opt %output %run_args
// EXEC: %cpfile SimpleLiteral.new.cj SimpleLiteral.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %enableCompileDebug SimpleLiteral.old.cj -O2 -o %output %dumpCHIRDebug 2>&1 | compare %f
// EXEC: compare SimpleLiteral.chirtxt <SimpleLiteral-O2_CHIR/0_AST_CHIR.chirtxt
// ASSERT: scan changed decls to recompile: 1
// ASSERT: scan the changed decl after Spreading is:main
// EXEC: %run %run_opt %output %run_args | compare SimpleLiteral.new.cj


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
