// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC-2: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan A 7default1AC VariableParameter_ChangeAccessibility2_Full.old.cj 1: memory
// ASSERT: scan changed decls to recompile: 6
// ASSERT: scan the changed decl after Spreading is:A in file VariableParameter_ChangeAccessibility2_Full.old.cj in line 1 in column 12
// ASSERT: scan the changed decl after Spreading is:A in file VariableParameter_ChangeAccessibility2_Full.old.cj in line 2 in column 5
// ASSERT: scan the changed decl after Spreading is:b in file VariableParameter_ChangeAccessibility2_Full.old.cj in line 2 in column 31
// ASSERT: scan the changed decl after Spreading is:init in file VariableParameter_ChangeAccessibility2_Full.old.cj in line 6 in column 5
// ASSERT: scan the changed decl after Spreading is:foo in file VariableParameter_ChangeAccessibility2_Full.old.cj in line 9 in column 10
// ASSERT: scan the changed decl after Spreading is:main in file VariableParameter_ChangeAccessibility2_Full.old.cj in line 12 in column 1
// EXEC-2: %run %run_opt %output %run_args


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
