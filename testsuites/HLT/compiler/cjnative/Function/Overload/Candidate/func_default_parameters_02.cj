/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    var b = Coo(3, e: 's', g: 3, "s", f: 3, h: 1)
    return 0
}

class Coo {
    public var a: Int64 = 1
    public Coo(
        a: Int64,
        b: String,
        var e!: Rune = 'a',
        var f!: Int64 = a,
        var g!: Int64 = 1,
        var h!: Int64
    ) {}
}
// ASSERT: scan sema_unordered_arguments
