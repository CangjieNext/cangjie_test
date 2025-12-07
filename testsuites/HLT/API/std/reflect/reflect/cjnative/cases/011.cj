/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output
// (not MAC) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (not MAC) ASSERT: scan InvocationTargetException: The abstract function cannot be applied.
// - 如果该实例成员函数信息所对应的实例成员函数是抽象的，则会抛出 `InvocationTargetException` 异常。

import std.reflect.*

public abstract class C2 {
    public func f(): Unit
}

main(): Unit {
    TypeInfo.of<C2>().getInstanceFunction("f").apply(1)
}
