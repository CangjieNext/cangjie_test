// LEVEL: 0
// DEPENDENCE: %n.old.cj %n.new.cj %n.chirtxt %n.old.pkg.cj %n.new.pkg.cj
// EXEC: %cpfile %n.old.pkg.cj p1.cj
// EXEC: %compiler %incrementalCompile %compile_lib_opt p1.cj -o p1.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj p1.%lib_extension -o %output
// EXEC-0: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %cpfile %n.new.pkg.cj p1.cj
// EXEC: %compiler %incrementalCompile %compile_lib_opt p1.cj -o p1.%lib_extension
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj p1.%lib_extension -o %output %dumpCHIRDebug 2>&1 | compare %f
// EXEC: compare Imported.chirtxt <Imported_CHIR/0_AST_CHIR.chirtxt
// ASSERT: scan the changed decl after Spreading is:mm
// ASSERT: scan the changed decl after Spreading is:main
// EXEC: %run %run_opt %output %run_args | compare %n.new.cj


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
