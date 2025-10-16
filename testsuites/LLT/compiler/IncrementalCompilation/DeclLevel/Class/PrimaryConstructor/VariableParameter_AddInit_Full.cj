// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan B 7default1BS VariableParameter_AddInit_Full.old.cj 4: memory
// ASSERT: scan C 7default1CS VariableParameter_AddInit_Full.old.cj 9: memory
// ASSERT: scan changed decls to recompile: 8
// ASSERT: scan the changed decl after Spreading is:A in file VariableParameter_AddInit_Full.old.cj in line 2 in column 5
// ASSERT: scan the changed decl after Spreading is:B in file VariableParameter_AddInit_Full.old.cj in line 4 in column 8
// ASSERT: scan the changed decl after Spreading is:B in file VariableParameter_AddInit_Full.old.cj in line 5 in column 5
// ASSERT: scan the changed decl after Spreading is:b in file VariableParameter_AddInit_Full.old.cj in line 5 in column 21
// ASSERT: scan the changed decl after Spreading is:c in file VariableParameter_AddInit_Full.old.cj in line 5 in column 36
// ASSERT: scan the changed decl after Spreading is:C in file VariableParameter_AddInit_Full.old.cj in line 9 in column 8
// ASSERT: scan the changed decl after Spreading is:C in file VariableParameter_AddInit_Full.old.cj in line 10 in column 5
// ASSERT: scan the changed decl after Spreading is:main in file VariableParameter_AddInit_Full.old.cj in line 14 in column 1
// EXEC-1: %run %run_opt %output %run_args


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
