// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan Exception: The 'key1' cannot get the Int64 type value!

import define.*

func test1() {
    return 0
}

main(): Int64 {
    var b = @Outer(var a = @Inner (test1()))
    print(b)
    if (b != "hello world") {
        return 1
    }
    return 0
}
