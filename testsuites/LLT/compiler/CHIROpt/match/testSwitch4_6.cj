// (CJNATIVE) EXEC: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not file: testSwitch4_6.cj.* was optimized by The opt: switchOpt

main() {
    let c:Float32 = 1.1
    let t = match (c) {
        case 1.1 => 0
        case 1.2 => return 2
        case _ => return 2
    } 
    return t 
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
