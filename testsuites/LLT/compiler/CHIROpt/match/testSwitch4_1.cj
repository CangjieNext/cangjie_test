// (CJNATIVE) EXEC: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC: %run %run_opt %output %run_args
// ASSERT: scan line:6 and the column:12 was optimized by The opt: switchOpt

func f(c:Rune){
  let cs = match (c) { 
        case r'a' | r'b' | r'b' => 1  
        case r'c' | r'b' => 2
        case _  => 3  
        case r'd'  => 4
    }
    return cs
}

main() {
    let c = r'a'
    if(f(c) == 1){
        return 0
    }
    return 1
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
