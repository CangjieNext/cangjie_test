/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows or OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows or OHOS)RUN-EXEC: export USER=`whoami` && %run %run_opt %output %run_utest_opt %run_args

/*
 * Test description: Test the apis in Class File when user do not have
 * file permission or parent directory permission
 * Test API: File.init/exists/read/write/writeto/readfrom/move/copyto/copy
 *           Directory.init/exists/create/createFile/createSubDirctory
 *           FileInfo.init/setExecutable/setReadable/setWritable etc
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.io.*
import std.process.*
import std.regex.*

var user = Option<String>.None

@Test
class Test_File_No_Permission {
    public override func beforeAll(): Unit {
        user = Process.current.getEnv("USER")
    }

    //parent dir:permission_test_dir - dir_init, dir_per1, dir_per2, file0
    //dir_init - file1; dir_per1-file2; dir_per2-file2
    public override func beforeEach(): Unit {
        if (!exists("permission_test_dir")) {
            var dir0 = Directory.create("permission_test_dir")
            @Assert(exists("permission_test_dir"), true)
            File.create(Path("permission_test_dir").join("file0")).close()
            @Assert(exists(Path("permission_test_dir").join("file0")), true)
            var dir1 = Directory.create(Path("permission_test_dir").join("dir_init"))
            @Assert(exists(Path("permission_test_dir").join("dir_init")), true)
            var dir2 = Directory.create(Path("permission_test_dir").join("dir_per1"))
            @Assert(exists(Path("permission_test_dir").join("dir_per1")), true)
            var dir3 = Directory.create(Path("permission_test_dir").join("dir_per2"))
            @Assert(exists(Path("permission_test_dir").join("dir_per2")), true)
            File.create(Path("permission_test_dir").join("dir_init").join("file1")).close()
            @Assert(exists(Path("permission_test_dir").join("dir_init").join("file1")),true)
            File.create(Path("permission_test_dir").join("dir_per1").join("file2")).close()
            @Assert(exists(Path("permission_test_dir").join("dir_per1").join("file2")),true)
            File.create(Path("permission_test_dir").join("dir_per2").join("file2")).close()
            @Assert(exists(Path("permission_test_dir").join("dir_per2").join("file2")),true)
        }
    }

    public override func afterEach(): Unit {
        if (exists("permission_test_dir")) {
            remove("permission_test_dir", recursive: true)
        }
        @Assert(exists("permission_test_dir"), false)
    }

    //file not executable
    @TestCase
    func test_file_unexecutable(): Unit {
        var sum = 0
        //文件依然可读可写
        var fileinfo = FileInfo("permission_test_dir/dir_per1/file2")
        var boolean1 = fileinfo.setExecutable(false)
        @Expect(boolean1, true)
        var file = File("permission_test_dir/dir_per1/file2", ReadWrite)
        var data = Array<Byte>(100, repeat: 10)
        var buf = Array<Byte>(100, repeat: 0)
        file.write(data)
        file.seek(SeekPosition.Begin(0))
        file.read(buf)
        file.close()
        @Expect(buf, data)

        //文件移动操作正常
        try {
            rename("permission_test_dir/dir_per1/file2", to: "permission_test_dir/dir_per2/file2", overwrite: false)
        } catch (e: FSException) {
            sum += 1
        }
        rename("permission_test_dir/dir_per1/file2", to: "permission_test_dir/dir_per2/file2", overwrite: true)
        var readbuf = File.readFrom("permission_test_dir/dir_per2/file2")
        @Expect(readbuf, data)

        rename("permission_test_dir/dir_per2/file2", to: "permission_test_dir/dir_init/file2", overwrite: false)
        @Expect(exists("permission_test_dir/dir_init/file2"), true)
        @Expect(exists("permission_test_dir/dir_init/file1"), true)
        @Expect(sum, 1)

        var info2 = FileInfo("permission_test_dir/dir_init/file2")
        info2.setExecutable(true)
    }

    //file not readable
    @TestCase
    func test_file_unreadable(): Unit {
        var sum = 0
        //可读接口无法调用
        var fileinfo = FileInfo("permission_test_dir/dir_per1/file2")
        var boolean1 = fileinfo.setReadable(false)
        @Expect(boolean1, true)
        try {
            var _ = File("permission_test_dir/dir_per1/file2", ReadWrite)
        } catch (e: FSException) {
            @Expect(e.message.contains("Failed to open the file"))
            sum += 1
        }
        var file = File("permission_test_dir/dir_per1/file2", Write)
        var data = Array<Byte>(100, repeat: 10)
        var buf = Array<Byte>(100, repeat: 0)
        file.write(data)
        file.seek(SeekPosition.Begin(0))
        try {
            file.read(buf)
        } catch (e: FSException) {
            @Assert(Regex("^The file `.+` does not have the read permission.$").matches(e.message))
            sum += 1
        }
        file.close()

        try {
            File.readFrom("permission_test_dir/dir_per1/file2")
        } catch (e: FSException) {
            @Expect(e.message.contains("Failed to open the file"))
            sum += 1
        }

        //文件操作不受影响
        try {
            rename("permission_test_dir/dir_per1/file2", to: "permission_test_dir/dir_per2/file2", overwrite: false)
        } catch (e: FSException) {
            sum += 1
        }
        rename("permission_test_dir/dir_per1/file2", to: "permission_test_dir/dir_per2/file2", overwrite: true)
        rename("permission_test_dir/dir_per2/file2", to: "permission_test_dir/dir_init/file2", overwrite: false)
        @Expect(exists("permission_test_dir/dir_init/file2"), true)
        @Expect(exists("permission_test_dir/dir_init/file1"), true)

        //改变父目录不影响文件读写
        var dirinfo = FileInfo("permission_test_dir")
        var boolean2 = dirinfo.setReadable(false)
        @Expect(boolean2, true)
        try {
            File("permission_test_dir/dir_init/file2", Read)
        } catch (e: FSException) {
            @Expect(e.message.contains("Failed to open the file"))
            sum += 1
        }
        dirinfo.setReadable(true)

        //恢复权限可读到数据
        fileinfo = FileInfo("permission_test_dir/dir_init/file2")
        var boolean3 = fileinfo.setReadable(true)
        @Expect(boolean3, true)
        var readbuf = File.readFrom("permission_test_dir/dir_init/file2")
        @Expect(data, readbuf)
        match (user) {
            case Some("root") => @Expect(sum, 2)
            case _ => @Expect(sum, 5)
        }
    }

    //file not writable
    @TestCase
    func test_file_unwritable(): Unit {
        var sum = 0
        //可写接口无法调用
        var data = Array<Byte>(100, repeat: 10)
        var buf = Array<Byte>(100, repeat: 0)
        File.appendTo("permission_test_dir/dir_per1/file2", data)
        var fileinfo = FileInfo("permission_test_dir/dir_per1/file2")
        var boolean1 = fileinfo.setWritable(false)
        @Expect(boolean1, true)
        try {
            var _ = File("permission_test_dir/dir_per1/file2", ReadWrite)
        } catch (e: FSException) {
            @Expect(e.message.contains("Failed to open the file"))
            sum += 1
        }
        var file = File("permission_test_dir/dir_per1/file2", Read)
        file.seek(SeekPosition.Begin(0))
        file.read(buf)
        @Expect(data, buf)
        try {
            file.write(data)
        } catch (e: FSException) {
            @Assert(Regex("^The file `.+` does not have the write permission.$").matches(e.message))
            sum += 1
        }
        file.close()

        try {
            File.appendTo("permission_test_dir/dir_per1/file2", data)
        } catch (e: FSException) {
            @Expect(e.message.contains("Failed to open the file"))
            sum += 1
        }

        //文件操作不受影响
        try {
            rename("permission_test_dir/dir_per1/file2", to: "permission_test_dir/dir_per2/file2", overwrite: false)
        } catch (e: FSException) {
            sum += 1
        }
        rename("permission_test_dir/dir_per1/file2", to: "permission_test_dir/dir_per2/file2", overwrite: true)
        rename("permission_test_dir/dir_per2/file2", to: "permission_test_dir/dir_init/file2", overwrite: false)
        @Expect(exists("permission_test_dir/dir_per1/file2"), false)
        @Expect(exists("permission_test_dir/dir_init/file2"), true)
        @Expect(exists("permission_test_dir/dir_init/file1"), true)

        //改变父目录不影响文件读写
        var dirinfo = FileInfo("permission_test_dir")
        var boolean2 = dirinfo.setWritable(false)
        @Expect(boolean2, true)
        try {
            File.appendTo("permission_test_dir/dir_init/file2", data)
        } catch (e: FSException) {
            @Expect(e.message.contains("Failed to open the file"))
            sum += 1
        }
        File.readFrom("permission_test_dir/dir_init/file2")
        dirinfo.setWritable(true)

        //恢复权限可写
        fileinfo = FileInfo("permission_test_dir/dir_init/file2")
        var boolean3 = fileinfo.setWritable(true)
        @Expect(boolean3, true)
        File.writeTo("permission_test_dir/dir_init/file2", data)
        var readbuf = File.readFrom("permission_test_dir/dir_init/file2")
        @Expect(data, readbuf)
        match (user) {
            case Some("root") => @Expect(sum, 2)
            case _ => @Expect(sum, 5)
        }
    }

    //dir not executable
    @TestCase
    func test_dir_unexecutable(): Unit {
        var sum = 0
        //父目录不可执行
        var dirinfo = FileInfo("permission_test_dir/dir_init")
        var boolean1 = dirinfo.setExecutable(false)
        @Expect(boolean1, true)
        try {
            File("permission_test_dir/dir_init/file1", OpenMode.Append)
        } catch (e: FSException) {
            @Expect(e.message.contains("Failed to open the file"))
            sum += 1
        }
        try {
            File.create("permission_test_dir/dir_init/temp")
        } catch (e: FSException) {
            @Expect(e.message.contains("Failed to open the file"))
            sum += 1
        }
        try {
            File.writeTo("permission_test_dir/dir_init/file1", Array<Byte>())
        } catch (e: FSException) {
            @Expect(e.message.contains("Failed to open the file"))
            sum += 1
        }
        try {
            File.readFrom("permission_test_dir/dir_init/file1")
        } catch (e: FSException) {
            sum += 1
        }
        try {
            copy("permission_test_dir/dir_init/file1", to: "permission_test_dir/dir_per1/file1", overwrite: false)
        } catch (e: FSException) {
            sum += 1
        }
        try {
            copy("permission_test_dir/dir_per1/file1", to: "permission_test_dir/dir_init/file1", overwrite: true)
        } catch (e: FSException) {
            sum += 1
        }
        dirinfo.setExecutable(true)
        match (user) {
            case Some("root") => @Expect(sum, 0)
            case _ => @Expect(sum, 6)
        }
    }

    //dir not readable
    @TestCase
    func test_dir_unreadable(): Unit {
        //父目录不可读
        var dirinfo = FileInfo("permission_test_dir/dir_init")
        var boolean1 = dirinfo.setReadable(false)
        @Expect(boolean1, true)
        var file = File("permission_test_dir/dir_init/file1", ReadWrite)
        var data = Array<Byte>(100, repeat: 10)
        var buf = Array<Byte>(100, repeat: 0)
        var outputstream = ByteBuffer()
        File.create("permission_test_dir/dir_init/temp").close()
        //子文件读写，操作权限不受影响
        file.write(data)
        file.seek(SeekPosition.Begin(0))
        file.read(buf)
        @Expect(buf, data)
        copy(file, to: outputstream)

        copy("permission_test_dir/dir_init/file1", to: "permission_test_dir/dir_init/temp", overwrite: true)
        copy("permission_test_dir/dir_init/file1", to: "permission_test_dir/dir_per1/file1", overwrite: true)
        file.close()
        @Expect(File.readFrom("permission_test_dir/dir_init/temp"), data)
        @Expect(File.readFrom("permission_test_dir/dir_per1/file1"), data)

        dirinfo.setReadable(true)
    }

    //dir not writable
    @TestCase
    func test_dir_unwritable(): Unit {
        var sum = 0
        //父目录不可写
        var dirinfo = FileInfo("permission_test_dir/dir_init")
        var boolean1 = dirinfo.setWritable(false)
        @Expect(boolean1, true)
        var file = File("permission_test_dir/dir_init/file1", ReadWrite)
        var data = Array<Byte>(100, repeat: 10)
        var buf = Array<Byte>(100, repeat: 0)
        var outputstream = ByteBuffer()

        try {
            File.create("permission_test_dir/dir_init/temp")
        } catch (e: FSException) {
            @Expect(e.message.contains("Failed to open the file"))
            sum += 1
        }

        //子文件读写，操作权限不受影响
        file.write(data)
        file.seek(SeekPosition.Begin(0))
        file.read(buf)
        @Expect(buf, data)
        copy(file, to: outputstream)

        copy("permission_test_dir/dir_init/file1", to: "permission_test_dir/dir_per1/file1", overwrite: true)
        file.close()
        @Expect(File.readFrom("permission_test_dir/dir_per1/file1"), data)

        dirinfo.setWritable(true)
        match (user) {
            case Some("root") => @Expect(sum, 0)
            case _ => @Expect(sum, 1)
        }
    }
}
