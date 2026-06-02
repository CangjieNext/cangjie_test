// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %verbose_opt %f -o %output 2>&1 | compare %f

foreign func foo(x: CType): CType

@C
struct Data {
    var a: CType

    init(a: CType) {
        this.a = a
    }
}

main() {}

/* SCAN-IN
error: arguments type of CFunc must be instantiated with CType
 ==> ctype_4.cj:3:18:
  | 
3 | foreign func foo(x: CType): CType
  |                  ^^^^^^^^ 
  | 

error: return type of CFunc must be instantiated with CType
 ==> ctype_4.cj:3:29:
  | 
3 | foreign func foo(x: CType): CType
  |                             ^^^^^ 
  | 
  # note: return type is Interface-CType

error: member variable 'a' of struct 'Data' with @C must be instantiated with CType
 ==> ctype_4.cj:7:9:
  | 
7 |     var a: CType
  |         ^^^^^^^^ 
  | 

3 errors generated, 3 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
