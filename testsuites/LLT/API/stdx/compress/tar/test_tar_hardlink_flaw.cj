/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./expected
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) EXEC-PIPE: export cjHeapSize=16GB && %set_stdx_path %run %run_opt %output %run_utest_opt %run_args
// (Windows) EXEC-PIPE: (set cjHeapSize=16GB) && %set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import stdx.compress.tar.*
import std.fs.*

extend String {
    func removeIfExists() {
        if (isExists) {
            if (isDirectory) {
                remove(this, recursive: true)
            } else {
                remove(this)
            }
        }
    }

    prop isExists: Bool {
        get() { exists(this) }
    }

    prop isDirectory: Bool {
        get() { FileInfo(this).isDirectory() }
    }
}

@Test
public class TarHardLinkFlawTest {
    static const EXPECTED_DIRECTORY = "expected"
    static const OUTPUT_DIRECTORY = "output"

    @TestCase
    public func testTarHardLinkOutsideDstFlaw(): Unit {
        @Assert(EXPECTED_DIRECTORY.isDirectory)
        OUTPUT_DIRECTORY.removeIfExists()
        Directory.create(OUTPUT_DIRECTORY)

        var success: Bool
        try {
            Tar.extract(fromTar: "${EXPECTED_DIRECTORY}/hardlinkflaw/tarball_hardlink_outside_dst.tar", destDir: OUTPUT_DIRECTORY, overwrite: true)
            success = true
        } catch (e: Exception) {
            @Assert(e.message.contains("Hardlink points outside target dir."))
            success = false
        }
        @Assert(!success)
    }

    @TestCase
    public func testTarHardLinkAbsolutePathFlaw(): Unit {
        @Assert(EXPECTED_DIRECTORY.isDirectory)
        OUTPUT_DIRECTORY.removeIfExists()
        Directory.create(OUTPUT_DIRECTORY)

        var success: Bool
        try {
            Tar.extract(fromTar: "${EXPECTED_DIRECTORY}/hardlinkflaw/tarball_hardlink_absolute_path.tar", destDir: OUTPUT_DIRECTORY, overwrite: true)
            success = true
        } catch (e: Exception) {
            @Assert(e.message.contains("Hardlink points to absolute path outside target dir."))
            success = false
        }
        @Assert(!success)
    }
}
