// LEVEL: 0
// EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 %cmp_opt %chir2llvm %f -o %output 2>&1 | compare %f
// ASSERT: scan The apply node in the line:15 and the column:9 was optimized by The opt: Function Inline

// random seed:1631160220125

// All global variable need to be defined before use!
main(): Int64 {
    func func6() : Int32 { 
        
        func func222(param223 : Rune, optionalParam224 ! : () -> Int32 = func6) : Int32 { 
            return 0
        }

        func222('h')
    }
    func6();
    return 0;
}






// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
