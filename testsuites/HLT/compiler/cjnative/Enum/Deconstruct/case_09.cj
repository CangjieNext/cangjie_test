/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not  Green(r'a',1) is not Green(r'a',1)
// ASSERT: scan-not  Green(r'a',2) is not Green(_,2)
// ASSERT: scan-not  Green(1,2,true) is not Green(1,2,_)



enum RGBColor{
    |Red(Int32)|Gray(Int32, Int64)|Green(Int32, Int64, Bool)|Blue(Int64)|Pink
}

func f1(rType:RGBColor):Int32{
    return match(rType){
        case Red(_) => 1
        case Gray(1,1) =>3
        case Green(2,1,false) =>4
        case Green(_,3,true) =>5
        case Green(1,2,_) =>6
        case Pink =>7
        case _ =>8
    }

}


main() {
   if (f1(Gray(1,1) )!= 3){
    println("Green(r'a',1) is not Green(r'a',1)")
   }
   if (f1(Green(1,3,true)) != 5){
    println("Green(r'a',2) is not Green(_,2)")
   }
   if (f1(Green(1,2,true) )!= 6){
    println("Green(1,2,true) is not Green(1,2,_)")
   }
    return 0
}
