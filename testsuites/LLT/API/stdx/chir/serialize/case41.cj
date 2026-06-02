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

// ClassDef + StructDef + EnumDef 各自带 Annotation，EnumCtorInfo 带 Annotation

main() {
    let pkg = Package("pkg.td18", AccessLevel.Public)
    let i32 = IntType.getInt32()

    // ClassDef 带 Annotation
    let cls = pkg.addClass("mOrder", "Order", true)
    let annoTable = Annotation("Table")
    annoTable.argValues = ["t_order"]
    cls.annotations = [annoTable]
    cls.appendInstanceMemberVar("orderId", i32)

    let mfCls = pkg.addFunction(FuncType.get(Array<Type>(), i32), "mOrder.getId", "getId", "pkg.td18")
    mfCls.initBody()
    mfCls.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    cls.appendMethod(mfCls)

    // StructDef 带 Annotation
    let st = pkg.addStruct("mCoord", "Coord")
    let annoStruct = Annotation("ValueType")
    st.annotations = [annoStruct]
    st.appendInstanceMemberVar("x", i32)
    st.appendInstanceMemberVar("y", i32)

    // EnumDef 带 Annotation，构造器也带 Annotation
    let en = pkg.addEnum("mStatus", "Status", true)
    let annoEnum = Annotation("Sealed")
    en.annotations = [annoEnum]
    let ctorActive = en.appendEnumCtorInfo("mStatus.Active", "Active", argTypes: Array<Type>())
    let annoActive = Annotation("Default")
    ctorActive.annotations = [annoActive]
    let ctorInactive = en.appendEnumCtorInfo("mStatus.Inactive", "Inactive", argTypes: Array<Type>())
    let annoInactive = Annotation("Deprecated")
    annoInactive.argValues = ["use Archived"]
    ctorInactive.annotations = [annoInactive]

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
