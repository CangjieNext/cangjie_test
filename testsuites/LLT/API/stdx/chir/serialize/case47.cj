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

// package 只含一个 EnumDef 的序列化与反序列化

main() {
    let pkg = Package("pkg.en", AccessLevel.Public)
    let i32 = IntType.getInt32()

    let en = pkg.addEnum("mDirection", "Direction", false)
    en.appendEnumCtorInfo("mDirection.North", "North", argTypes: Array<Type>())
    en.appendEnumCtorInfo("mDirection.South", "South", argTypes: Array<Type>())
    en.appendEnumCtorInfo("mDirection.East",  "East",  argTypes: Array<Type>())
    en.appendEnumCtorInfo("mDirection.West",  "West",  argTypes: Array<Type>())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
