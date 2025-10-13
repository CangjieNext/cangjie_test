// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan Data 7default4DataC VariableParameter_TypeChange.old.cj 1: memory
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:Data in file VariableParameter_TypeChange.old.cj in line 1 in column 7
// ASSERT: scan the changed decl after Spreading is:b in file VariableParameter_TypeChange.old.cj in line 2 in column 5
// ASSERT: scan the changed decl after Spreading is:Data in file VariableParameter_TypeChange.old.cj in line 3 in column 1
// ASSERT: scan the changed decl after Spreading is:a in file VariableParameter_TypeChange.old.cj in line 3 in column 20
// ASSERT: scan the changed decl after Spreading is:run in file VariableParameter_TypeChange.old.cj in line 9 in column 6
// EXEC-0: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
