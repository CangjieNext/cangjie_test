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

// Package Internal / Protected access level serialize round-trip

func roundTrip(pkg: Package): Bool {
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    return pkg.accessLevel == pkg2.accessLevel && pkg.toString() == pkg2.toString()
}

main() {
    let i32 = IntType.getInt32()

    let pkgI = Package("pkg.ser49i", AccessLevel.Internal)
    pkgI.addGlobalVar(i32, "gi", "gi", "pkg.ser49i")
    if (!roundTrip(pkgI)) {
        return 1
    }

    let pkgP = Package("pkg.ser49p", AccessLevel.Protected)
    pkgP.addGlobalVar(i32, "gp", "gp", "pkg.ser49p")
    if (!roundTrip(pkgP)) {
        return 1
    }

    return 0
}
