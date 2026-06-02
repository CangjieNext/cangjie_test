/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.posix.*
import std.io.*
import std.fs.*
import std.collection.*
import std.process.*

@When[os == "Windows"]
const sep = "\\"
@When[os != "Windows"]
const sep = "/"

// create A TEST DIR TO TEST FOR PLATFORM ADAPTION
var pwd_path: String = Process.current.workingDirectory.toString()
var test_path0 = pwd_path + "/test0"
var nameCnt: Int64 = 0;
var testPathBaseLength = pwd_path.size + 5
let nameCntLimit = 15;
let maxPathLength = 512

func tryNewName() {
    if ("${nameCnt}".size < nameCntLimit) {
        test_path0 = test_path0[0..testPathBaseLength] + "_${nameCnt}"
        nameCnt = nameCnt + 1
        return
    }
    nameCnt = 0
    testPathBaseLength = testPathBaseLength + nameCntLimit
    return
}

func createAndGetTestDirInPwd(): String {
    // TO AVOID THERE existS SAME-NAME FILE IN THE CURRENT WORKING DIRECTORY
    while (exists(test_path0) && test_path0.size < maxPathLength) {
        tryNewName()
    }
    if (test_path0.size >= maxPathLength) {
        return ""
    }
    var test_path1 = test_path0 + "/test1"
    var test_path2 = test_path1 + "/test2"
    var test_path3 = test_path2 + "/test3"
    var test_path_tmp = test_path3 + "/tmp"

    Directory.create(test_path0)
    @Assert(exists(test_path0),true)
    Directory.create(test_path1)
    @Assert(exists(test_path1),true)
    Directory.create(test_path2)
    @Assert(exists(test_path2),true)
    Directory.create(test_path3)
    @Assert(exists(test_path3),true)
    Directory.create(test_path_tmp)
    @Assert(exists(test_path_tmp),true)
    return test_path3
}

func deleteTestDirInPwd(): Bool {
    remove(test_path0, recursive: true)
    if (exists(test_path0)) {
        return false
    }
    return true
}

func getDirsAndFiles(path: String): (ArrayList<FileInfo>, ArrayList<FileInfo>) {
    let dirs = ArrayList<FileInfo>()
    let files = ArrayList<FileInfo>()
    Directory.walk(path) {
        info =>
            if (info.isRegular()) {
                files.add(info)
            } else if (info.isDirectory()) {
                dirs.add(info)
            }
            true
    }
    return (dirs, files)
}

@Test
class TestDirectory {
    @AfterAll
    func clean(): Unit {
        if (exists(test_path0)) {
            deleteTestDirInPwd()
        }
    }
    @TestCase
    func testCase00(): Unit {
        let test_dir = createAndGetTestDirInPwd()
        @Assert(test_dir.size > 0)

        // restore Environment
        if (exists(test_dir + "/" + "/tmp/dir1")) {
            remove(test_dir + "/" + "/tmp/dir1", recursive: true)
        }

        // Round 1 create Directory dir1 and sub_dir1
        Directory.create(test_dir + "/" + "/tmp/dir1")
        @Assert(exists(test_dir + "/" + "/tmp/dir1"))

        Directory.create(test_dir + "/" + "/tmp/dir1/sub_dir1")
        @Assert(exists(test_dir + "/" + "/tmp/dir1/sub_dir1"))
        let (num_Dirs1, num_Files1) = getDirsAndFiles(test_dir + sep * 2 + "tmp" + sep + "dir1")
        @Expect(num_Dirs1.size == 1)
        @Expect(num_Dirs1[0].path.toString() == test_dir + sep * 2 + "tmp" + sep + "dir1" + sep + "sub_dir1")
        @Expect(num_Files1.size == 0)
        remove(test_dir + "/" + "/tmp/dir1", recursive: true)
        @Expect(exists(test_dir + sep * 2 + "tmp" + "dir1"), false)
    }
}
