/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows or OHOS) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows or OHOS) RUN-EXEC: export USER=`whoami` && %run %run_opt %output %run_utest_opt %run_args

/*
 * Test description: Test the Directory.isEmpty
 * Test API: public func isEmpty(): Bool
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.process.*

var user = Option<String>.None

@Test
class Test_Dir_IsEmpty {
    public override func beforeAll(): Unit {
        user = Process.current.getEnv("USER")
    }

    @TestCase
    func test_isempty(): Unit {
        if (exists("test_isempty")) {
            remove("test_isempty", recursive: true)
        }
        Directory.create("test_isempty")
        @Assert(exists("test_isempty"), true)
        @Expect(Directory.isEmpty("test_isempty"), true)
        Directory.create(Path("test_isempty").join("subdir"))
        @Assert(exists(Path("test_isempty").join("subdir")), true)
        @Expect(Directory.isEmpty("test_isempty"), false)
        var dirinfo = FileInfo("test_isempty")
        dirinfo.setWritable(false)
        dirinfo.setExecutable(false)
        dirinfo.setReadable(false)
        var sum = 0
        try {
            Directory.isEmpty("test_isempty")
        } catch (e: FSException) {
            @Expect(e.message, "Failed to check whether directory `test_isempty` is empty.")
            sum += 1
        }
        match (user) {
            case Some("root") => @Expect(sum, 0)
            case _ => @Expect(sum, 1)
        }
        dirinfo.setExecutable(true)
        dirinfo.setWritable(true)
        dirinfo.setReadable(true)
    }
}
