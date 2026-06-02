// (CJNATIVE) EXEC: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC: %run %run_opt %output %run_args
// ASSERT: scan line:9 and the column:12 was optimized by The opt: switchOpt
// ASSERT: scan line:19 and the column:12 was optimized by The opt: switchOpt
// ASSERT: scan line:29 and the column:12 was optimized by The opt: switchOpt
// ASSERT: scan line:39 and the column:12 was optimized by The opt: switchOpt

func fu8(c:UInt8){
  let cs = match (c) { 
        case 1 | 2 | 2 => 1  
        case 5 | 2 => 2
        case _  => 3  
        case 6  => 4
    }
    return cs
}

func fu16(c:UInt16){
  let cs = match (c) { 
        case 1 | 2 | 2 => 1  
        case 5 | 2 => 2
        case _  => 3  
        case 6  => 4
    }
    return cs
}

func fu32(c:UInt32){
  let cs = match (c) { 
        case 1 | 2 | 2 => 1  
        case 5 | 2 => 2
        case _  => 3  
        case 6  => 4
    }
    return cs
}

func fu64(c:UInt64){
  let cs = match (c) { 
        case 1 | 2 | 2 => 1  
        case 5 | 2 => 2
        case _  => 3  
        case 6  => 4
    }
    return cs
}

main() {
    let u8:UInt8 = 2
    let u16:UInt16 = 2
    let u32:UInt32 = 2
    let u64:UInt64 = 2
    if(fu8(u8) == 1 && fu16(u16) == 1 && fu32(u32) == 1 && fu64(u64) == 1){
        return 0
    }
    return 1
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
