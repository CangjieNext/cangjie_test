// EXEC: %compiler %cmp_opt %f -o %output 2>& 1| compare %f
features os.Mac, os.Mac, os.Harmony, os.Harmony

main() {}

/* SCAN
warning: feature is already declared
 ==> main.cj:2:18:
  | 
2 | features os.Mac, os.Mac, os.Harmony, os.Harmony
  |                  ^^^^^^ 
  | 
  # note: this warning can be suppressed by setting the compiler option `-Woff package-import`
note: feature 'os.Mac' previously used here
 ==> main.cj:2:10:
  | 
2 | features os.Mac, os.Mac, os.Harmony, os.Harmony
  |          ^^^^^^ 
  | 

warning: feature is already declared
 ==> main.cj:2:38:
  | 
2 | features os.Mac, os.Mac, os.Harmony, os.Harmony
  |                                      ^^^^^^^^^^ 
  | 
  # note: this warning can be suppressed by setting the compiler option `-Woff package-import`
note: feature 'os.Harmony' previously used here
 ==> main.cj:2:26:
  | 
2 | features os.Mac, os.Mac, os.Harmony, os.Harmony
  |                          ^^^^^^^^^^ 
  | 

2 warnings generated, 2 warnings printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

