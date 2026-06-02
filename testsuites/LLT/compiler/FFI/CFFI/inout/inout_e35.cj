// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

foreign func test(ptr: CPointer<Unit>): Unit

main():Int64 {
    var a = 1
    unsafe {
        test(inout if(true) { a })
        test(inout ())
    }
    return 0
}

/* SCAN
error: 'inout' can only qualify variable defined with 'var'
 ==> inout_e35.cj:8:20:
  | 
8 |         test(inout if(true) { a })
  |                    ^^^^^^^^^^^^^^ temporary value
  | 

error: 'inout' can only qualify variable defined with 'var'
 ==> inout_e35.cj:9:20:
  | 
9 |         test(inout ())
  |                    ^^ literal
  | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
