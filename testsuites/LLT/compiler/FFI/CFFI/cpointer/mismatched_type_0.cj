// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not internal Compiler Error

foreign {
    func free(ptr: CPointer<Int8>): Unit
}

main() {
    unsafe {
        var ptr = CPointer<Unit>()
        free(CPointer<UInt8>(ptr))
    }
    0
}

/* SCAN
error: mismatched types
  ==> mismatched_type_0.cj:11:14:
   | 
11 |         free(CPointer<UInt8>(ptr))
   |              ^^^^^^^^^^^^^^^^^^^^ expected 'CPointer<Int8>', found 'CPointer<UInt8>'
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
