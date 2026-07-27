/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Apply：多候选父接口实例化 + builtin extend 成员的 getInstParent*

/* SCAN
multi parent: true
builtin extend: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()
    let bl = BoolType.get()
    let pkg = Package("pkg.ap.parent", AccessLevel.Public)
    let gT = GenericType.get("pkg.ap.parent.T", "T")

    // interface A<T> { func id(a: T): T } —— 实例方法 FuncType 不含 this，args 首元为 this
    let iface = pkg.addClass("A", "A", false, genericTypeParams: [gT])
    let idf = pkg.addFunction(FuncType.get([gT], gT), "A.id", "id", "pkg.ap.parent")
    iface.appendMethod(idf)

    // class B <: A<Bool> & A<Int64>
    let b = pkg.addClass("B", "B", true)
    b.implementedInterfaceTypes = [
        ClassLikeType.get(iface, [bl]),
        ClassLikeType.get(iface, [i64])
    ]

    let host = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "host", "host", "pkg.ap.parent")
    host.initBody()
    let bb = host.body.getOrThrow().entryBlock

    let thisAlloc = Allocate.create(b.classType)
    bb.appendExpr(thisAlloc)
    let arg64 = Constant.create(IntLiteral.get(i64, 7u64))
    bb.appendExpr(arg64)
    let ap = Apply.create(idf, FuncCallContext([thisAlloc.result, arg64.result], Array<Type>(), Some(thisAlloc.result.ty)))
    bb.appendExpr(ap)
    println("multi parent: ${ap.result.ty == i64}")

    // extend Int32 { func wrap<U>(): U }
    let gU = GenericType.get("pkg.ap.parent.U", "U")
    let ext = pkg.addExtend("extI32", i32)
    let wrap = pkg.addFunction(FuncType.get([i32], gU), "extI32.wrap", "wrap", "pkg.ap.parent")
    wrap.genericTypeParams = [gU]
    ext.appendMethod(wrap)
    let apB = Apply.create(wrap, FuncCallContext(Array<Value>(), [bl], Some(i32)))
    bb.appendExpr(apB)
    println("builtin extend: ${apB.result.ty == bl}")
}
