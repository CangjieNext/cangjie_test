// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
common class A{
    public common func foo(): Unit
    public init() {}
}

common func foo() {}

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=chir 2>&1 | compare %f
package cmp

common func foo() {}
specific func foo() {}

/*SCAN
error: function 'foo' has overload conflicts
 ==> p/p.cj:5:15:
note: conflict with the declaration
 ==> p/p.cj:4:13:

1 error generated, 1 error printed.
*/
