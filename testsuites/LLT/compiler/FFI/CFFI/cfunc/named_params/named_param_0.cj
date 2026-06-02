// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f 2>&1 | compare %f









foreign {
    func foo1(a!: Int64): Int64
    func foo2(a!: Int64 = 0): Int64
    func foo3(a!: Int64, b!: Int64 = 0): Int64
}

@C
func foo4(a!: Int64): Int64 { a }

@C
func foo5(a!: Int64 = 0): Int64 { a }

@C
func foo6(a!: Int64, b!: Int64 = 0): Int64 { a + b }

main() {}

/* SCAN
error: CFunc cannot have named arguments
  ==> named_param_0.cj:12:15:
   | 
12 |     func foo1(a!: Int64): Int64
   |               ^ 
   | 

error: CFunc cannot have named arguments
  ==> named_param_0.cj:13:15:
   | 
13 |     func foo2(a!: Int64 = 0): Int64
   |               ^ 
   | 

error: CFunc cannot have named arguments
  ==> named_param_0.cj:14:15:
   | 
14 |     func foo3(a!: Int64, b!: Int64 = 0): Int64
   |               ^ 
   | 

error: CFunc cannot have named arguments
  ==> named_param_0.cj:14:26:
   | 
14 |     func foo3(a!: Int64, b!: Int64 = 0): Int64
   |                          ^ 
   | 

error: CFunc cannot have named arguments
  ==> named_param_0.cj:18:11:
   | 
18 | func foo4(a!: Int64): Int64 { a }
   |           ^ 
   | 

error: CFunc cannot have named arguments
  ==> named_param_0.cj:21:11:
   | 
21 | func foo5(a!: Int64 = 0): Int64 { a }
   |           ^ 
   | 

error: CFunc cannot have named arguments
  ==> named_param_0.cj:24:11:
   | 
24 | func foo6(a!: Int64, b!: Int64 = 0): Int64 { a + b }
   |           ^ 
   | 

error: CFunc cannot have named arguments
  ==> named_param_0.cj:24:22:
   | 
24 | func foo6(a!: Int64, b!: Int64 = 0): Int64 { a + b }
   |                      ^ 
   | 

8 errors generated, 8 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
