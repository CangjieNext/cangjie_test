/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj seek_cz.txt
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
import std.io.*
import std.fs.*

main() {
    var fileName = "seek_cz.txt"
    var fs = File(fileName, ReadWrite)
    var fs_seek_0 = fs.seek(SeekPosition.End(1))
    fs.seek(SeekPosition.Begin(0)) //置零
    var fs_seek_1 = fs.seek(SeekPosition.End(0))
    fs.seek(SeekPosition.Begin(0)) //置零
    var fs_seek_2 = fs.seek(SeekPosition.End(-1))
    fs.seek(SeekPosition.Begin(0)) //置零
    var fs_seek_3 = fs.seek(SeekPosition.End(-10))
    fs.seek(SeekPosition.Begin(0)) //置零
    var fs_seek_4 = fs.seek(SeekPosition.Begin(0))
    fs.seek(SeekPosition.Begin(0)) //置零
    var fs_seek_5 = fs.seek(SeekPosition.Begin(10))
    fs.seek(SeekPosition.Begin(0)) //置零
    var fs_seek_6 = fs.seek(SeekPosition.Begin(11))
    fs.seek(SeekPosition.Begin(0)) //置零
    var fs_seek_7 = fs.seek(SeekPosition.Begin(200))
    fs.seek(SeekPosition.Begin(0)) //置零
    fs.seek(SeekPosition.Begin(5)) //置于索引5的位置
    var fs_seek_8 = fs.seek(SeekPosition.Current(0))
    fs.seek(SeekPosition.Begin(0)) //置零
    fs.seek(SeekPosition.Begin(5)) //置于索引5的位置
    var fs_seek_9 = fs.seek(SeekPosition.Current(-1))
    fs.seek(SeekPosition.Begin(0)) //置零
    fs.seek(SeekPosition.Begin(5)) //置于索引5的位置
    var fs_seek_10 = fs.seek(SeekPosition.Current(-5))
    fs.seek(SeekPosition.Begin(0)) //置零
    fs.seek(SeekPosition.Begin(5)) //置于索引5的位置
    var fs_seek_11 = fs.seek(SeekPosition.Current(4))
    fs.seek(SeekPosition.Begin(0)) //置零
    fs.seek(SeekPosition.Begin(5)) //置于索引5的位置
    var fs_seek_12 = fs.seek(SeekPosition.Current(5))
    fs.seek(SeekPosition.Begin(0)) //置零
    fs.seek(SeekPosition.Begin(5)) //置于索引5的位置
    var fs_seek_13 = fs.seek(SeekPosition.Current(200))

    CaseRunner<Int64>().runCases(
        [
            (fs_seek_0, 11),
            (fs_seek_1, 10),
            (fs_seek_2, 9),
            (fs_seek_3, 0),
            (fs_seek_4, 0),
            (fs_seek_5, 10),
            (fs_seek_6, 11),
            (fs_seek_7, 200),
            (fs_seek_8, 5),
            (fs_seek_9, 4),
            (fs_seek_10, 0),
            (fs_seek_11, 9),
            (fs_seek_12, 10),
            (fs_seek_13, 205)
        ],
        description: "test case 1" /**用例描述**/
    )

    return 0
}
