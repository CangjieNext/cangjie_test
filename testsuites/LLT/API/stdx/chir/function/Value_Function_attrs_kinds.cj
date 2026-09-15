/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Function/Block public attribute predicates, setters, and constructor kinds.

/* SCAN
default: false false false false true
all enabled: true true true true true
clear override: false true true true true
clear final: false false true true true
clear noInline: false false false true true
all cleared: false false false false true
function default: false false false
blocks default: false false
constructor: false false false
moved blocks: false false
default: false false false
class: true false false true
primary class: true false false true
struct: false true false true
primary struct: false true false true
class again: true false false true
*/

import stdx.chir.*

main() {
    testAttributeSetters()
    testAttributePredicates()
    testConstructorKinds()
}

func printFlags(label: String, fn: Function) {
    let text = fn.toString()
    println("${label}: ${text.contains("[override]")} ${text.contains("[final]")} ${text.contains("[noInline]")} ${text.contains("[skip_analysis]")} ${fn.isOpen()}")
}

func testAttributeSetters() {
    let pkg = Package("pkg.flags", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "flags", "flags", pkg.name)
    fn.setOpen(true)
    printFlags("default", fn)
    fn.setOverride(true)
    fn.setFinal(true)
    fn.setNoInline(true)
    fn.setSkipAnalysis(true)
    printFlags("all enabled", fn)
    fn.setOverride(false)
    printFlags("clear override", fn)
    fn.setFinal(false)
    printFlags("clear final", fn)
    fn.setNoInline(false)
    printFlags("clear noInline", fn)
    fn.setSkipAnalysis(false)
    printFlags("all cleared", fn)
}

func testAttributePredicates() {
    let pkg = Package("pkg.predicates", AccessLevel.Public)
    let ty = FuncType.get(Array<Type>(), UnitType.get())
    let fn = pkg.addFunction(ty, "source", "source", pkg.name)
    let target = pkg.addFunction(ty, "target", "target", pkg.name)
    fn.initBody()
    let bg = fn.body.getOrThrow()
    let extra = bg.appendBlock()
    println("function default: ${fn.isMut()} ${fn.isInitializer()} ${fn.isAnnoFactoryFunc()}")
    println("blocks default: ${bg.entryBlock.isInitializer()} ${extra.isInitializer()}")
    fn.setClassConstructor(true)
    fn.setOverride(true)
    fn.setFinal(true)
    fn.setNoInline(true)
    fn.setSkipAnalysis(true)
    println("constructor: ${fn.isMut()} ${fn.isInitializer()} ${fn.isAnnoFactoryFunc()}")
    fn.moveBodyTo(target)
    println("moved blocks: ${target.body.getOrThrow().entryBlock.isInitializer()} ${extra.isInitializer()}")
}

func printKind(label: String, fn: Function, kind: String) {
    println("${label}: ${fn.isClassConstructor()} ${fn.isStructConstructor()} ${fn.isAnnoFactoryFunc()} ${fn.toString().contains("funcKind: " + kind)}")
}

func testConstructorKinds() {
    let pkg = Package("pkg.kinds", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "ctor", "ctor", pkg.name)
    println("default: ${fn.isClassConstructor()} ${fn.isStructConstructor()} ${fn.isAnnoFactoryFunc()}")
    fn.setClassConstructor(false)
    printKind("class", fn, "ClassConstructor")
    fn.setClassConstructor(true)
    printKind("primary class", fn, "PrimaryClassConstructor")
    fn.setStructConstructor(false)
    printKind("struct", fn, "StructConstructor")
    fn.setStructConstructor(true)
    printKind("primary struct", fn, "PrimaryStructConstructor")
    fn.setClassConstructor(false)
    printKind("class again", fn, "ClassConstructor")
}
