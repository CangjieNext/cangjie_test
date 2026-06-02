/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./position.txt
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.io.*
import std.fs.*

@Test
class TestPosition {
    @TestCase
    func test_position(): Unit {
        let file = File("position.txt", Read)
        let reader = StringReader(file)
        let length = reader.length
        var cur = 0
        var readContents = ""
        while (cur < length) {
            var content = reader.readUntil(r';').getOrThrow() // 读取;前数据
            readContents += content
            cur = reader.position
        }
        reader.seek(Begin(0))
        let expectContents = reader.readToEnd()
        @Expect(expectContents == readContents)
    }
}
