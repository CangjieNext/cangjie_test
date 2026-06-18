/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args

import stdx.chir.*

// Float/Rune/String/Null/Bool/Int/Unit literal global vars and constants

main() {
    let pkgName = "pkg.ser50"
    let pkg = Package(pkgName, AccessLevel.Public)
    let i32 = IntType.getInt32()
    let f64 = FloatType.getFloat64()
    let runeTy = RuneType.get()
    let boolTy = BoolType.get()

    let gvF = pkg.addGlobalVar(f64, "gvF", "gvF", pkgName)
    gvF.setInitializer(FloatLiteral.get(f64, 2.5))

    let gvR = pkg.addGlobalVar(runeTy, "gvR", "gvR", pkgName)
    gvR.setInitializer(RuneLiteral.get(Rune(88)))

    pkg.addImportedStruct("symStr", "String", "std.core")
    let strTy = pkg.getSpecifiedStructDef("std.core", "String").getOrThrow().structType
    let gvS = pkg.addGlobalVar(strTy, "gvS", "gvS", pkgName)
    gvS.setInitializer(StringLiteral.get(strTy, "ser50"))

    let gvN = pkg.addGlobalVar(i32, "gvN", "gvN", pkgName)
    gvN.setInitializer(NullLiteral.get(i32))

    let gvI = pkg.addGlobalVar(i32, "gvI", "gvI", pkgName)
    gvI.setInitializer(IntLiteral.get(i32, 7u64))

    let gvB = pkg.addGlobalVar(boolTy, "gvB", "gvB", pkgName)
    gvB.setInitializer(BoolLiteral.get(true))

    let gvU = pkg.addGlobalVar(UnitType.get(), "gvU", "gvU", pkgName)
    gvU.setInitializer(UnitLiteral.get())

    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "fn", "fn", pkgName)
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    bb.appendExpr(Constant.create(FloatLiteral.get(f64, 1.0)))
    bb.appendExpr(Constant.create(RuneLiteral.get(Rune(65))))
    bb.appendExpr(Constant.create(StringLiteral.get(strTy, "body")))
    bb.appendExpr(Constant.create(NullLiteral.get(i32)))
    bb.appendExpr(Exit.create())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
