// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public abstract common class A {
    public abstract common func B(): Int64
}

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib 2>&1 | compare %f
package cmp

public abstract platform class A {
    public platform func B(): Int64 {0}
}

/* SCAN
error: 'platform' function 'B' can not find 'common' match
 ==> p/p.cj:5:5:
  | 
5 |     public platform func B(): Int64 {0}
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 

error: 'common' function 'B' can not find 'platform' match
 ==> c/c.cj:9:5:

2 errors generated, 2 errors printed.
*/