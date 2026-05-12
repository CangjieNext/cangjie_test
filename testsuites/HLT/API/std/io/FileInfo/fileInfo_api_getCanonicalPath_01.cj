/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %ls && %run %run_opt %output %run_utest_opt %run_args

import std.io.*
import std.posix.*
import std.fs.*

@When[os != "Windows"]
const sep = "/"
@When[os == "Windows"]
const sep = "\\"

@Test
class TestFileInfo {
    @TestCase
    func testCase0(): Unit {
        let fileName = "test.txt"
        let filePath = getcwd() + sep + fileName
        println("filePath: ${filePath}")
        removeIfExists(filePath)
        File.create(filePath)
        // 文件绝对路径
        let fileInfo = FileInfo(filePath)
        @Expect(canonicalize(fileInfo.path).toString(), filePath)
        removeIfExists(filePath)
    }
}
