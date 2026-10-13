// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
// See https://cangjie-lang.cn/pages/LICENSE for license information.
//
// (CJNATIVE and Linux)EXEC-0: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan move-body-ownership: PASS
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.chir.*

private func require(value: Bool): Unit {
    if (!value) { throw Exception("move body ownership assertion failed") }
}

main() {
    let pkg = Package("ownership", AccessLevel.Public)
    let ty = FuncType.get([IntType.getInt64()], IntType.getInt64())
    let source = pkg.addFunction(ty, "source", "source", "ownership")
    let helper = pkg.addFunction(ty, "helper", "", "ownership")
    source.initBody()
    let builder = CHIRBuilder(source.body.getOrThrow().entryBlock)
    let slot = builder.createAllocate(IntType.getInt64())
    source.returnValue = slot.result
    builder.createStore(source.parameters[0], slot.result)
    builder.createExit()
    let oldParameter = source.parameters[0]
    source.moveBodyTo(helper)
    require(source.body.isNone() && source.parameters.isEmpty())
    require(helper.parameters.size == 1 && helper.parameters[0] == oldParameter)
    require(helper.body.getOrThrow().owner == helper && oldParameter.topLevelFunc == helper)
    require(helper.returnValue.getOrThrow().topLevelFunc == helper)
    source.initBody()
    require(source.parameters.size == 1 && source.parameters[0] != oldParameter)
    require(source.parameters[0].topLevelFunc == source)
    helper.moveBodyTo(helper)
    require(helper.body.isSome() && helper.parameters.size == 1)
    let (data, length) = serializePackage(pkg)
    let restored = deserializePackage(data, length)
    require(restored.functions[1].parameters.size == 1)
    require(restored.functions[1].body.getOrThrow().owner == restored.functions[1])
    unsafe { freeSerializedMemory() }
    println("move-body-ownership: PASS")
    0
}
