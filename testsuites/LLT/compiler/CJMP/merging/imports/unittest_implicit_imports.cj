// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --test --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// EXEC-PIPE: %run %output
package cmp

@Test
func foo() {
    @Assert(true)
}

