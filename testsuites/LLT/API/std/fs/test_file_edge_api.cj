/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.fs.*
import std.io.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class FsFileEdgeApiTest {

    @TestCase
    func test_openmode_equal(): Unit {
        @Assert(OpenMode.Read == OpenMode.Read)
        @Assert(OpenMode.Write == OpenMode.Write)
        @Assert(OpenMode.Append == OpenMode.Append)
        @Assert(OpenMode.ReadWrite == OpenMode.ReadWrite)
        @Assert(OpenMode.Read != OpenMode.Write)
        @Assert(OpenMode.Append != OpenMode.ReadWrite)
    }

    @TestCase
    func test_openmode_tostring(): Unit {
        @Expect(OpenMode.Read.toString(), "Read")
        @Expect(OpenMode.Write.toString(), "Write")
        @Expect(OpenMode.Append.toString(), "Append")
        @Expect(OpenMode.ReadWrite.toString(), "ReadWrite")
    }

    @TestCase
    func test_openmode_not_equal(): Unit {
        @Assert(!(OpenMode.Read == OpenMode.Write))
        @Assert(OpenMode.Read != OpenMode.Append)
    }

    @TestCase
    func test_file_create_and_write(): Unit {
        let path = "/tmp/cj_test_file1.txt"
        if (exists(path)) {
            remove(path)
        }
        let f = File.create(path)
        let data: Array<Byte> = [72, 101, 108, 108, 111] // "Hello"
        f.write(data)
        f.close()
        @Assert(exists(path))
        remove(path)
    }

    @TestCase
    func test_file_create_already_exists(): Unit {
        let path = "/tmp/cj_test_file2.txt"
        if (!exists(path)) {
            let _ = File.create(path)
        }
        try {
            let _ = File.create(path)
            @Assert(false)
        } catch (e: FSException) {
            @Assert(true)
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_read(): Unit {
        let path = "/tmp/cj_test_file3.txt"
        File.writeTo(path, [65, 66, 67]) // "ABC"
        try {
            let f = File(path, OpenMode.Read)
            let buf = Array<Byte>(10, repeat: 0)
            let n = f.read(buf)
            @Expect(n, 3)
            @Expect(buf[0], 65)
            @Expect(buf[1], 66)
            @Expect(buf[2], 67)
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_read_empty_buffer(): Unit {
        let path = "/tmp/cj_test_file4.txt"
        File.writeTo(path, [65])
        try {
            let f = File(path, OpenMode.Read)
            try {
                let _ = f.read(Array<Byte>())
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_write_readonly(): Unit {
        let path = "/tmp/cj_test_file5.txt"
        File.writeTo(path, [65])
        try {
            let f = File(path, OpenMode.Read)
            try {
                f.write([66])
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_setlength_negative(): Unit {
        let path = "/tmp/cj_test_file6.txt"
        File.writeTo(path, [65, 66, 67])
        try {
            let f = File(path, OpenMode.ReadWrite)
            try {
                f.setLength(-1)
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_setlength_readonly(): Unit {
        let path = "/tmp/cj_test_file7.txt"
        File.writeTo(path, [65, 66, 67])
        try {
            let f = File(path, OpenMode.Read)
            try {
                f.setLength(0)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_setlength_valid(): Unit {
        let path = "/tmp/cj_test_file8.txt"
        File.writeTo(path, [65, 66, 67, 68, 69])
        try {
            let f = File(path, OpenMode.ReadWrite)
            f.setLength(3)
            @Expect(f.length, 3)
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_seek_begin(): Unit {
        let path = "/tmp/cj_test_file9.txt"
        File.writeTo(path, [65, 66, 67, 68, 69])
        try {
            let f = File(path, OpenMode.ReadWrite)
            let pos = f.seek(SeekPosition.Begin(0))
            @Assert(pos >= 0)
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_seek_end(): Unit {
        let path = "/tmp/cj_test_file10.txt"
        File.writeTo(path, [65, 66, 67])
        try {
            let f = File(path, OpenMode.ReadWrite)
            let pos = f.seek(SeekPosition.End(0))
            @Assert(pos >= 0)
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_seek_current(): Unit {
        let path = "/tmp/cj_test_file11.txt"
        File.writeTo(path, [65, 66, 67, 68, 69])
        try {
            let f = File(path, OpenMode.ReadWrite)
            let _ = f.seek(SeekPosition.Begin(2))
            let pos = f.seek(SeekPosition.Current(1))
            @Assert(pos >= 0)
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_canread_canwrite(): Unit {
        let path = "/tmp/cj_test_file12.txt"
        File.writeTo(path, [65])
        try {
            let f = File(path, OpenMode.Read)
            @Assert(f.canRead())
            @Assert(!f.canWrite())
            f.close()
            @Assert(f.isClosed())
            @Assert(!f.canRead())
            @Assert(!f.canWrite())
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_canread_canwrite_readwrite(): Unit {
        let path = "/tmp/cj_test_file13.txt"
        File.writeTo(path, [65])
        try {
            let f = File(path, OpenMode.ReadWrite)
            @Assert(f.canRead())
            @Assert(f.canWrite())
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_filedescriptor(): Unit {
        let path = "/tmp/cj_test_file14.txt"
        File.writeTo(path, [65])
        try {
            let f = File(path, OpenMode.Read)
            @Assert(f.fileDescriptor.fileHandle > 0)
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_info_prop(): Unit {
        let path = "/tmp/cj_test_file15.txt"
        File.writeTo(path, [65, 66])
        try {
            let f = File(path, OpenMode.Read)
            let info = f.info
            @Expect(info.name, "cj_test_file15.txt")
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_append(): Unit {
        let path = "/tmp/cj_test_file16.txt"
        File.writeTo(path, [65, 66]) // "AB"
        File.appendTo(path, [67, 68]) // "CD"
        try {
            let data = File.readFrom(path)
            @Expect(data.size, 4)
            @Expect(data[0], 65)
            @Expect(data[3], 68)
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_write_empty(): Unit {
        let path = "/tmp/cj_test_file17.txt"
        if (exists(path)) {
            remove(path)
        }
        let f = File.create(path)
        f.write(Array<Byte>())
        f.close()
        @Assert(exists(path))
        remove(path)
    }

    @TestCase
    func test_file_close_twice(): Unit {
        let path = "/tmp/cj_test_file18.txt"
        File.writeTo(path, [65])
        let f = File(path, OpenMode.Read)
        f.close()
        f.close() // should not throw
        remove(path)
        @Assert(true)
    }

    @TestCase
    func test_file_open_nonexistent(): Unit {
        try {
            let _ = File("/tmp/cj_nonexistent_99999.txt", OpenMode.Read)
            @Assert(false)
        } catch (e: FSException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_file_empty_path(): Unit {
        try {
            let _ = File("", OpenMode.Read)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_file_null_byte_path(): Unit {
        try {
            let _ = File("bad\0path", OpenMode.Read)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_file_create_temp(): Unit {
        let f = File.createTemp("/tmp")
        @Assert(f.fileDescriptor.fileHandle > 0)
        f.write([1, 2, 3])
        f.close()
        remove(f.info.path.toString())
        @Assert(true)
    }

    @TestCase
    func test_file_readfrom(): Unit {
        let path = "/tmp/cj_test_file19.txt"
        File.writeTo(path, [88, 89, 90])
        try {
            let data = File.readFrom(path)
            @Expect(data.size, 3)
            @Expect(data[0], 88)
            @Expect(data[2], 90)
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_copy(): Unit {
        let srcPath = "/tmp/cj_test_src20.txt"
        let dstPath = "/tmp/cj_test_dst20.txt"
        File.writeTo(srcPath, [72, 73])
        try {
            copy(srcPath, to: dstPath, overwrite: true)
            @Assert(exists(dstPath))
            let data = File.readFrom(dstPath)
            @Expect(data.size, 2)
            @Expect(data[0], 72)
        } finally {
            removeIfExists(srcPath)
            removeIfExists(dstPath)
        }
    }

    @TestCase
    func test_file_length(): Unit {
        let path = "/tmp/cj_test_file21.txt"
        File.writeTo(path, [1, 2, 3, 4, 5])
        try {
            let f = File(path, OpenMode.Read)
            @Expect(f.length, 5)
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_flush(): Unit {
        let path = "/tmp/cj_test_file22.txt"
        File.writeTo(path, [65])
        try {
            let f = File(path, OpenMode.ReadWrite)
            f.flush()
            f.close()
        } finally {
            remove(path)
        }
    }
}
