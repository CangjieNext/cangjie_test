/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %cmp_opt %f -o %output
// (!(target_mac | target_ios | target_ios_simulator)) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (!(target_mac | target_ios | target_ios_simulator)) ASSERT: scan IllegalSetException: Attempt to modify immutable property 'p'
// 如果该实例成员属性信息所对应的实例成员属性不可修改，则会抛出 `IllegalSetException` 异常。

import std.reflect.*

public open class C2 {
    public prop p: Int64 {
        get() {
            12
        }
    }
}

main(): Unit {
    let c = C2()
    TypeInfo.of<C2>().getInstanceProperty("p").setValue(c, 12)
}
