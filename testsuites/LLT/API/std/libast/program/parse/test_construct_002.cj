/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -o %n.%suffix %f --test
// EXEC: %run %run_opt %n.%suffix %run_args

import std.ast.*

@Test
func testPackageHeader01() {
    let toks = quote(package p)
    let packageHeader = PackageHeader(toks)
    packageHeader.dump()
    @Assert(packageHeader.keywordP.value, "package")
    @Assert(packageHeader.prefixPaths.toString(), "")
    @Assert(packageHeader.prefixDots.toString(), "")
    @Assert(packageHeader.packageIdentifier.value, "p")
    @Assert(packageHeader.orgName.value, "")
    @Assert(packageHeader.orgSeparator.value, "")
    @Assert(packageHeader.keywordM.value, "")
}

@Test
func testPackageHeader02() {
    let toks = quote(macro package p)
    let packageHeader = PackageHeader(toks)
    packageHeader.dump()
    @Assert(packageHeader.keywordP.value, "package")
    @Assert(packageHeader.prefixPaths.toString(), "")
    @Assert(packageHeader.prefixDots.toString(), "")
    @Assert(packageHeader.packageIdentifier.value, "p")
    @Assert(packageHeader.orgName.value, "")
    @Assert(packageHeader.orgSeparator.value, "")
    @Assert(packageHeader.keywordM.value, "macro")
}

@Test
func testPackageHeader03() {
    let toks = quote(macro package ORGA::p)
    let packageHeader = PackageHeader(toks)
    packageHeader.dump()
    @Assert(packageHeader.keywordP.value, "package")
    @Assert(packageHeader.prefixPaths.toString(), "")
    @Assert(packageHeader.prefixDots.toString(), "")
    @Assert(packageHeader.packageIdentifier.value, "p")
    @Assert(packageHeader.orgName.value, "ORGA")
    @Assert(packageHeader.orgSeparator.value, "::")
    @Assert(packageHeader.keywordM.value, "macro")
}

@Test
func testPackageHeader04() {
    let toks = quote(package ORGA::pkgA.pkgB.p)
    let packageHeader = parseProgram(toks).packageHeader
    packageHeader.dump()
    @Assert(packageHeader.keywordP.value, "package")
    @Assert(packageHeader.prefixPaths.toString(), "pkgA pkgB")
    @Assert(packageHeader.prefixDots.toString(), "..")
    @Assert(packageHeader.packageIdentifier.value, "p")
    @Assert(packageHeader.orgName.value, "ORGA")
    @Assert(packageHeader.orgSeparator.value, "::")
    @Assert(packageHeader.keywordM.value, "")
}

@Test
func testPackageHeader05() {
    let toks = quote(package p)
    let packageHeader = parseProgram(toks).packageHeader
    packageHeader.dump()
    @Assert(packageHeader.keywordP.value, "package")
    @Assert(packageHeader.prefixPaths.toString(), "")
    @Assert(packageHeader.prefixDots.toString(), "")
    @Assert(packageHeader.packageIdentifier.value, "p")
    @Assert(packageHeader.orgName.value, "")
    @Assert(packageHeader.orgSeparator.value, "")
    @Assert(packageHeader.keywordM.value, "")
}