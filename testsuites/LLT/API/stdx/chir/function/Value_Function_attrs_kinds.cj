/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Function public attribute predicates, setters, and constructor kinds.

/* SCAN
default: false false false false true
all enabled: true true true true true
clear override: false true true true true
clear final: false false true true true
clear noInline: false false false true true
all cleared: false false false false true
function default: false false false
constructor default flags: false false false false false
constructor enabled flags: true true true true false
constructor: false false false
default: false false false
class: true false false true
struct: false true false true
class again: true false false true
*/

import stdx.chir.*

main() {
    testFuncAttributePredicates()
    testCtorAttributePredicates()
    testConstructorKinds()
}

func printFlags(label: String, fn: Function) {
    println("${label}: ${fn.isOverride()} ${fn.isFinal()} ${fn.isNoInline()} ${fn.isSkipAnalysis()} ${fn.isOpen()}")
}

func testFuncAttributePredicates() {
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

func testCtorAttributePredicates() {
    let pkg = Package("pkg.ctor.flags", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "ctor", "ctor", pkg.name)
    println("function default: ${fn.isMut()} ${fn.isInitializer()} ${fn.isAnnoFactoryFunc()}")
    fn.setClassConstructor()
    printFlags("constructor default flags", fn)
    fn.setOverride(true)
    fn.setFinal(true)
    fn.setNoInline(true)
    fn.setSkipAnalysis(true)
    printFlags("constructor enabled flags", fn)
    println("constructor: ${fn.isMut()} ${fn.isInitializer()} ${fn.isAnnoFactoryFunc()}")
}

func printKind(label: String, fn: Function, kind: String) {
    println("${label}: ${fn.isClassConstructor()} ${fn.isStructConstructor()} ${fn.isAnnoFactoryFunc()} ${fn.toString().contains("funcKind: " + kind)}")
}

func testConstructorKinds() {
    let pkg = Package("pkg.kinds", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "ctor", "ctor", pkg.name)
    println("default: ${fn.isClassConstructor()} ${fn.isStructConstructor()} ${fn.isAnnoFactoryFunc()}")
    fn.setClassConstructor()
    printKind("class", fn, "ClassConstructor")
    fn.setStructConstructor()
    printKind("struct", fn, "StructConstructor")
    fn.setClassConstructor()
    printKind("class again", fn, "ClassConstructor")
}
