/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f

/* SCAN
extend hash stable: true
extend hash eq id hash: true
ext ext2 hash differ: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.extend.hash", AccessLevel.Public)
    let intTy = IntType.getInt32()
    let ext = pkg.addExtend("mExtI32", intTy)
    let ext2 = pkg.addExtend("mExtI64", IntType.getInt64())

    println("extend hash stable: ${ext.hashCode() == ext.hashCode()}")
    println("extend hash eq id hash: ${ext.hashCode() == ext.identifier.hashCode()}")
    println("ext ext2 hash differ: ${ext.hashCode() != ext2.hashCode()}")
}
