// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f -o %output 2>&1 | compare %f

@C
var _ = 1

func foo() {
    @C
    var _ = 1
}

main() { 0 }

/* SCAN
error: variable cannot be modified with '@C'
 ==> c_6.cj:3:1:
  | 
3 | @C
  | ^ 
  | 

error: variable cannot be modified with '@C'
 ==> c_6.cj:7:5:
  | 
7 |     @C
  |     ^ 
  | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
