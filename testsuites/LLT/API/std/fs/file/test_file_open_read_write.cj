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
class TestFileOpen {
    @TestCase
    func testReadWrite() {
        let fileName = "OpenReadWrite.test"
        let testData = "OpenReadWrite test".toArray()

        // init file data
        try (f = File(fileName, ReadWrite)) {
            f.write(testData)
        }

        // test read then write
        try (f = File(fileName, ReadWrite)) {
            let buffer = Array<Byte>(50, repeat: 0)
            let len = f.read(buffer)
            @Expect( buffer[..len] == testData )
            f.write(testData)
        }
        // check data in file
        let data = File.readFrom(fileName)
        @Expect( data == testData.concat(testData))

        // test write then read
        try (f = File(fileName, ReadWrite)) {
            f.write(testData)
            let buffer = Array<Byte>(50, repeat: 0)
            let len = f.read(buffer)
            @Expect( buffer[..len] == testData )
        }

        remove(fileName)
    }
}
