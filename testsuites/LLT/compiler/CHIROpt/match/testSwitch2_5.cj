// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan line:18 and the column:12 was optimized by The opt: switchOpt
// ASSERT: scan line:27 and the column:12 was optimized by The opt: switchOpt
// ASSERT: scan line:36 and the column:12 was optimized by The opt: switchOpt
// ASSERT: scan line:38 and the column:14 was optimized by The opt: switchOpt
// ASSERT: scan line:48 and the column:12 was optimized by The opt: switchOpt
// ASSERT: scan line:50 and the column:14 was optimized by The opt: switchOpt


// ASSERT: scan line:67 and the column:12 was optimized by The opt: switchOpt
// ASSERT: scan line:68 and the column:14 was optimized by The opt: switchOpt
// ASSERT: scan line:68 and the column:47 was optimized by The opt: switchOpt
enum RGBColor {
    | Red(Int64)  | Green(Int64, Rune) | Blue | Pink
}
func f1(rType: RGBColor): Int64 {    
    return match (rType) {
        case RGBColor.Pink => 1
        case RGBColor.Blue => 2
        case RGBColor.Blue => 3
        case _ => 4
    }
}

func f2(rType: RGBColor): Int64 {    
    return match (rType) {
        case Pink => 1
        case Blue => 2
        case Blue => 3
        case _ => 4
    }
}

func f3(rType: RGBColor): Int64 {    
    return match (rType) {
        case Red(-1) => 1
        case Red(2) => 2  
        case Red(3) => 3  
        case Red(3) => 4  
        case Red(4) => 5  
        case Red(_) => 6   
        case _ => 8
    }
}

func f4(rType: RGBColor): Int64 {    
    return match (rType) {
        case Red(-1) => 1
        case Red(2) => 2  
        case Red(3) => 3  
        case Red(4) => 4  
        case Pink => 6
        case _ => 8
    }
}

func f5(rType:Option<Int64>): Int64 {     
    return match (rType) {
        case Some(100) => 1
        case None => 2
        case _ => 3
    }
}

func f6(rType: RGBColor): Int64 {     
    return match (rType) {
        case Red(1) |Red(2) |Red(3) |Red(4) | Green(1, 'a')  => 1
        case _ => 3
    }
}

main() {
    if ( f1(Blue) != 2){
        return 1;
    }
    if ( f2(Blue) != 2 ){
        return 2;
    }
    if ( f3(Red(3)) != 3 || f3(Red(5)) != 6 || f3(Blue) != 8 ){
        return 3;
    }
    if( f4(Red(5)) != 8){
        return 4
    }
    if( f5(Some(100)) != 1){
        return 5
    }    
    if( f6(Red(2)) != 1){
        return 6
    }
    return 0
}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
