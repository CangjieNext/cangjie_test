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