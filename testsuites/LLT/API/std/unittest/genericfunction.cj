/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// ASSERT: scan 1 error generated
internal import std.unittest.*
import std.unittest.testmacro.*

func foo<T>(x: Option<T>): Option<T> {
    return x
}

@Test
class TestA {
    @TestCase // EXPECT: scan '@TestCase modified generic function'
    public func case01<T>(): Unit {
        var expect: Option<Rune> = Some<Rune>('a')
        var actual: Option<Rune> = Some<Rune>('b')
    }
}
