/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// ExtendDef.printComment：super 为空时走 "// id: ..." 分支

/* SCAN
empty pkg comment: true
empty pkg has id: true
empty pkg no packageName: true
*/

import stdx.chir.*

main() {
    // packageName / srcCodeName 皆空 -> CustomTypeDef.printComment 为空，触发 ExtendDef "// " + id
    let emptyPkg = Package("", AccessLevel.Public)
    let ext = emptyPkg.addExtend("bareExt", IntType.getInt32())
    let s = ext.toString()
    println("empty pkg comment: ${s.contains("// id:")}")
    println("empty pkg has id: ${s.contains("id: @bareExt") || s.contains("id: bareExt")}")
    println("empty pkg no packageName: ${!s.contains("packageName:")}")
}
