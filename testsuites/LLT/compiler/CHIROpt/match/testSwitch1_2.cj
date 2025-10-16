// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan line:12 and the column:22 was optimized by The opt: switchOpt

enum RGBColor {
    | Red  | Green | Blue 
}

public class test{
    var needSwaped: Bool
    init(x:RGBColor){
        needSwaped = match (x) { 
            case Red  => false 
            case Green => true  
            case Blue  => false 
        }
    }
}

main() {
    let c = RGBColor.Green 
    var a = test(c)
    if(a.needSwaped){
        return 0 
    }
    return 1
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
