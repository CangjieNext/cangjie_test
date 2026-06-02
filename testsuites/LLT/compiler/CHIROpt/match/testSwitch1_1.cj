// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %enableO2 %debugCHIROpt %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan line:10 and the column:14 was optimized by The opt: switchOpt

enum RGBColor {
    | Red  | Green | Blue 
}
main() {
    let c = RGBColor.Red 
    let cs = match (c) { 
        case Green => "Green"  
        case Blue  => "Blue"
        case Red  => "red"  
    }
    print(cs)
    if( cs == "red" ){ 
        return 0
    }
    return 1
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
