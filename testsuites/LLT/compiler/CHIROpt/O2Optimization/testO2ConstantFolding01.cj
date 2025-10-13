// LEVEL: 0
// EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 %cmp_opt %chir2llvm %f -o %output 2>&1 | compare %f
// ASSERT: scan The if node in the line:17 and the column:21 was optimized by The opt: Constant Folding

// random seed:1631160220125

// All global variable need to be defined before use!
main(): Int64 {

        let var53 : Int16 = Int16(19.0);
        func func9() : Int16 { 
            if (true) { 
            32
            } else { 
                ()
                match (-36) {
                    case _ => 
                        var53
                        // 14
                    
                    case caseVar81 => 
                        85
                }
            };
        }
        func9()
    return 0;
}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
