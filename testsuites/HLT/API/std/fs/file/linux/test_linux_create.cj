/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows or OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows or OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the File.create()
 * Test API: public static func create(Path: Path): File
 *           public static func create(Path: String): File
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_File_Create {
    public override func afterAll(): Unit {
        if (exists("./dir001")) {
            remove("./dir001", recursive: true)
        }
        @Assert(exists("./dir001"), false)
    }

    @TestCase
    func test_illegal(): Unit {
        var sum = 0
        var illegal_path_string = ["\0", "/home\0"]
        try {
            File.create("")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input path is empty.")
            sum += 1
        }
        try {
            File.create(Path(""))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input path is empty.")
            sum += 1
        }
        for (str in illegal_path_string) {
            try {
                File.create(str)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message, "The input path ${unsafe { str.rawData() }} contains null character.")
                sum += 1
            }
            try {
                File.create(Path(str))
            } catch (e: IllegalArgumentException) {
                @Expect(e.message, "The input path ${unsafe { str.rawData() }} contains null character.")
                sum += 1
            }
        }
        @Expect(sum, 6)
    }

    @TestCase
    func test_fsexc(): Unit {
        var sum = 0
        var illegal_path_string = ["/a/b/c", "./a/c/b"]
        for (str in illegal_path_string) {
            try {
                File.create(str)
            } catch (e: FSException) {
                var parpath = Path(str).parent.toString()
                @Expect(e.message, "The path `${parpath}` does not exist.")
                sum += 1
            }
            try {
                File.create(Path(str))
            } catch (e: FSException) {
                var parpath = Path(str).parent.toString()
                @Expect(e.message, "The path `${parpath}` does not exist.")
                sum += 1
            }
        }
        @Expect(sum, 4)
    }

    @TestCase
    func test_create_twice(): Unit {
        var sum = 0
        Directory.create("./dir001")
        @Assert(exists("./dir001"), true)
        let path = "./dir001/a.txt"
        File.create(path).close()
        @Assert(exists(path), true)
        try {
            File.create("./dir001/a.txt")
        } catch (e: FSException) {
            @Expect(e.message, "The file `${path}` is already exists!")
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_create(): Unit {
        var sum = 0
        File.create("./rel.txt").close()
        @Assert(exists("./rel.txt"), true)
        var path0 = canonicalize(Path("./dir001"))
        File.create(path0.join(Path("abs.txt"))).close()
        @Assert(exists(path0.join(Path("abs.txt"))), true)

        var data = Array<Byte>(100, repeat: 0)
        var file = File.create("test.txt")
        @Expect(file.canRead(), false)
        @Expect(file.canWrite(), true)
        file.write(data)
        file.close()

        var arr = File.readFrom("test.txt")
        @Expect(arr, data)
        remove("./rel.txt")
        remove("test.txt")
    }

    @TestCase
    func test_nonexist_dir(): Unit {
        var sum = 0
        @Expect(exists("./dir002"), false)
        try {
            File.create("./dir002/a.txt")
        } catch (e: FSException) {
            @Expect(e.message, "The path `./dir002` does not exist.")
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_hidden_file(): Unit {
        File.create(".abc").close()
        @Assert(exists(".abc"), true)
        @Expect(exists(".abc"), true)
        remove(".abc")
        @Expect(exists(".abc"), false)
    }
}
