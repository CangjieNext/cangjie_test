/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Cover CustomTypeDef.printComment empty arms, CustomDefKind.toString ClassLike/Extend,
// genericDecl=None, getSuperTypes without superClass, and defIsExpected via isAnyTypeInStd.

/* SCAN
empty comment no slash: true
pkg empty src kept: true
genericDecl cleared: true
sups without super: true
any type in std: true
not any type: true
extend str has extend: true
class str has class: true
*/

import stdx.chir.*

main() {
    // printComment -> String.empty (no srcCodeName / packageName / loc / genericDecl)
    let emptyPkg = Package("", AccessLevel.Public)
    let bare = emptyPkg.addClass("bare", "", true)
    println("empty comment no slash: ${!bare.toString().contains("//")}")

    let pkg = Package("pkg.ctd.comment", AccessLevel.Public)
    let cls = pkg.addClass("Cls", "Cls", true)

    // empty packageName branch while srcCodeName is kept
    let onlySrc = emptyPkg.addClass("OnlySrc", "OnlySrc", true)
    println("pkg empty src kept: ${onlySrc.toString().contains("srcCodeName: OnlySrc") && !onlySrc.toString().contains("packageName:")}")

    // genericDecl setter None arm
    let g = GenericType.get("T", "T")
    let gen = pkg.addClass("Gen", "Gen", true, genericTypeParams: [g])
    let inst = pkg.addClass("GenI", "Gen", true)
    inst.genericDecl = Some(gen)
    inst.genericDecl = None
    println("genericDecl cleared: ${inst.genericDecl.isNone()}")

    // getSuperTypesRecusively without superClass (ClassLike + interfaces only)
    let iface = pkg.addClass("IF", "IF", false)
    let noSuper = pkg.addClass("NoSuper", "NoSuper", true)
    noSuper.implementedInterfaceTypes = [iface.classType]
    let sups = noSuper.getSuperTypesRecusively()
    println("sups without super: ${sups.size == 1 && sups[0] == iface.classType}")

    // defIsExpected both sides of &&
    let anyDef = pkg.addImportedClass("Any", "Any", "std.core", false)
    println("any type in std: ${anyDef.classType.isAnyTypeInStd()}")
    println("not any type: ${!cls.classType.isAnyTypeInStd()}")

    // CustomDefKind.toString ClassLike (via class printTitle) and Extend (via extend printTitle)
    let ext = pkg.addExtend("extI32", IntType.getInt32())
    println("extend str has extend: ${ext.toString().contains("extend")}")
    println("class str has class: ${cls.toString().contains("class")}")
}
