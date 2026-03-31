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
simple sub has base: true
chain leaf has mid: true
chain leaf has root: true
chain leaf has IF0 via root: true
chain leaf has IF1 on leaf: true
chain leaf has IF2 via extend: false
*/

import stdx.chir.*

func containsClassLike(haystack: Array<ClassLikeType>, needle: ClassLikeType): Bool {
    for (x in haystack) {
        if (x == needle) {
            return true
        }
    }
    return false
}

main() {
    let pkg = Package("pkg.class.sups", AccessLevel.Public)

    // ----- 1) 单继承：Sub <: Base -----
    let base = pkg.addClass("Base", "Base", true)
    let sub = pkg.addClass("Sub", "Sub", true)
    sub.superClass = Some(base.classType)
    let subSups = sub.getSuperTypesRecusively()
    println("simple sub has base: ${containsClassLike(subSups, base.classType)}")

    // ----- 2) 链式父类 + 接口 + extend 追加接口 -----
    // IF0、IF1、IF2 为接口；Root <: 实现 IF0；Mid <: Root；Leaf <: Mid 且声明实现 IF1；
    // 再在 Leaf 上挂 extend（extendedType == Leaf），在 extend 上实现 IF2。
    let if0 = pkg.addClass("IF0", "IF0", false)
    let if1 = pkg.addClass("IF1", "IF1", false)
    let if2 = pkg.addClass("IF2", "IF2", false)

    let root = pkg.addClass("Root", "Root", true)
    root.implementedInterfaceTypes = [if0.classType]

    let mid = pkg.addClass("Mid", "Mid", true)
    mid.superClass = Some(root.classType)

    let leaf = pkg.addClass("Leaf", "Leaf", true)
    leaf.superClass = Some(mid.classType)
    leaf.implementedInterfaceTypes = [if1.classType]

    let extOnLeaf = pkg.addExtend("extLeaf", leaf.ty)
    extOnLeaf.implementedInterfaceTypes = [if2.classType]
    leaf.extends = [extOnLeaf]

    let leafSups = leaf.getSuperTypesRecusively()

    println("chain leaf has mid: ${containsClassLike(leafSups, mid.classType)}")
    println("chain leaf has root: ${containsClassLike(leafSups, root.classType)}")
    println("chain leaf has IF0 via root: ${containsClassLike(leafSups, if0.classType)}")
    println("chain leaf has IF1 on leaf: ${containsClassLike(leafSups, if1.classType)}")
    println("chain leaf has IF2 via extend: ${containsClassLike(leafSups, if2.classType)}")
}
