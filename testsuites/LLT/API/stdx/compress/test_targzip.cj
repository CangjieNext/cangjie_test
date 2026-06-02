/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
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
import stdx.compress.*
import std.fs.*
import std.collection.*
import std.sort.*

func enumerateFiles(directory: String): ArrayList<String> {
    if (!directory.isDirectory) {
        throw Exception("${directory} is not a directory")
    }
    let result = ArrayList<String>()
    Directory.walk(directory) { info =>
        let path = info.path.normalize().toString()
        if (info.isRegular()) {
            result.add(path)
        } else if (info.isSymbolicLink()) {
            result.add(path)
        } else if (info.isDirectory()) {
            result.add(all: enumerateFiles(path))
        }
        true
    }
    return result
}

extend String {
    const operator func /(other: String): String {
        return this + "/" + other
    }

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

    prop isRegular: Bool {
        get() { FileInfo(this).isRegular() }
    }

    prop isSymbolicLink: Bool {
        get() { FileInfo(this).isSymbolicLink() }
    }

    prop isDirectory: Bool {
        get() { FileInfo(this).isDirectory() }
    }
}

func assert(condition: Bool, message: String) {
    if (!condition) {
        println(message)
    }
    @Assert(condition)
}

@Test
public class TarArchiveTest {
    static const EXPECTED_DIRECTORY = "expected"
    static const OUTPUT_DIRECTORY = "output"
    static const TAR_OUTPUT_DIRECTORY = "tar"

    private func fileEqual(actual: String, expected: String): Bool {
        @Assert(expected.isRegular || expected.isSymbolicLink)
        @Assert(actual.isRegular == expected.isRegular)
        @Assert(actual.isSymbolicLink == expected.isSymbolicLink)

        let actualData = File.readFrom(actual)
        let expectedData = File.readFrom(expected)
        let result = actualData == expectedData
        if (!result) {
            println("${actual} is not equal to ${expected}")
            println("${actual}: ${actualData}")
            println("${expected}: ${expectedData}")
        }
        return result
    }

    private func directoryEqual(actual: String, expected: String): Bool {
        @Assert(actual.isDirectory)
        @Assert(expected.isDirectory)

        let actualFiles = enumerateFiles(actual)
        let expectedFiles = enumerateFiles(expected)

        if (actualFiles.size != expectedFiles.size) {
            println("${actualFiles} and ${expectedFiles} have different size")
            return false
        }

        sort(actualFiles)
        sort(expectedFiles)

        for (i in 0 .. actualFiles.size) {
            if (!fileEqual(actualFiles[i], expectedFiles[i])) {
                println("${actualFiles[i]} and ${expectedFiles[i]} are not equal")
                return false
            }
        }

        true
    }

    private func testOneTar(name: String): Unit {
        let from = EXPECTED_DIRECTORY / name
        let to = TAR_OUTPUT_DIRECTORY / name + ".tar.gz"
        let extract = OUTPUT_DIRECTORY / name
        let expected = EXPECTED_DIRECTORY / name

        @Assert(from.isDirectory)

        println("Archiving ${from} to ${to}")
        TarGzip.archive(fromDir: from, destFile: to, includeBaseDirectory: true)

        @Assert(to.isRegular)

        println("Extracting ${to} to ${extract}")
        TarGzip.extract(fromTarGzip: to, destDir: OUTPUT_DIRECTORY, overwrite: false)

        assert(directoryEqual(extract, expected), "Directory ${extract} is not equal to ${expected}")
    }

    @TestCase
    public func testTarArchive(): Unit {
        @Assert(EXPECTED_DIRECTORY.isDirectory)
        OUTPUT_DIRECTORY.removeIfExists()
        Directory.create(OUTPUT_DIRECTORY)
        TAR_OUTPUT_DIRECTORY.removeIfExists()
        Directory.create(TAR_OUTPUT_DIRECTORY)

        Directory.readFrom(EXPECTED_DIRECTORY) |> forEach { file: FileInfo =>
            testOneTar(file.path.fileNameWithoutExtension)
        }

        remove(OUTPUT_DIRECTORY, recursive: true)
        remove(TAR_OUTPUT_DIRECTORY, recursive: true)
    }
}
