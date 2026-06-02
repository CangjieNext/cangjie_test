// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT: scan expected declaration, found literal '1'

import pkg1.*

main(): Int64 {
    var a = @Foo @Foo(1) + 9 // 10
    var b = @Foo @Foo(0) - 1 // 0
    var c = @Foo @Foo
    @Foo(1) + @Foo(1) + @Foo @Foo(0) + 1 // 4
    if (a != 10 || b != 0 || c != 4) {
        return 1
    }
    return 0
}
