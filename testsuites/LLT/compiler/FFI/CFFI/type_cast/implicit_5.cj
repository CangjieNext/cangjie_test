// EXEC-PIPE-1: %compiler %noColor %n.cj -o %output 2>&1 | compare %f

@C
struct X {}

@C
func foo0(ptr: CPointer<X>) {}

func foo1(ptr: CPointer<X>) {}

unsafe main() {
    var ptr = CPointer<CPointer<Int32>>()
    foo0(ptr)
    foo1(ptr)
    0
}

/* SCAN-IN
error: mismatched types
  ==> implicit_5.cj:13:10:
   | 
13 |     foo0(ptr)
   |          ^^^ expected 'CPointer<Struct-X>', found 'CPointer<CPointer<Int32>>'
   | 

error: mismatched types
  ==> implicit_5.cj:14:10:
   | 
14 |     foo1(ptr)
   |          ^^^ expected 'CPointer<Struct-X>', found 'CPointer<CPointer<Int32>>'
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
