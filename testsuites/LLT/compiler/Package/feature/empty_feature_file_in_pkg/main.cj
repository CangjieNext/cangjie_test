// DEPENDENCE: src
// EXEC-PIPE-1:%compiler %cmp_opt %compile_lib_opt %pkg_opt src 2>&1 | compare %f
/* SCAN
error: features declaration must be included in every file within the source set where it is used
 ==> src/no_feature.cj:1:1:
  | 
1 |   package src
  |  _^
2 | | 
  | | ...
5 | | }
  | |_^
  | 
note: perhapse you meant these features
 ==> src/main.cj:1:10:
  | 
1 | features os.Harmony
  |          ^^^^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

