/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %use_ast %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

@Test
func test_packageHeader() {
    var input: Tokens = quote(package a)
    let _packageHeader = PackageHeader(input)
    _packageHeader.dump()
    @Assert(_packageHeader.accessible.value, "")
    @Assert(_packageHeader.keywordM.value, "")
    @Assert(_packageHeader.keywordP.value, "package")
    @Assert(_packageHeader.prefixPaths.toString(), "")
    @Assert(_packageHeader.prefixDots.toString(), "")
    @Assert(_packageHeader.packageIdentifier.value, "a")
    @Assert(_packageHeader.orgName.value, "")
    @Assert(_packageHeader.orgSeparator.value, "")
}
