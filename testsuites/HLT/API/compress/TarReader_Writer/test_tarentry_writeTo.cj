/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import std.io.*
import stdx.compress.tar.*

@Test
class test_TarEntry_WriteTo {
    let filepaths = [
        "test_dir/test_file.txt",
        "test_dir/tempfile",
        "symlink"
    ]

    @BeforeAll
    public func setup() {
        Directory.create("test_dir")
        File.create("test_dir/test_file.txt").close()
        File.writeTo("test_dir/test_file.txt", [97, 98, 100, 101])
        File.create("test_dir/tempfile").close()
        SymbolicLink.create("symlink", to: "test_dir/test_file.txt")
    }

    @TestCase
    func test_write_v7tarentry(): Unit {
        for (path in filepaths) {
            let bytebuffer = ByteBuffer()
            V7TarEntry(path).writeTo(bytebuffer)
            @Assert(String.fromUtf8(readToEnd(bytebuffer)).contains(path))
        }
    }

    @TestCase
    func test_write_ustartarentry(): Unit {
        for (path in filepaths) {
            let bytebuffer = ByteBuffer()
            UstarTarEntry(path).writeTo(bytebuffer)
            @Assert(String.fromUtf8(readToEnd(bytebuffer)).contains(path))
        }
    }

    @TestCase
    func test_write_gnutarentry(): Unit {
        for (path in filepaths) {
            let bytebuffer = ByteBuffer()
            GnuTarEntry(path).writeTo(bytebuffer)
            @Assert(String.fromUtf8(readToEnd(bytebuffer)).contains(path))
        }
    }

    @TestCase
    func test_write_paxtarentry(): Unit {
        for (path in filepaths) {
            let bytebuffer = ByteBuffer()
            PaxTarEntry(path).writeTo(bytebuffer)
            @Assert(String.fromUtf8(readToEnd(bytebuffer)).contains(path))
        }
    }

    @TestCase
    func test_tarwriter_01(): Unit {
        for (path in filepaths) {
            let bytebuffer1 = ByteBuffer()
            V7TarEntry(path).writeTo(bytebuffer1)
            let bytebuffer2 = ByteBuffer()
            let tarwriter = TarWriter(bytebuffer2, TarEntryFormat.V7)
            @Expect(tarwriter.format, TarEntryFormat.V7)
            tarwriter.write(path: path, entryName: path)
            @Assert(String.fromUtf8(readToEnd(bytebuffer1)), String.fromUtf8(readToEnd(bytebuffer2)))
        }
    }

    @TestCase
    func test_tarwriter_01_1(): Unit {
        for (path in filepaths) {
            let bytebuffer1 = ByteBuffer()
            V7TarEntry(path).writeTo(bytebuffer1)
            let bytebuffer2 = ByteBuffer()
            let tarwriter = TarWriter(bytebuffer2, TarEntryFormat.V7)
            tarwriter.write(Path(path), entryName: path)
            @Assert(String.fromUtf8(readToEnd(bytebuffer1)), String.fromUtf8(readToEnd(bytebuffer2)))
        }
    }

    @TestCase
    func test_tarwriter_01_2(): Unit {
        for (path in filepaths) {
            let bytebuffer1 = ByteBuffer()
            V7TarEntry(path).writeTo(bytebuffer1)
            let bytebuffer2 = ByteBuffer()
            let tarwriter = TarWriter(bytebuffer2, TarEntryFormat.V7)
            tarwriter.write(FileInfo(path), entryName: path)
            @Assert(String.fromUtf8(readToEnd(bytebuffer1)), String.fromUtf8(readToEnd(bytebuffer2)))
        }
    }

    @TestCase
    func test_tarwriter_01_3(): Unit {
        for (path in filepaths) {
            let bytebuffer1 = ByteBuffer()
            V7TarEntry(path).writeTo(bytebuffer1)
            let bytebuffer2 = ByteBuffer()
            let tarwriter = TarWriter(bytebuffer2, TarEntryFormat.V7)
            tarwriter.write(V7TarEntry(path))
            @Assert(String.fromUtf8(readToEnd(bytebuffer1)), String.fromUtf8(readToEnd(bytebuffer2)))
        }
    }

    @TestCase
    @Skip
    func test_tarwriter_02(): Unit {
        for (path in filepaths) {
            let bytebuffer1 = ByteBuffer()
            UstarTarEntry(path).writeTo(bytebuffer1)
            let bytebuffer2 = ByteBuffer()
            let tarwriter = TarWriter(bytebuffer2, TarEntryFormat.Ustar)
            @Expect(tarwriter.format, TarEntryFormat.Ustar)
            tarwriter.write(path: path, entryName: path)
            @Assert(String.fromUtf8(readToEnd(bytebuffer1)), String.fromUtf8(readToEnd(bytebuffer2)))
        }
    }

    @TestCase
    @Skip
    func test_tarwriter_02_1(): Unit {
        for (path in filepaths) {
            let bytebuffer1 = ByteBuffer()
            UstarTarEntry(path).writeTo(bytebuffer1)
            let bytebuffer2 = ByteBuffer()
            let tarwriter = TarWriter(bytebuffer2, TarEntryFormat.Ustar)
            tarwriter.write(Path(path), entryName: path)
            @Assert(String.fromUtf8(readToEnd(bytebuffer1)), String.fromUtf8(readToEnd(bytebuffer2)))
        }
    }

    @TestCase
    @Skip
    func test_tarwriter_02_2(): Unit {
        for (path in filepaths) {
            let bytebuffer1 = ByteBuffer()
            UstarTarEntry(path).writeTo(bytebuffer1)
            let bytebuffer2 = ByteBuffer()
            let tarwriter = TarWriter(bytebuffer2, TarEntryFormat.Ustar)
            tarwriter.write(FileInfo(path), entryName: path)
            @Assert(String.fromUtf8(readToEnd(bytebuffer1)), String.fromUtf8(readToEnd(bytebuffer2)))
        }
    }

    @TestCase
    func test_tarwriter_03(): Unit {
        for (path in filepaths) {
            let bytebuffer1 = ByteBuffer()
            GnuTarEntry(path).writeTo(bytebuffer1)
            let bytebuffer2 = ByteBuffer()
            let tarwriter = TarWriter(bytebuffer2, TarEntryFormat.Gnu)
            @Expect(tarwriter.format, TarEntryFormat.Gnu)
            tarwriter.write(path: path, entryName: path)
            @Assert(String.fromUtf8(readToEnd(bytebuffer1)), String.fromUtf8(readToEnd(bytebuffer2)))
        }
    }

    @TestCase
    func test_tarwriter_03_1(): Unit {
        for (path in filepaths) {
            let bytebuffer1 = ByteBuffer()
            GnuTarEntry(path).writeTo(bytebuffer1)
            let bytebuffer2 = ByteBuffer()
            let tarwriter = TarWriter(bytebuffer2, TarEntryFormat.Gnu)
            tarwriter.write(Path(path), entryName: path)
            @Assert(String.fromUtf8(readToEnd(bytebuffer1)), String.fromUtf8(readToEnd(bytebuffer2)))
        }
    }

    @TestCase
    func test_tarwriter_03_2(): Unit {
        for (path in filepaths) {
            let bytebuffer1 = ByteBuffer()
            GnuTarEntry(path).writeTo(bytebuffer1)
            let bytebuffer2 = ByteBuffer()
            let tarwriter = TarWriter(bytebuffer2, TarEntryFormat.Gnu)
            tarwriter.write(FileInfo(path), entryName: path)
            @Assert(String.fromUtf8(readToEnd(bytebuffer1)), String.fromUtf8(readToEnd(bytebuffer2)))
        }
    }

    @TestCase
    func test_tarwriter_04(): Unit {
        for (path in filepaths) {
            let bytebuffer1 = ByteBuffer()
            PaxTarEntry(path).writeTo(bytebuffer1)
            let bytebuffer2 = ByteBuffer()
            let tarwriter = TarWriter(bytebuffer2, TarEntryFormat.Pax)
            @Expect(tarwriter.format, TarEntryFormat.Pax)
            tarwriter.write(path: path, entryName: path)
            @Assert(String.fromUtf8(readToEnd(bytebuffer1)), String.fromUtf8(readToEnd(bytebuffer2)))
        }
    }

    @TestCase
    func test_tarwriter_04_1(): Unit {
        for (path in filepaths) {
            let bytebuffer1 = ByteBuffer()
            PaxTarEntry(path).writeTo(bytebuffer1)
            let bytebuffer2 = ByteBuffer()
            let tarwriter = TarWriter(bytebuffer2, TarEntryFormat.Pax)
            tarwriter.write(Path(path), entryName: path)
            @Assert(String.fromUtf8(readToEnd(bytebuffer1)), String.fromUtf8(readToEnd(bytebuffer2)))
        }
    }

    @TestCase
    func test_tarwriter_04_2(): Unit {
        for (path in filepaths) {
            let bytebuffer1 = ByteBuffer()
            PaxTarEntry(path).writeTo(bytebuffer1)
            let bytebuffer2 = ByteBuffer()
            let tarwriter = TarWriter(bytebuffer2, TarEntryFormat.Pax)
            tarwriter.write(FileInfo(path), entryName: path)
            @Assert(String.fromUtf8(readToEnd(bytebuffer1)), String.fromUtf8(readToEnd(bytebuffer2)))
        }
    }

    @TestCase
    func test_tarwriter_05(): Unit {
        for (path in filepaths) {
            let bytebuffer1 = ByteBuffer()
            V7TarEntry(path).writeTo(bytebuffer1)
            let bytebuffer2 = ByteBuffer()
            let tarwriter = TarWriter(bytebuffer2, TarEntryFormat.Pax)
            tarwriter.write(path: path, entryName: path)
            @Assert(String.fromUtf8(readToEnd(bytebuffer1)) != String.fromUtf8(readToEnd(bytebuffer2)))
        }
    }

    @TestCase
    func test_tarwriter_06(): Unit {
        for (path in filepaths) {
            let bytebuffer1 = ByteBuffer()
            V7TarEntry(path).writeTo(bytebuffer1)
            let tarwriter = TarWriter(bytebuffer1, TarEntryFormat.Pax)
            tarwriter.write(path: path, entryName: path)
            String.fromUtf8(readToEnd(bytebuffer1)) |> println
        }
    }
}