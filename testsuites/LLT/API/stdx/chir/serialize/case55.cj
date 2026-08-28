/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args
// public API：Intrinsic(inout)/TryIntrinsic、CPointer/This、landing-pad exceptions、Apply.objType

import stdx.chir.*

main() {
    let pkgName = "pkg.ser55.pub"
    let pkg = Package(pkgName, AccessLevel.Public)
    let i32 = IntType.getInt32()
    let unit = UnitType.get()
    let cp = CPointerType.get(i32)
    let th = ThisType.get()
    let cls = pkg.addClass("C", "C", true)

    // CPointer / This in signature + struct/enum for getDefIdList
    pkg.addStruct("S", "S")
    pkg.addEnum("E", "E", true)

    let fn = pkg.addFunction(FuncType.get([cp, th, i32], unit), "pubSer", "pubSer", pkgName)
    fn.initBody()
    let bg = fn.body.getOrThrow()
    let entry = bg.entryBlock
    let bn = bg.appendBlock()
    let be = bg.appendBlock()
    let land = bg.appendBlock()
    land.exceptions = [cls.classType]

    let b = CHIRBuilder(entry)
    let alloc = b.createAllocate(i32)
    b.createInout(RefType.get(i32), alloc.result)

    let callee = pkg.addFunction(FuncType.get([i32], unit), "callee", "callee", pkgName)
    let arg = b.createConstant(IntLiteral.get(i32, 1u64))
    b.createApply(callee, FuncCallContext([arg.result], Array<Type>(), Some(cls.classType)))
    // terminator: try-inout → normal/error; then goto landing pad from normal
    b.createTryInout(RefType.get(i32), alloc.result, bn, be)

    let bnB = CHIRBuilder(bn)
    bnB.createGoTo(land)
    be.appendExpr(Exit.create())
    land.appendExpr(Exit.create())

    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
