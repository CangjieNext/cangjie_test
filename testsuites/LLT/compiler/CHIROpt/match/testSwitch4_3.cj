// (CJNATIVE) EXEC: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC: %run %run_opt %output %run_args
// ASSERT: scan line:8 and the column:13 was optimized by The opt: switchOpt
// ASSERT: scan line:10 and the column:13 was optimized by The opt: switchOpt

main() {
    let c:Int64 = 101
    let t = match (c) {
        case 101 | 102 | 103 => 
            match(c){
                case 101 => return 0
                case _ => return 2
            }
        case 104 => return 2
        case 104 => return 2
        case _ => return 2
    } 
    return t 
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
