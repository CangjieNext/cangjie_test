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
class TestFileCreatePermission {
    @TestCase
    func testWriteOnlyPermission() {
        let fileName = "TestFileCreateWriteOnlyPermisson.test"
        try (f = File.create(fileName)) {
            f.write("test".toArray())
            @AssertThrows[FSException](f.read(Array<Byte>(10, repeat: 0)))
        } finally {
            remove(fileName)
        }
    }
}
