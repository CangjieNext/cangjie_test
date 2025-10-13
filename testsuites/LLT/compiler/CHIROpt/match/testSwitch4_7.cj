// (CJNATIVE) EXEC: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not file: testSwitch4_7.cj.* was optimized by The opt: switchOpt

main() {
    let str:String = "hello world"
    let t = match (str) {
        case "hello cangjie" => return 2
        case "hello world" => 0
        case _ => return 2
    } 
    return t 
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
