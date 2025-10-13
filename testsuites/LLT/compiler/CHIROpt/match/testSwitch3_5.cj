// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan line:12 and the column:12 was optimized by The opt: switchOpt
// ASSERT: scan line:13 and the column:14 was optimized by The opt: switchOpt
// ASSERT: scan line:15 and the column:31 was optimized by The opt: switchOpt

enum RGBColor {
    | Red(Int32)  | Green(Int64, Int64, Int64) | Blue(Int64, Int64)
}

func f(rType: RGBColor): Int64 {    
    return match (rType) {
        case Blue(1, 2)  => 0       
        case Blue(1, _)  => 1 
        case Green(_, _ ,2) | Red(1)  => 1
        case Green(2, 3 ,2) | Green(1, 1 ,2) => 2
        case Red(1) | Green(1, 1 ,3) | Red(2) => 1
        case Red(2) => 2
        case _ => 6
    }
}

main() {
    if (f(Blue(1,2)) != 0 || f(Blue(2,2)) != 6){
        return 1
    }    
    if (f(Green(2,3,2)) != 1 || f(Green(1,1,2)) != 1 ){
        return 2
    } 
    if (f(Red(1)) != 1){
        return 3
    }        
    return 0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
