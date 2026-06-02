// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expected ';' or '<NL>', found ''

import define.*

var aaa = @Outer
func test1() {
    var a = @Inner(1)
    var a1 = @Inner(2)
}

main(): Int64 {
    var b = @Outer(var a = @Inner (1))
    print(aaa)
    print(b)
    return 0
}
