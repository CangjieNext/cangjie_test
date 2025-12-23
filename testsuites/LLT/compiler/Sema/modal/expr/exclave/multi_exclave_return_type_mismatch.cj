// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output -Woff all 2>&1 | compare %f

func foo(a: Int): Int @local! {
    if (a < 0) {
        return exclave { 0 }
    }
    exclave {
        3.4
    }
}

func bar(a: Int) {
    if (a < 0) {
        return 3
    }
    3.4
}

main() {}

/* SCAN
error: cannot convert a floating-point literal to type 'Int64 @local!'
  ==> multi_exclave_return_type_mismatch.cj:14:9:
   | 
14 |         3.4
   |         ^ 
   | 

error: the return type of this function cannot be calculated from the function body and all the return and exclave expressions
  ==> multi_exclave_return_type_mismatch.cj:22:5:
   | 
22 |     3.4
   |     ^ 
   | 
   # note: Traces:
The types 'Float64' and 'Int64' do not have the smallest common supertype


2 errors generated, 2 errors printed.
*/
