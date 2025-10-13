// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %f %enableO2 -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

public func test(){
    for (i in 1..10){
        if(true){
            break
            break
            break
            return 
        }
    }
    
}

main() {
  0
}

/* SCAN
warning: unused variable:'i'
 ==> testDCEfor03.cj:7:10:
  | 
7 |     for (i in 1..10){
  |          ^ unused variable
  | 
  # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testDCEfor03.cj:10:13:
   | 
9  |             break
   |             ~~~~~ any code following this expression is unreachable
10 |             break
   |             ^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
