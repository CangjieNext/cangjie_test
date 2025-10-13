// DEPENDENCE: %n.txt
// EXEC: %compiler %incrementalCompile %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.txt %n.cj
// EXEC: %compiler %incrementalCompile %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:VarWithPatternDecl in file ModifyPatternVariableValue2.cj in line 15 in column 1
// ASSERT: scan the changed decl after Spreading is:a in file ModifyPatternVariableValue2.cj in line 15 in column 6
// ASSERT: scan the changed decl after Spreading is:b in file ModifyPatternVariableValue2.cj in line 15 in column 10
// ASSERT: scan the changed decl after Spreading is:c in file ModifyPatternVariableValue2.cj in line 15 in column 13
// EXEC-1: %run %run_opt %output %run_args

var d = (2, 2)
var e = (1, 2)
var (a, (b, c)):(Int64, (Int64, Int64)) = (4, d)

main():Int64{
    return a - (b + c)
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
