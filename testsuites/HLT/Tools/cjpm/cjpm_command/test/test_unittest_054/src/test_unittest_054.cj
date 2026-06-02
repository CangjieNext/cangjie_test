/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a

internal import std.unittest.*
import std.unittest.testmacro.*

func getArr(): Array<String> {
    var arr: Array<String> = ["aa", "bb", "cc"]
    return arr
}

@Test
foreign class TestA {
    @TestCase
    func case01(): Unit {
        var args1: Array<String> = ["-aa", "-bb", "-cc"]
        @Expect(getArr(), args1)
    }
}

main() {}
