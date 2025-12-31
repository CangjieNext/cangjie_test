// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// LEVEL 0
// ERRCHECK: %compiler %f %compile_lib_opt %cmp_opt

import `a`::b
main() {}

/* SCAN
error: expected identifier, got '`'
 ==> org_with_backquote.cj:2:9:
  | 
2 | import `a`::b
  |         ^ 
  | 

1 error generated, 1 error printed.
*/
