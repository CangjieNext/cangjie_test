// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

internal import test.*

@callTest enum 123

main(): Int64 {
    return 0
}

/* SCAN
error: expected a enum name after keyword 'enum', found literal '123'
 ==> enum_decl_illegal1.cj:7:16:
  | 
7 | @callTest enum 123
  |           ~~~~ ^^^ expected a enum name here
  |           |
  |           after keyword 'enum'
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

