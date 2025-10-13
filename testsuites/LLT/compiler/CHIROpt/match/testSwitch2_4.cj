// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not file: testSwitch2_4.cj.* was optimized by The opt: switchOpt

func f0(rType: RGBColor): Int64 {
    return match (rType) {
        case _ => 3
    }
}

enum RGBColor {
    | Red((Int64,Int64))  | Green(String, Int64) | Blue(Int64, Int64)| Pink(Int64)
}

func f(rType: RGBColor): Int64 {    
    return match (rType) {
        case Red((1,1)) => 1
        case Green("abc", 1) => 2
        case Blue(3,3) => 3
        case _ => 6
    }
}

func f1(rType: RGBColor): Int64 {    
    return match (rType) {
        case Blue(_,1) =>  3
        case x =>  8 // not support binding pattern
    }
}

func f2(rType: RGBColor): Int64 {    
    return match (rType) {
        case Blue(x,1) =>  3 // not support binding pattern
        case _ =>  8 
    }
}

func f3(rType: RGBColor): Int64 {    
    return match (rType) {
        case Pink(p) where p > 1 => 1
        case Blue(_,1) =>  3
        case _ =>  8 
    }
}

func f5(rType: RGBColor): Int64 {    
    return match (rType) { 
        case _ =>  8 
    }
}

main() {
    if ( f(Red((1,2))) != 6){
        return 1;
    }
    if ( f(Green("abc", 2)) != 6){
        return 2;
    }
    if( f(Blue(1,2)) != 6) {
        return 3
    }
    if( f(Pink(-1)) != 6) {
        return 4
    }    
    if( f1(Pink(2)) != 8) {
        return 5
    }      
    if( f5(Pink(2)) != 8) {
        return 5
    }       
    return 0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
