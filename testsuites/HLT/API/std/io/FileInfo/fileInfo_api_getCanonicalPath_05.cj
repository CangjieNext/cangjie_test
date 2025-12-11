/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows) EXEC-PIPE: rm -rf mydic/mydic2/;mkdir -p mydic/mydic2/
// (Windows) EXEC-PIPE: mkdir -p mydic/mydic2/
// EXEC-PIPE: %touch mydic/mydic2/test.txt
// EXEC-PIPE: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.io.*
import std.posix.*
import std.fs.*

@When[os != "Windows"]
main() {
    var path: String = "//mydic//mydic2/test.txt"
    var curdir = getcwd()
    var exppath: String = curdir + "/mydic/mydic2/test.txt"
    try {
        var file: FileInfo = FileInfo(path)
        var result = canonicalize(file.path).toString()
    } catch (e: FSException) {
        if (e.toString().contains("FSException: The input path `//mydic//mydic2/test.txt` does not exist")) {
            return 0
        }
        return 2
    }
    return 1
}

@When[os == "Windows"]
main() {
    var path: String = "\\mydic\\mydic2\\test.txt"
    var curdir = getcwd()
    var exppath: String = curdir + "\\mydic\\mydic2\\test.txt"
    try {
        var file: FileInfo = FileInfo(path)
        var result = canonicalize(file.path).toString()
    } catch (e: FSException) {
        if (e.toString().contains("FSException: The input path `\\mydic\\mydic2\\test.txt` does not exist")) {
            return 0
        }
        return 2
    }
    return 1
}
