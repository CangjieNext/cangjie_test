/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: dir002
// (CJNATIVE and not OHOS and not Windows) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS and not Windows) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import stdx.syntax.*

@Test
func test_dirpath_012() {
    let fileinfo = FileInfo("./dir002")
    fileinfo.setReadable(false)
    @Expect(fileinfo.canRead(), false)
    let e = @AssertThrows[Exception](parsePackage("./dir002"))
    @Assert(e.message, "IOException: Failed to get number of subFiles in directory.")
    fileinfo.setReadable(true)
}
