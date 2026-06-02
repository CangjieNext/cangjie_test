/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args --no-color
package std.unittest.tests

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.collection.HashSet

@Test
class TempDirTest {
    private let temp = TempDirectory()

    @TestCase
    func tempDirAvailable() {
        let path = temp.path
        @Assert(exists(path))
        @Expect(path.toString() != ".") // we know that the temp directory exists on CI
        // so the fallback must not be applied
    }

    @TestCase
    func create() {
        let root = temp.path
        let names = HashSet<String>()
        for (_ in 1..1000) {
            let file: File = temp.createTempFile()
            let path = file.info.path
            @Expect(path.parent, root)
            @Assert(names.add(path.toString()))
            file.close()
            remove(path)
        }
    }

    @TestCase
    func generateNames() {
        let names = HashSet<String>()
        for (_ in 1..1000) {
            let path = temp.createTempPath()
            @Assert(names.add(path.toString()))
        }
    }
}
