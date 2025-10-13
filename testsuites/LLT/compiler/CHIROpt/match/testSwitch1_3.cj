// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan line:12 and the column:13 was optimized by The opt: switchOpt
// ASSERT: scan line:14 and the column:13 was optimized by The opt: switchOpt

enum RGBColor {
    | Red  | Green | Blue 
}

main() {
    var rType = RGBColor.Red 
    let t = match (rType) {
        case Red | Green => 
            match(rType){
                case Red => return 0
                case _ => return 2
            }
        case Green => return 2
        case Blue => return 2
    } 
    return t 
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
