// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// ERRCHECK: %compiler %cmp_opt -p pkg

/* SCAN
error: found more than one package declaration for the package
 ==> pkg/a.cj:7:9:
  | 
7 | package pkg1
  |         ^^^^ 
  | 
note: another different package declaration 'public package pkg2'
 ==> pkg/b.cj:7:9:
  | 
7 | package pkg2
  |         ^^^^ 
  | 
note: another different package declaration 'public package pkg3'
 ==> pkg/c.cj:7:9:
  | 
7 | package pkg3
  |         ^^^^ 
  | 

1 error generated, 1 error printed.
*/
