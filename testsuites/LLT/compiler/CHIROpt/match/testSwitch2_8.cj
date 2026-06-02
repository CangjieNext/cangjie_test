// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan line:14 and the column:5 was optimized by The opt: switchOpt

enum E{
    e(Int64, Int64)|
    e(Int64)|
    e
}

main(): Int64 {
    var a : E = e(1) 
    let x : Int64 = 1
    match (a){
        case e(_,_) => 2
        case e(_) => x-1
        case e => 1
    }
} 

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
