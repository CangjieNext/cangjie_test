// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj --fchir-function-inlining -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj --fchir-function-inlining -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:V in file ChangeName.old.cj in line 5 in column 8
// ASSERT: scan the changed decl after Spreading is:jam in file ChangeName.old.cj in line 6 in column 17
// ASSERT: scan the changed decl after Spreading is:main in file ChangeName.old.cj in line 9 in column 1
// EXEC: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
