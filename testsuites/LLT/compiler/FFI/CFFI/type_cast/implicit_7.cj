// EXEC-PIPE-1: %compiler %noColor %n.cj -o %output 2>&1 | compare %f

class X {
    var ptr = CPointer<Int8>()
}

unsafe main() {
    var ptr = CPointer<Int32>()
    var x = X()
    x.ptr = ptr
    0
}

/* SCAN-IN
error: mismatched types
  ==> implicit_7.cj:10:13:
   | 
10 |     x.ptr = ptr
   |             ^^^ expected 'CPointer<Int8>', found 'CPointer<Int32>'
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
