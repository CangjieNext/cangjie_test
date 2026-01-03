/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (CJNATIVE and not Windows and not iOS) DEPENDENCE: file001.cj
// (CJNATIVE and not Windows and not iOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not Windows and not iOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import stdx.syntax.*

@Test
class test_01{
    @TestCase
func test_filepath_011() {
    let fileinfo = FileInfo("./file001.cj")
    fileinfo.setReadable(false)
    let e = @AssertThrows[Exception](parseFile("./file001.cj"))
    @Assert(e.message, "IOException: The file is not readable.")
}
}