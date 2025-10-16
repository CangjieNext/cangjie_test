// (CJNATIVE) EXEC: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not file: testSwitch4_8.cj.* was optimized by The opt: switchOpt
 
main() {
    let Int64_MIN_VALUE: Int64 = -0x8000000000000000
    let c:Int64 = Int64_MIN_VALUE
    var data1: Int64 = Int64_MIN_VALUE + 1;
    var data2: Int64 = Int64_MIN_VALUE + 2;
    let t = match (c) {
        case data1 => return 0
        case data2 => return 1
        case Int64_MIN_VALUE => 2
        case _ => return 3
    } 
    return t 
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
