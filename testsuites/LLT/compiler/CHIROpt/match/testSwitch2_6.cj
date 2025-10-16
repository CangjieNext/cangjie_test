 // (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan line:12 and the column:12 was optimized by The opt: switchOpt
// ASSERT: scan line:14 and the column:14 was optimized by The opt: switchOpt
// ASSERT: scan line:15 and the column:14 was optimized by The opt: switchOpt

enum RGBColor {
    | Red(Int64)  | Green(Int64, Rune) | Blue(UInt64)| Pink
}

func f1(rType: RGBColor): Int64 {    
    return match (rType) { 
        case Red(-1) => 1
        case Red(2) => 2  
        case Green(1, r'a') =>  3
        case Green(1, r'b') =>  4
        case Green(2, _) =>  5   
        case Pink => 6
        case _ => 8
    }
}

main() {
    if( f1(Red(-3)) != 8 ) {
        return 1
    }    
    if( f1(Green(1,r'a')) != 3 ) {
        return 2
    }    
    if( f1(Green(2,r'a')) != 5 ) {
        return 3
    } 
    if( f1(Pink) != 6 ) {
        return 4
    }         
    return 0
}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
