/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DESCRIPTION: testing ..
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

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
        let firstDirPath = "test" + sep + "first"
        removeIfExists(firstDirPath, recursive: true)
        Directory.create(firstDirPath, recursive: true)

        let secondDirPath = "test" + sep + "second"
        removeIfExists(secondDirPath, recursive: true)
        Directory.create(secondDirPath, recursive: true)

        // create a file in second dir.
        const fileName = "test.txt"
        let filePath = secondDirPath + sep + fileName
        File.create(filePath)

        let complexFilePath = "test" + sep + "first" + sep + ".." + sep + "second" + sep + fileName
        let fileInfo = FileInfo(complexFilePath)
        @Expect(canonicalize(fileInfo.path).toString(), getcwd() + sep + secondDirPath + sep + fileName)
    }
}
