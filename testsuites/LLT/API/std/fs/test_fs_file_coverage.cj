/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Unix) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) EXEC: %run %run_opt %output %run_utest_opt

import std.fs.*
import std.io.SeekPosition

/*
 * Branch-focused coverage for std.fs file.cj:
 * seek Current/End/Begin, EOF read, Append mode, canRead/canWrite after partial use.
 */
@Test
class FsFileCoverageTest {
    let baseDir: String = "./cov_tmp_fs_file"

    @BeforeAll
    func setupAll(): Unit {
        removeIfExists(baseDir, recursive: true)
        Directory.create(baseDir)
    }

    @AfterAll
    func tearDownAll(): Unit {
        removeIfExists(baseDir, recursive: true)
    }

    func p(name: String): String {
        "${baseDir}/${name}"
    }

    func cleanup(name: String): Unit {
        removeIfExists(p(name), recursive: true)
    }

    @TestCase
    func testSeekPositionsAndEofRead(): Unit {
        let fpath = p("seek.txt")
        cleanup("seek.txt")
        File.writeTo(fpath, "0123456789".toArray())

        try (f = File(fpath, ReadWrite)) {
            @Expect(f.seek(Begin(0)), 0)
            @Expect(f.seek(Current(5)), 5)
            @Expect(f.seek(End(0)) >= 10, true)
            @Expect(f.read(Array<Byte>(1, repeat: 0)), 0)

            f.seek(Begin(2))
            var buf = Array<Byte>(4, repeat: 0)
            @Expect(f.read(buf), 4)
            @Expect(String.fromUtf8(buf), "2345")

            f.seek(End(-3))
            buf = Array<Byte>(3, repeat: 0)
            @Expect(f.read(buf), 3)
            @Expect(String.fromUtf8(buf), "789")
        }
        cleanup("seek.txt")
    }

    @TestCase
    func testAppendModeAndCanFlags(): Unit {
        let fpath = p("append.txt")
        cleanup("append.txt")
        File.writeTo(fpath, "base".toArray())

        try (f = File(fpath, Append)) {
            @Expect(f.canWrite(), true)
            @Expect(f.canRead(), false)
            f.write("-tail".toArray())
        }

        try (f = File(fpath, Read)) {
            @Expect(f.canRead(), true)
            @Expect(f.canWrite(), false)
            var buf = Array<Byte>(20, repeat: 0)
            let n = f.read(buf)
            @Expect(n >= 9, true)
        }
        cleanup("append.txt")
    }

    @TestCase
    func testReadWriteModeTruncateAndLength(): Unit {
        let fpath = p("rw.txt")
        cleanup("rw.txt")
        File.writeTo(fpath, "hello-world".toArray())
        try (f = File(fpath, ReadWrite)) {
            @Expect(f.length >= 11, true)
            f.setLength(5)
            f.seek(Begin(0))
            var buf = Array<Byte>(10, repeat: 0)
            @Expect(f.read(buf[..5]), 5)
            @Expect(String.fromUtf8(buf[..5]), "hello")
        }
        cleanup("rw.txt")
    }

    @TestCase
    func testCreateReadFromWriteToAndClosedFlags(): Unit {
        let fpath = p("create_new.txt")
        cleanup("create_new.txt")
        try (f = File.create(fpath)) {
            @Expect(f.canWrite(), true)
            f.write("abc".toArray())
        }
        @Expect(File.readFrom(fpath).size >= 3, true)
        File.writeTo(fpath, "xyz".toArray())
        @Expect(String.fromUtf8(File.readFrom(Path(fpath))), "xyz")

        try (f = File(fpath, Read)) {
            f.close()
            @Expect(f.isClosed(), true)
            @Expect(f.canRead(), false)
            @Expect(f.canWrite(), false)
            f.close()
        }
        cleanup("create_new.txt")
    }

    @TestCase
    func testCreateTempAndWriteAfterSeek(): Unit {
        let tmp = File.createTemp(Path(baseDir))
        try (f = tmp) {
            f.write("temp-data".toArray())
            f.seek(Begin(0))
            var buf = Array<Byte>(20, repeat: 0)
            let n = f.read(buf)
            @Expect(n >= 9, true)
        }
        remove(tmp.info.path.toString())
    }

    @TestCase
    func testCreateExistingFileThrows(): Unit {
        let fpath = p("dup_create.txt")
        cleanup("dup_create.txt")
        File.writeTo(fpath, "d".toArray())
        @ExpectThrows[FSException](File.create(fpath))
        cleanup("dup_create.txt")
    }
}
