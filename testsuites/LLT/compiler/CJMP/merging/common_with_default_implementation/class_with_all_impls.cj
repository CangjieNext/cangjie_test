// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common class A {
    public common let a: Int64 = 1
    public common let b: Int64 = 3
    common init(){}
}

// SEPARATE-FILE: p.cj
// EXEC-0: %compiler %noColor --experimental p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// RUN-EXEC-PIPE-0: %run %output 2>&1 | compare %f
package cmp

main(){
   println(A().a)
   println(A().b)
}

/* SCAN
1
3
*/
