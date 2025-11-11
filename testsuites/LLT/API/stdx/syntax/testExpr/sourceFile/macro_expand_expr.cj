func test(): Unit {
    @testMacro[public func](let a = 1)
    @macroPackage.testMacro(1)
    @M1 @M2(foo())
    @M1[a: T, b: U](a = b)
    @M1(if (a) {b} else {c})
    @pkg1.pkg2.M1[aaaaaa](
        a ** b
    )
}