// DEPENDENCE: %n.txt
// EXEC: %compiler %incrementalCompile %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.txt %n.cj
// EXEC: %compiler %incrementalCompile %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// ASSERT: scan the changed decl after Spreading is:c in file ModifyVariableValue2.cj in line 13 in column 5
// EXEC-1: %run %run_opt %output %run_args

var a:Int64 = 0
var b:Int64 = 1
var c:Int64 = a
main():Int64{
    return c
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
