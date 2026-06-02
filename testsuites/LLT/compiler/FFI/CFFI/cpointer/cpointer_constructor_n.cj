// EXEC: %compiler %noColor %cmp_opt_chir2hlir %f -o %output 2>&1 | compare %f








unsafe main() {
    var ptr1 = CPointer<UInt8>(1)
    var ptr2 = CPointer<UInt8>(1,2)
    var ptr3 = CPointer<UInt8>(CPointer<UInt8>(),2)
    0
}



/* SCAN
error: the single argument of CPointer constructor must be 'CPointer' or 'CFunc'
  ==> cpointer_constructor_n.cj:11:16:
   | 
11 |     var ptr1 = CPointer<UInt8>(1)
   |                ^ 
   | 

error: too much arguments given for CPointer constructor, only accept 0~1 arguments
  ==> cpointer_constructor_n.cj:12:16:
   | 
12 |     var ptr2 = CPointer<UInt8>(1,2)
   |                ^ 
   | 

error: too much arguments given for CPointer constructor, only accept 0~1 arguments
  ==> cpointer_constructor_n.cj:13:16:
   | 
13 |     var ptr3 = CPointer<UInt8>(CPointer<UInt8>(),2)
   |                ^ 
   | 

3 errors generated, 3 errors printed.
*/// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
