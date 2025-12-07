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
// (not MAC) ASSERT: scan IllegalTypeException: The input instance should be "default.C2", but now it`s "Int64"
// 如果传入的实例 `instance` 的运行时类型与该实例成员属性信息所对应的实例成员属性所属的类型不严格相同，则会抛出 `IllegalTypeException` 异常。
// 传入的实例是基础数据类型。

import std.reflect.*

public open class C2 {
    public mut prop p: Int64 {
        get() {
            12
        }
        set(v) {}
    }
}

main(): Unit {
    (TypeInfo.of<C2>().getInstanceProperty("p").getValue(1) as Int64).getOrThrow() |> println
}
