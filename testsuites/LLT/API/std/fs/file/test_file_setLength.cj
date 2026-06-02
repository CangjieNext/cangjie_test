/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output --test
// EXEC: %run %run_opt %output
import std.fs.*

@Test
class TestFileSetLength {
    @TestCase
    func testSetLength() {
        let fileName = "TestSetLength.test"
        try (f = File(fileName, ReadWrite)) {
            f.write("12345".toArray())
            @Expect(f.length == 5)

            // truncate
            f.setLength(2)
            @Expect(f.length == 2)

            // expand
            f.setLength(10)
            @Expect(f.length == 10)

            let buffer = Array<Byte>(10, repeat: 0)
            let len = f.read(buffer)
            @Expect(buffer[..len] == [0,0,0,0,0])
        } finally {
            remove(fileName)
        }
    }
}
