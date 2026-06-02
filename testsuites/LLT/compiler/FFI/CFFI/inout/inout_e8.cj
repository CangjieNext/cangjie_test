// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f

foreign func PlusOne(ptr: CPointer<Int32>): Unit

main() {
    var cs = unsafe{LibC.mallocCString("")}
    unsafe {
        PlusOne(inout cs)
        LibC.free(cs)
    }
}

/* SCAN
error: the expression qualified by 'inout' cannot be of type 'CString'
 ==> inout_e8.cj:8:17:
  | 
8 |         PlusOne(inout cs)
  |                 ^^^^^^^^ 
  | 

error: mismatched types
 ==> inout_e8.cj:8:23:
  | 
8 |         PlusOne(inout cs)
  |                       ^^ expected 'Int32', found 'CString'
  | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
