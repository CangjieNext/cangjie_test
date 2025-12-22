// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f


package cmp
class Foo{ init() {}
}
common extend Foo {
   func f():Unit {}
}

/* SCAN
error: expected no modifier before extend declaration, found 'common'
  ==> illegal_common_modifier_no_cjmp.cj:13:1:
   | 
13 | common extend Foo {
   | ^^^^^^ ~~~~~~ before extend declaration
   | |
   | expected no modifier here
   | 

1 error generated, 1 error printed.
*/
