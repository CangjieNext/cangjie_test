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
common extend Foo {
   KK func f():Unit {}
}

/* SCAN
error: expected declaration, found 'KK'
 ==> c/c.cj:7:4:
  | 
7 |    KK func f():Unit {}
  |    ^^ expected declaration here
  | 

1 error generated, 1 error printed.
*/
