// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not internal Compiler Error

@C
func foo(ptr: CPointer<Int8>): CPointer<Int8> {
    ptr
}

main() {
    unsafe {
        foo(CPointer<Unit>())
        var ptr = CPointer<Unit>()
        foo(CPointer<UInt8>(ptr))
    }
    0
}

/* SCAN
error: mismatched types
  ==> mismatched_type_1.cj:11:13:
   | 
11 |         foo(CPointer<Unit>())
   |             ^^^^^^^^^^^^^^^^ expected 'CPointer<Int8>', found 'CPointer<Unit>'
   | 

error: mismatched types
  ==> mismatched_type_1.cj:13:13:
   | 
13 |         foo(CPointer<UInt8>(ptr))
   |             ^^^^^^^^^^^^^^^^^^^^ expected 'CPointer<Int8>', found 'CPointer<UInt8>'
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
