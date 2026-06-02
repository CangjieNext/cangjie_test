// (CJNATIVE) EXEC: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC: %run %run_opt %output %run_args
// ASSERT: scan line:9 and the column:12 was optimized by The opt: switchOpt
// ASSERT: scan line:19 and the column:12 was optimized by The opt: switchOpt
// ASSERT: scan line:29 and the column:12 was optimized by The opt: switchOpt
// ASSERT: scan line:39 and the column:12 was optimized by The opt: switchOpt

func fi8(c:Int8){
  let cs = match (c) { 
        case 1 | 2 | 2 => 1  
        case 5 | 2 => 2
        case _  => 3  
        case 6  => 4
    }
    return cs
}

func fi16(c:Int16){
  let cs = match (c) { 
        case 1 | 2 | 2 => 1  
        case 5 | 2 => 2
        case _  => 3  
        case 6  => 4
    }
    return cs
}

func fi32(c:Int32){
  let cs = match (c) { 
        case 1 | 2 | 2 => 1  
        case 5 | 2 => 2
        case _  => 3  
        case 6  => 4
    }
    return cs
}

func fi64(c:Int64){
  let cs = match (c) { 
        case 1 | 2 | 2 => 1  
        case 5 | 2 => 2
        case _  => 3  
        case 6  => 4
    }
    return cs
}

main() {
    let i8:Int8 = 2
    let i16:Int16 = 2
    let i32:Int32 = 2
    let i64:Int64 = 2
    if(fi8(i8) == 1 && fi16(i16) == 1 && fi32(i32) == 1 && fi64(i64) == 1){
        return 0
    }
    return 1
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
