/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Apply：泛型返回类型 + 成员/父类/extend/lambda 的 getInstType 路径

/* SCAN
inherit parent: true
member ret: true
implicit this: true
extend method: true
lambda ret: true
size mismatch: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let bl = BoolType.get()
    let pkg = Package("pkg.ap.inst", AccessLevel.Public)
    let gT = GenericType.get("pkg.ap.inst.T", "T")
    let gU = GenericType.get("pkg.ap.inst.U", "U")

    let iface = pkg.addClass("Iface", "Iface", false, genericTypeParams: [gT])
    let base = pkg.addClass("Base", "Base", true, genericTypeParams: [gT])
    base.implementedInterfaceTypes = [ClassLikeType.get(iface, [gT])]
    let getBase = pkg.addFunction(FuncType.get([base.classType], gT), "Base.get", "get", "pkg.ap.inst")
    base.appendMethod(getBase)

    let sub = pkg.addClass("Sub", "Sub", true, genericTypeParams: [gT])
    sub.superClass = Some(ClassLikeType.get(base, [gT]))

    let host = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "host", "host", "pkg.ap.inst")
    host.initBody()
    let bb = host.body.getOrThrow().entryBlock

    let subMono = ClassLikeType.get(sub, [i32])
    let thisAlloc = Allocate.create(subMono)
    bb.appendExpr(thisAlloc)

    // 子类对象调父类成员：getInstParentCustomTypeOfCallee 走继承匹配
    let apInherit = Apply.create(getBase, FuncCallContext(Array<Value>(), Array<Type>(), Some(thisAlloc.result.ty)))
    bb.appendExpr(apInherit)
    println("inherit parent: ${apInherit.result.ty == i32}")

    // 同类型 objType
    let box = pkg.addClass("Box", "Box", true, genericTypeParams: [gT])
    let getBox = pkg.addFunction(FuncType.get([box.classType], gT), "Box.get", "get", "pkg.ap.inst")
    box.appendMethod(getBox)
    let boxMono = ClassLikeType.get(box, [bl])
    let boxAlloc = Allocate.create(boxMono)
    bb.appendExpr(boxAlloc)
    let apMember = Apply.create(getBox, FuncCallContext(Array<Value>(), Array<Type>(), Some(boxAlloc.result.ty)))
    bb.appendExpr(apMember)
    println("member ret: ${apMember.result.ty == bl}")

    // 无 objType：implicit this → parentDef.ty
    let apImplicit = Apply.create(getBox, FuncCallContext(Array<Value>(), Array<Type>(), None))
    bb.appendExpr(apImplicit)
    println("implicit this: ${apImplicit.result.ty == gT}")

    // extend 上声明的方法 + objType
    let ext = pkg.addExtend("extBox", box.classType, genericTypeParams: [gT])
    let getExt = pkg.addFunction(FuncType.get([box.classType], gT), "extBox.getE", "getE", "pkg.ap.inst")
    ext.appendMethod(getExt)
    box.extends = [ext]
    let apExt = Apply.create(getExt, FuncCallContext(Array<Value>(), Array<Type>(), Some(boxAlloc.result.ty)))
    bb.appendExpr(apExt)
    println("extend method: ${apExt.result.ty == bl}")

    // Lambda 作为 callee：LocalVar 分支
    let gens = ArrayList<GenericType>()
    gens.add(gU)
    let lam = Lambda.create(FuncType.get(Array<Type>(), gU), "Lam", "Lam", gens)
    bb.appendExpr(lam)
    lam.initParameters()
    lam.initBody()
    lam.body.entryBlock.appendExpr(Exit.create())
    let apLam = Apply.create(lam.result, FuncCallContext(Array<Value>(), [i32], None))
    bb.appendExpr(apLam)
    println("lambda ret: ${apLam.result.ty == i32}")

    var mismatch = false
    try {
        let bad = pkg.addFunction(FuncType.get(Array<Type>(), gT), "bad", "bad", "pkg.ap.inst")
        bad.genericTypeParams = [gT]
        let _ = Apply.create(bad, FuncCallContext(Array<Value>(), [i32, bl], None))
    } catch (e: Exception) {
        mismatch = true
    }
    println("size mismatch: ${mismatch}")
}
