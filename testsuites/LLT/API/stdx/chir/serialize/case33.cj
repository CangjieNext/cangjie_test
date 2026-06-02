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

// ClassDef 成员变量带 Annotation

main() {
    let pkg = Package("pkg.td10", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()

    let cls = pkg.addClass("mUser", "User", true)

    let vId = cls.appendInstanceMemberVar("id", i64)
    let anno1 = Annotation("NotNull")
    anno1.argValues = ["true"]
    vId.annotations = [anno1]

    let vName = cls.appendInstanceMemberVar("name", i32)
    let anno2 = Annotation("Column")
    anno2.argValues = ["user_name", "varchar(64)"]
    vName.annotations = [anno2]

    // 成员函数
    let mf = pkg.addFunction(FuncType.get(Array<Type>(), i64), "mUser.getId", "getId", "pkg.td10")
    mf.initBody()
    mf.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    cls.appendMethod(mf)

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
