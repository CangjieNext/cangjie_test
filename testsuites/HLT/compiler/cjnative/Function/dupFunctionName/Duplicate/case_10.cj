/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args


enum TimeUnit5{
    |Year(Int32)
    |Month(Int32,Float32)
    |Day(Int32,Float32,Float32)
  



}
main() {
    const func func1() {
        const var1 =  TimeUnit5.Year(2)
    }
    var hundred  = 0
    while (hundred <100){
        hundred ++
        func func1() {
            const var1=TimeUnit5.Month(1,2.0)
        }
    }
    
    return 0
}
