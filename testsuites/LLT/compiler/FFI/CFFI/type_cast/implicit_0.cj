// EXEC-PIPE-1: %compiler %noColor %n.cj -o %output 2>&1 | compare %f

main() {
    var ptr: CPointer<Int8> = CPointer<Int32>()
    0
}

/* SCAN
error: mismatched types
 ==> implicit_0.cj:4:31:
  | 
4 |     var ptr: CPointer<Int8> = CPointer<Int32>()
  |                               ^^^^^^^^^^^^^^^^^ expected 'CPointer<Int8>', found 'CPointer<Int32>'
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
