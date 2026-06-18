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
class public: true
class after private: true
class protected: true
[protected][pluginAdded]class @mC { // srcCodeName: C, packageName: pkg.class.vis
}
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.class.vis", AccessLevel.Public)
    let cls = pkg.addClass("mC", "C", true)
    cls.setPublic()
    println("class public: ${cls.isPublic()}")
    cls.setPrivate()
    println("class after private: ${cls.isPrivate()}")

    cls.setProtected()
    println("class protected: ${cls.isProtected()}")
    cls.dump()
}
