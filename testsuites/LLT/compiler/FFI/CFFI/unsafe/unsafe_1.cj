// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f



@C
func xxx() {}

main() {
    let f0 = xxx
    let f1: CFunc<() -> Unit> = xxx
    f0()
    f1()
    return 0
}

/* SCAN
error: unsafe function or native function should be invoked in unsafe context.
  ==> unsafe_1.cj:11:5:
   | 
11 |     f0()
   |     ^ 
   | 

error: unsafe function or native function should be invoked in unsafe context.
  ==> unsafe_1.cj:12:5:
   | 
12 |     f1()
   |     ^ 
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
