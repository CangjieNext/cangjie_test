/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./organization
// (CJNATIVE) EXEC: cd organization/withOrg && cjpm build
// (CJNATIVE) EXEC: cd organization/noOrg && cjpm build
// (CJNATIVE) EXEC: %compiler -Woff all %cmp_opt %f -g -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.reflect.*


@Test
class TestOrganizationName {
    @TestCase
    func testNoOrganizationName() {
        let info = PackageInfo.load("organization/noOrg/target/release/myPkg2/libmyPkg2.so")
        @Expect(info.organizationName, "")
    }
    @TestCase
    func testWithOrganizationName() {
        let info = PackageInfo.load("organization/withOrg/target/release/myPkg@myOrg/libmyPkg@myOrg.so")
        @Expect(info.organizationName, "myOrg")
    }
}