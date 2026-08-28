/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args
// public API：CustomTypeDef.genericDecl serialize round-trip

import stdx.chir.*

main() {
    let pkgName = "pkg.ser56.pub"
    let pkg = Package(pkgName, AccessLevel.Public)
    let gT = GenericType.get("${pkgName}.T", "T")
    let genParams = Array<GenericType>(1, { _ => gT })
    let genCls = pkg.addClass("Box", "Box", true, genericTypeParams: genParams)
    let mono = pkg.addClass("Box_i32", "Box", true)
    mono.genericDecl = Some(genCls)

    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
