/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Value / Function / GlobalVar leftover public APIs

/* SCAN
[pluginAdded]Func @host(
  [readOnly][pluginAdded]%0: Int32
): Unit // srcCodeName: host, packageName: pkg.val.rem
[pluginAdded]{ // Block Group: 0
[pluginAdded]Block #0:
}
[pluginAdded]Block #0:
id prefixes: true
predicates: true
access flags: true
member src: true
gv imported init: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let unit = UnitType.get()
    let pkg = Package("pkg.val.rem", AccessLevel.Public)

    let fn = pkg.addFunction(FuncType.get([i32], unit), "host", "host", "pkg.val.rem")
    fn.initBody()
    let bg = fn.body.getOrThrow()
    let bb = bg.entryBlock
    let p0 = fn.parameters[0]

    fn.identifier = fn.identifier
    let idFn = fn.identifierWithoutPrefix
    let idBlk = bb.identifierWithoutPrefix
    let idP = p0.identifierWithoutPrefix
    fn.dump()
    bb.dump()
    println(
        "id prefixes: ${idFn == "host" && !idBlk.contains("#") && !idP.contains("%") && fn.hashCode() == fn.hashCode()}"
    )

    let gv = pkg.addGlobalVar(i32, "g", "g", "pkg.val.rem")
    println(
        "predicates: ${bb.isBlock() && bg.isBlockGroup() && fn.isFunction() && gv.isGlobalVar() && p0.isParameter() && IntLiteral.get(i32, 1u64).isLiteral()}"
    )

    fn.setInternal()
    let intern = fn.isInternal()
    fn.setPrivate()
    let priv = fn.isPrivate()
    fn.setProtected()
    let prot = fn.isProtected()
    fn.setPublic()
    fn.setImported(true)
    let srcImpFn = fn.isSrcCodeImported()
    fn.setImported(false)
    let feats = fn.features.size
    println("access flags: ${intern && priv && prot && fn.isPublic() && srcImpFn && feats == 0}")

    let gT = GenericType.get("${pkg.name}.T", "T")
    let genCls = pkg.addClass("Box", "Box", true, genericTypeParams: [gT])
    let inst = pkg.addFunction(FuncType.get([genCls.classType, i32], i32), "Box.get", "get", pkg.name)
    inst.initBody()
    inst.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    genCls.appendMethod(inst)
    let srcTy = inst.funcSrcCodeType
    let parentGen = inst.selfOrParentIsGeneric()
    let outer = inst.outerType
    let instMem = inst.isInstanceMemberMethod() && !inst.isStaticMemberMethod()

    let st = pkg.addFunction(FuncType.get([genCls.classType], unit), "Box.s", "s", pkg.name)
    st.initBody()
    st.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    st.setStatic(true)
    genCls.appendMethod(st)
    let staticMem = st.isStaticMemberMethod()

    inst.genericTypeParams = Array<GenericType>()
    inst.genericTypeParams = [gT]
    let a0 = Allocate.create(i32)
    inst.body.getOrThrow().entryBlock.insertExpr(a0, 0)
    inst.returnValue = a0.result
    let a1 = Allocate.create(i32)
    inst.body.getOrThrow().entryBlock.insertExpr(a1, 1)
    inst.returnValue = a1.result
    println(
        "member src: ${srcTy.paramTypes.size == 1 && parentGen && outer.isSome() && instMem && staticMem && inst.returnValue == a1.result}"
    )

    gv.setImported(true)
    gv.setInitializer(IntLiteral.get(i32, 3u64))
    let gvSrc = gv.isSrcCodeImported()
    gv.setReadOnly(true)
    let gvDump = gv.toString()
    let noneOuter = fn.outerType.isNone()
    println("gv imported init: ${gvSrc && gvDump.contains("let ") && noneOuter}")
}
