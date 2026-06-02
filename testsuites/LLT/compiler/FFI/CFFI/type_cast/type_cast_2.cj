// EXEC-PIPE-1: %compiler %noColor %n.cj -l dl -o %output 2>&1 | compare %f

unsafe main() {
    var f = CFunc<() -> Unit>()
    0
}

/* SCAN-IN
error: too many arguments given to CFunc constructor, only accept 1 argument
 ==> type_cast_2.cj:4:13:
  | 
4 |     var f = CFunc<() -> Unit>()
  |             ^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
