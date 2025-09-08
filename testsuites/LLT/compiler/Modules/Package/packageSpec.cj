// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

internal package pkg

main() {}

/* SCAN
error: root package can only modified by 'public'
 ==> packageSpec.cj:9:18:
  | 
9 | internal package pkg
  |                  ^^^ 
  | 
  # note: default modifier of 'package' is 'public', you can use 'package pkg' instead

1 error generated, 1 error printed.
*/
