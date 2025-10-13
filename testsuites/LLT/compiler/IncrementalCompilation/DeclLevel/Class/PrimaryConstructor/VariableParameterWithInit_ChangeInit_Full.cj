// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// ASSERT: scan A 7default1AC VariableParameterWithInit_ChangeInit_Full.old.cj 4: 
// ASSERT: scan     changed members 1:
// ASSERT: scan          7default1AC1AYll!V1b=: body 
// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:A in file VariableParameterWithInit_ChangeInit_Full.old.cj in line 5 in column 5
// ASSERT: scan the changed decl after Spreading is:b in file VariableParameterWithInit_ChangeInit_Full.old.cj in line 5 in column 21
// ASSERT: scan the changed decl after Spreading is:main in file VariableParameterWithInit_ChangeInit_Full.old.cj in line 7 in column 1
// EXEC-3: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
