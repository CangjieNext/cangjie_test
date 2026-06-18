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

// Imported class/enum/struct/extend defs serialize round-trip

main() {
    let pkgName = "pkg.ser53"
    let pkg = Package(pkgName, AccessLevel.Public)
    let i32 = IntType.getInt32()

    pkg.addImportedStruct("symStr", "String", "std.core")
    pkg.addImportedClass("symObj", "Object", "std.core", true)
    pkg.addImportedEnum("symOpt", "Option", "std.core", true)
    let strTy = pkg.getSpecifiedStructDef("std.core", "String").getOrThrow().structType
    pkg.addImportedExtend("symExtStr", "std.core", strTy)

    let fn = pkg.addFunction(FuncType.get([strTy, i32], UnitType.get()), "useImported", "useImported", pkgName)
    fn.initBody()
    fn.body.getOrThrow().entryBlock.appendExpr(Exit.create())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
