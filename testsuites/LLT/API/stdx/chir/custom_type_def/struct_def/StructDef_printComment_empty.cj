/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// StructDef.printComment：super 为空时走 "// isCStruct: ..." 分支

/* SCAN
empty pkg comment: true
empty pkg has isCStruct: true
empty pkg no packageName: true
empty pkg no srcCodeName: true
*/

import stdx.chir.*

main() {
    // packageName / srcCodeName 皆空 -> CustomTypeDef.printComment 为空
    let emptyPkg = Package("", AccessLevel.Public)
    let st = emptyPkg.addStruct("bareSt", "")
    let s = st.toString()
    println("empty pkg comment: ${s.contains("// isCStruct:")}")
    println("empty pkg has isCStruct: ${s.contains("isCStruct: false")}")
    println("empty pkg no packageName: ${!s.contains("packageName:")}")
    println("empty pkg no srcCodeName: ${!s.contains("srcCodeName:")}")
}
