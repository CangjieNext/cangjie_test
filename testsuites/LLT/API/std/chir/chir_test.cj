/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

// import std.unittest.*
// import std.unittest.testmacro.*
import std.chir.*

// @Test
public class PackageTest {
    // @Test
    public func testToString() {
        let pkg = Package("testpkg")
        let gv = GlobalVar("gvar1", PrimitiveType(TypeKind.`Int64`))
        pkg.gvs.add(gv)
        gv.initializer = Some(ConstantExpr(IntLiteral("lit1", PrimitiveType(TypeKind.`Int64`), 42)))
        let gv2 = GlobalVar("gvar2", PrimitiveType(TypeKind.`UInt8`))
        pkg.gvs.add(gv2)
        gv2.initializer = Some(ConstantExpr(IntLiteral("lit2", PrimitiveType(TypeKind.`UInt8`), 255)))

        let s = pkg.toString()
        println(s)
    }
}

main() {
    let test = PackageTest()
    test.testToString()
}