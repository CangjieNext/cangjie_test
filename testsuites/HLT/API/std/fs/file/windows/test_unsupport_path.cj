/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the File.apis when input are windows paths,
 * Test API: Apis in Class File
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_File_Unsupport_Path {
    private var dirpath = canonicalize(Path(".\\")).join("testdir").toString()
    private var filepaths = [dirpath + "file1", "\\\\.\\" + dirpath + "file2", "\\\\?\\" + dirpath + "file3"]
    private var illegalpaths = ["\\\\??\\" + dirpath + "file4"]
    private var data = Array<Byte>(100, repeat: 10)
    private var sum = 0

    public override func beforeAll(): Unit {
        if (exists(dirpath) == false) {
            Directory.create(dirpath)
        }
        @Assert(exists(dirpath), true)
    }

    public override func beforeEach(): Unit {
        for (str in filepaths) {
            File(str, ReadWrite).close()
        }
        sum = 0
    }

    public override func afterEach(): Unit {
        for (str in filepaths) {
            remove(str)
        }
    }

    @TestCase
    func test_unsupport_init_append(): Unit {
        for (str in filepaths) {
            var file = File(str, OpenMode.Append)
            file.write(data)
            file.close()
        }

        for (str in illegalpaths) {
            try {
                var file = File(str, OpenMode.Append)
            } catch (e: FSException) {
                var parpath = Path(str).parent.toString()
                @Expect(e.message, "The input path 'parent' `${parpath}` does not exist.")
                sum += 1
            }
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_unsupport_init_open(): Unit {
        for (str in illegalpaths) {
            try {
                var file = File(str, ReadWrite)
                @Expect("path not exist", "FSException")
            } catch (e: FSException) {
                var parpath = Path(str).parent.toString()
                @Expect(e.message, "The input path 'parent' `${parpath}` does not exist.")
                sum += 1
            }
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_unsupport_init_create(): Unit {
        for (str in filepaths) {
            try {
                File.create(Path(str)).close()
            } catch (e: FSException) {
                @Expect(e.message, "The file `${str}` is already exists.")
                sum += 1
            }
        }
        @Expect(sum, 3)
    }

    @TestCase
    func test_unsupport_init_createorappend(): Unit {
        for (str in filepaths) {
            var file = File(str, OpenMode.Append)
            file.write(data)
            var arr = File.readFrom(str)
            @Expect(arr, data)
            file.close()
        }

        for (str in illegalpaths) {
            try {
                File(str, OpenMode.Append)
            } catch (e: FSException) {
                var parpath = Path(str).parent.toString()
                @Expect(e.message, "The input path 'parent' `${parpath}` does not exist.")
                sum += 1
            }
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_unsupport_exists(): Unit {
        for (str in filepaths) {
            @Expect(exists(str), true)
        }
        for (str in illegalpaths) {
            @Expect(exists(Path(str)), false)
        }
    }

    @TestCase
    func test_unsupport_openread(): Unit {
        for (str in filepaths) {
            File(str, Read).close()
        }
        for (str in illegalpaths) {
            try {
                File(str, Read).close()
            } catch (e: FSException) {
                var parpath = Path(str).parent.toString()
                @Expect(e.message, "The input path 'parent' `${parpath}` does not exist.")
                sum += 1
            }
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_unsupport_create(): Unit {
        for (str in filepaths) {
            try {
                File.create(Path(str))
            } catch (e: FSException) {
                @Expect(e.message, "The file `${str}` is already exists.")
                sum += 1
            }
        }

        for (str in illegalpaths) {
            try {
                File.create(Path(str))
            } catch (e: FSException) {
                var parpath = Path(str).parent.toString()
                @Expect(e.message.contains("does not exist"))
                sum += 1
            }
        }
        @Expect(sum, 4)
    }

    @TestCase
    func test_unsupport_createtemp(): Unit {
        var file = File.createTemp(dirpath)
        var filepath = file.info.path
        @Assert(exists(filepath), true)
        file.close()
        remove(filepath)
        @Expect(exists(filepath), false)
    }

    @TestCase
    func test_unsupport_readfrom_writeto(): Unit {
        for (str in filepaths) {
            File.appendTo(str, data)
            var arr = File.readFrom(str)
            @Expect(arr, data)
        }

        for (str in illegalpaths) {
            try {
                File.appendTo(str, data)
            } catch (e: FSException) {
                var parpath = Path(str).parent.toString()
                @Expect(e.message, "The input path 'parent' `${parpath}` does not exist.")
                sum += 1
            }
            try {
                File.readFrom(str)
            } catch (e: FSException) {
                var parpath = Path(str).parent.toString()
                @Expect(e.message, "The input path 'parent' `${parpath}` does not exist.")
                sum += 1
            }
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_unsupport_copy_move(): Unit {
        File.appendTo(filepaths[0], data)
        var testdir = Path(dirpath).join("test_tmp")
        Directory.create(testdir, recursive: false)
        @Assert(exists(testdir), true)
        var file1 = File.create(testdir.join("001"))
        file1.close()

        try {
            copy(filepaths[0], to: testdir.join("001").toString(), overwrite: false)
        } catch (e: FSException) {
            @Expect(e.message.contains("is already exists."))
            sum += 1
        }
        copy(filepaths[0], to: testdir.join("001").toString(), overwrite: true)
        var readdata = File.readFrom(testdir.join("001"))
        @Expect(readdata, data)
        @Expect(exists(filepaths[0]), true)

        File.create(testdir.join("002")).close()
        @Assert(exists(testdir.join("002")), true)
        try {
            rename(testdir.join("002").toString(), to: filepaths[0], overwrite: false)
        } catch (e: FSException) {
            @Expect(e.message.contains("already exists and overwrite is false"))
            sum += 1
        }
        rename(testdir.join("002").toString(), to: filepaths[0], overwrite: true)
        @Expect(exists(testdir.join("002")), false)
        var res = File.readFrom(filepaths[0])
        @Expect(res, Array<Byte>())

        remove(testdir, recursive: true)
        @Expect(sum, 2)
    }
}
