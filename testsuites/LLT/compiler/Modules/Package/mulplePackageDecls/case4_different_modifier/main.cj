// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// ERRCHECK: %compiler %cmp_opt -p pkg

/* SCAN
error: found more than one package declaration for the package
 ==> pkg/test2.cj:7:18:
  | 
7 | internal package pkg.a
  |                  ^^^^^ 
  | 
note: another different package declaration 'protected package pkg.a'
 ==> pkg/test.cj:7:19:
  | 
7 | protected package pkg.a
  |                   ^^^^^ 
  | 
note: another different package declaration 'public package pkg.a'
 ==> pkg/test1.cj:7:9:
  | 
7 | package pkg.a
  |         ^^^^^ 
  | 

1 error generated, 1 error printed.
*/
