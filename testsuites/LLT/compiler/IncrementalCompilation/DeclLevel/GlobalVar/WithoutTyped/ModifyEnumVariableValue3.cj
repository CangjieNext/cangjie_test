// DEPENDENCE: %n.txt
// EXEC: %compiler %incrementalCompile %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.txt %n.cj
// EXEC: %compiler %incrementalCompile %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// ASSERT: scan the changed decl after Spreading is:v in file ModifyEnumVariableValue3.cj in line 14 in column 5
// EXEC-1: %run %run_opt %output %run_args

enum E{
    A(Int64) | B(Int64, Int64) | C(Int64, Int64, Int64)
}
var v:E = B(-1, 1)

main():Int64{
    return match(v){
        case A(a) => a 
        case B(a, b) => a + b
        case C(a, b, c) => a + b + c
    }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
