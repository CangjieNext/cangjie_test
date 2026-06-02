// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f

foreign {
    func foo1(): Unit
    func foo1(): Unit
}

main() {}

/* SCAN
error: redefinition of declaration 'foo1'
 ==> redefine_0.cj:5:10:
  | 
5 |     func foo1(): Unit
  |          ^^^^ 
  | 
note: 'foo1' is previously declared here
 ==> redefine_0.cj:4:10:
  | 
4 |     func foo1(): Unit
  |          ^^^^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
