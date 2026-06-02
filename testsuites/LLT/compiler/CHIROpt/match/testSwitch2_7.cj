// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan line:11 and the column:12 was optimized by The opt: switchOpt
// ASSERT: scan line:12 and the column:14 was optimized by The opt: switchOpt

enum RGBColor {
    | Red(Int64)  | Green(Int64, Rune) | Blue(UInt64)| Pink
}

func f(rType: RGBColor): Int64 {    
    return match (rType) {
        case Red(-1) => 1
        case Red(_) => 2 
        case Green(1, r'a') =>  3
        case Green(_, r'b') =>  4
        case Green(1, _) =>  5
        case Green(_, _) =>  6
        case Blue(_) =>  7 
        case Pink => 8
    }
}

main() {
    if( f(Red(-3)) != 2){
        return 1
    }
    if( f(Green(3,r'b')) != 4){
        return 2
    }
    if( f(Green(1,r'a')) != 3 ){
        return 3
    }    
    if( f(Green(3,r'a')) != 6 ){
        return 4
    } 
    if( f(Blue(3)) != 7 ) {
        return 5
    }
    return 0
}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
