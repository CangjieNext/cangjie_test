// EXEC-PIPE-1: %compiler %noColor %n.cj -o %output 2>&1 | compare %f

@C
func foo0(ptr: CPointer<CPointer<Int64>>) {}

func foo1(ptr: CPointer<CPointer<UInt64>>) {}

unsafe main() {
    var ptr = CPointer<CPointer<Int32>>()
    foo0(ptr)
    foo1(ptr)
    0
}

/* SCAN-IN
error: mismatched types
  ==> implicit_4.cj:10:10:
   | 
10 |     foo0(ptr)
   |          ^^^ expected 'CPointer<CPointer<Int64>>', found 'CPointer<CPointer<Int32>>'
   | 

error: mismatched types
  ==> implicit_4.cj:11:10:
   | 
11 |     foo1(ptr)
   |          ^^^ expected 'CPointer<CPointer<UInt64>>', found 'CPointer<CPointer<Int32>>'
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
