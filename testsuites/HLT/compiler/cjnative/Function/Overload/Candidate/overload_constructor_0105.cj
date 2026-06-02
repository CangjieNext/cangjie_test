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
    var a = Coo(3, "s", 3, "s")
    return 0
}

class Coo {
    public var a: Int64 = 1
    public Coo(
        a: Int64,
        b: String,
        var c: Int32,
        var d: String,
        var e!: Rune = 'a',
        var f!: Int64 = a,
        var g!: Int64 = 1,
        var h!: Int64 = 1
    ) {}
    public init(
        a: Int64,
        b: String,
        c: Int32,
        d: String
    ) {
        this.a = 2 // a is a in Coo()
        this.c = 2
        this.d = "b"
        e = 'b' // e is suger of this.e,e is e in Coo()
        this.f = a // a is a in init()
        this.g = a
        this.h = a
    }
}
// ASSERT: scan sema_ambiguous_constructor_match
