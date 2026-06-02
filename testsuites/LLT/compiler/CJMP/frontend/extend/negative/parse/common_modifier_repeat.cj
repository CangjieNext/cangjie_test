// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f

package cmp
common class Foo{ init() {}
}
common common extend Foo {
   common common func f():Unit {}
}

/* SCAN
error: duplicated modifier: 'common'
 ==> c/c.cj:6:8:
  | 
6 | common common extend Foo {
  | ~~~~~~ ^^^^^^ duplicated modifier
  | |
  | previous one is here
  | 

error: duplicated modifier: 'common'
 ==> c/c.cj:7:11:
  | 
7 |    common common func f():Unit {}
  |    ~~~~~~ ^^^^^^ duplicated modifier
  |    |
  |    previous one is here
  | 

2 errors generated, 2 errors printed.
*/
