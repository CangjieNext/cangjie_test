// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan line:10 and the column:14 was optimized by The opt: switchOpt

enum RGBColor {
    | Red  | Green | Blue | Yellow | Pink
}
main() {
    let c = RGBColor.Pink 
    let cs = match (c) { 
        case Green | Red | Red => " Green or red  "  
        case Blue | Red => "Blue"
        case Yellow | Pink => "Yellow or Pink"
        case Blue | Pink => "error" 
    }
    if(cs == "Yellow or Pink"){
        return 0
    }
    return 1
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
