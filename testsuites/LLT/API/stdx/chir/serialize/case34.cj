/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args

import std.collection.*
import stdx.chir.*

// EnumDef 构造器带 CustomAnnoInstance

main() {
    let pkg = Package("pkg.td11", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let str = IntType.getInt64()

    let en = pkg.addEnum("mShape", "Shape", true)
    let ctorCircle = en.appendEnumCtorInfo("mShape.Circle", "Circle", argTypes: [i32])
    let anno1 = CustomAnnoInstance("Deprecated")
    anno1.argValues = ["use Ellipse instead"]
    ctorCircle.customAnnoInstances = [anno1]

    let ctorRect = en.appendEnumCtorInfo("mShape.Rect", "Rect", argTypes: [i32, i32])
    let anno2 = CustomAnnoInstance("Tag")
    anno2.argValues = ["rectangle"]
    ctorRect.customAnnoInstances = [anno2]

    en.appendEnumCtorInfo("mShape.Point", "Point", argTypes: Array<Type>())

    let mf = pkg.addFunction(FuncType.get(Array<Type>(), BoolType.get()), "mShape.isPoint", "isPoint", "pkg.td11")
    mf.initBody()
    mf.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    en.appendMethod(mf)

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
