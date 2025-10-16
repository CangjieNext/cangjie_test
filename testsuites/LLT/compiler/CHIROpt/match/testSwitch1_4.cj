// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan line:11 and the column:16 was optimized by The opt: switchOpt

enum RGBColor {
    | Red  | Green | Blue 
}

public class test{ 
    static func f(rType: RGBColor): Int64 {    
        return match (rType) {
            case Red => 1
            case Green =>  2
            case Blue =>  3
        }  
    }
}
 
main() {
    if(test.f(Red) == 1){
        return 0
    }
    return 1
}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
