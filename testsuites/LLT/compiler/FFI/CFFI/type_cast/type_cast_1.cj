// EXEC-PIPE-1: %compiler %noColor %n.cj -l dl -o %output 2>&1 | compare %f

unsafe main() {
    var f0 = CFunc<() -> Unit>(0)
    var f1 = CFunc<() -> Unit>("")
    var f2 = CFunc<() -> Unit>(false)
    0
}

/* SCAN-IN
error: argument type of 'CFunc' constructor must be of type 'CPointer'
 ==> type_cast_1.cj:4:32:
  | 
4 |     var f0 = CFunc<() -> Unit>(0)
  |                                ^ 
  | 

error: argument type of 'CFunc' constructor must be of type 'CPointer'
 ==> type_cast_1.cj:5:32:
  | 
5 |     var f1 = CFunc<() -> Unit>("")
  |                                ^ 
  | 

error: argument type of 'CFunc' constructor must be of type 'CPointer'
 ==> type_cast_1.cj:6:32:
  | 
6 |     var f2 = CFunc<() -> Unit>(false)
  |                                ^ 
  | 

3 errors generated, 3 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
