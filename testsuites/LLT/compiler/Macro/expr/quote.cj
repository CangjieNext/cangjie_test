// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not Expr Not Supported in Libast Yet

internal import std.unittest.*
import std.unittest.testmacro.*
internal import std.ast.*

@Test
func test(): Unit {
    let want = quote(1+2)
    var a = 2
    a--
    var b = a + 1
    @Assert(quote(1+2).toString(), want.toString())
}

main(): Unit {
}
