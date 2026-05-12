/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows and not iOS) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows and not iOS) RUN-EXEC-PIPE: touch testfile01 && touch .hidden_files_01 && mkdir -p testdir && ln -sf unexists symlink01 && ln -sf testfile01 symlink02 && ln -sf testdir symlink03 && touch unexists && %export USER=`whoami` && %run %run_opt %output %run_utest_opt %run_args | compare %f
// (not Windows) ASSERT: scan-2 symlink01
// (not Windows) ASSERT: scan-2 symlink02
// (not Windows) ASSERT: scan-2 symlink03
// (not Windows) ASSERT: scan-4 .hidden_files_01

/*
 * Test description: Test the iterators and lists in Class Directory
 * Test API: public static func walk(path: String, f: (entry: FileInfo)->Bool): Unit
 *           public static func readFrom(path: String): Array<FileInfo>
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.process.*

var user = Option<String>.None

@Test
class Test_Dir_Iterators_Lists {
    public override func beforeAll(): Unit {
        user = Process.current.getEnv("USER")
    }

    private var path0 = FileInfo("testfile01").parentDirectory.getOrThrow().path

    @TestCase
    func test_walk(): Unit {
        Directory.walk(path0) {
            info =>
            println(info.path)
            true
        }
    }

    @TestCase
    func test_directories(): Unit {
        Directory.walk(path0) {
            info =>
            if (info.isDirectory()) {
                println(info.path)
            }
            true
        }
    }

    @TestCase
    func test_files(): Unit {
        Directory.walk(path0) {
            info =>
            if (info.isRegular()) {
                println(info.path)
            }
            true
        }
    }

    @TestCase
    func test_entrylist(): Unit {
        var it = Directory.readFrom(path0)
        for (i in it) {
            println(i.path)
        }
    }

    @TestCase
    func test_directorylist(): Unit {
        var it = Directory.readFrom(path0).iterator().filter {info => info.isDirectory()}
        while (let Some(i) <- it.next()) {
            println(i.path)
        }
    }

    @TestCase
    func test_filelist(): Unit {
        var it = Directory.readFrom(path0).iterator().filter {info => info.isRegular()}
        while (let Some(i) <- it.next()) {
            println(i.path)
        }
    }

    @TestCase
    func test_dev(): Unit {
        let sum = Box<Int64>(0)
        Directory.walk("/dev") {
            info =>
            sum.value++
            true
        }
        @Expect(sum.value == 0, false)

        var it2 = Directory.readFrom("/dev")
        for (i in it2) {
            sum.value -= 1
        }
        @Expect(sum.value, 0)

        Directory.walk("/dev") {
            info =>
            if (info.isDirectory()) {
                sum.value++
            }
            true
        }
        var it4 = Directory.readFrom("/dev").iterator().filter {info => info.isDirectory()}
        for (i in it4) {
            sum.value -= 1
        }
        @Expect(sum.value, 0)

        Directory.walk("/dev") {
            info =>
            if (info.isRegular()) {
                sum.value++
            }
            true
        }
        var it6 = Directory.readFrom("/dev").iterator().filter {info => info.isRegular()}
        for (i in it6) {
            sum.value -= 1
        }
        @Expect(sum.value, 0)
    }

    @TestCase
    func test_no_permission(): Unit {
        match (user) {
            case Some("root") => ()
            case _ =>
                Directory.create("test_permission/temp", recursive: true)
                var dirinfo = FileInfo("test_permission")
                dirinfo.setReadable(false)
                var sum = 0
                var path = "test_permission"
                var apis: Array<(String) -> Any> = [{path: String => Directory.walk(path) {_ => true}},
                    {path: String => Directory.readFrom(path)}]
                for (call_api in apis) {
                    try {
                        call_api(path)
                    } catch (e: FSException) {
                        @Expect(e.message.contains("Failed to obtain members in the directory"))
                        sum += 1
                    }
                }
                @Expect(sum, 2)
                dirinfo.setReadable(true)
                remove("test_permission/temp", recursive: true)
        }
    }
}
