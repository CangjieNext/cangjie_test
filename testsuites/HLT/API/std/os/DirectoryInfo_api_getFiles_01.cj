/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.posix.*
import std.io.*
import std.fs.*
import std.collection.*
import std.process.*

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
    var test_path_tmp = test_path3 + "/Dir1"

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

main(): Int64 {
    var test_dir: String = createAndGetTestDirInPwd()
    if (test_dir.size <= 0) {
        if (test_path0.size >= maxPathLength) {
            return 1
        }
        if (exists(test_path0)) {
            deleteTestDirInPwd()
        }
        return 2
    }

    print("current dic=" + test_dir + "/" + "./Dir1\n")
    var bool = exists(test_dir + "/Dir1")
    if (!bool) {
        return 3
    }
    remove(test_dir + "/Dir1", recursive: false)
    var bool1 = exists(test_dir + "/Dir1")
    if (!bool1) {
        //If no subdirectory or file exists, the system returns an exception.
        try {
            var infos = Directory.readFrom(test_dir + "/Dir1")
        } catch (e: FSException) {
            println("=================here, ${e.message}")
            if (!e.message.contains("does not exist.")) {
                return 4
            }
        }
    }
    return 0
}
