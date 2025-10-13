// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj --fchir-function-inlining -o %output
// EXEC-1: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj --fchir-function-inlining -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:A in file ModifyVarO2.old.cj in line 1 in column 7
// ASSERT: scan the changed decl after Spreading is:a in file ModifyVarO2.old.cj in line 2 in column 9
// ASSERT: scan the changed decl after Spreading is:init in file ModifyVarO2.old.cj in line 3 in column 5
// ASSERT: scan the changed decl after Spreading is:u1 in file ModifyVarO2.old.cj in line 6 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file ModifyVarO2.old.cj in line 10 in column 1
// EXEC-1: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
