// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/common_test.cj
// EXEC-0: %compiler %noColor --experimental --test c/common_test.cj --output-type=chir --output-dir ./c
package pkg

import std.unittest.*
import std.unittest.testmacro.*

@Test
public common func testik() {
    throw Exception("Common test!")
    @Expect(false, true)
}

// SEPARATE-FILE: p/spec_test.cj
// EXEC-0: %compiler %noColor --experimental --test p/spec_test.cj --common-part-chir=c/pkg.chir --common-part-cjo=./c/pkg.cjo -L. -o %output
// EXEC: %run %output
package pkg

import std.unittest.*
import std.unittest.testmacro.*

@Test
public specific func testik() {
    @Expect(true, true)
}
