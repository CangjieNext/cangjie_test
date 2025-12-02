/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// (OHOS) ASSERT: scan os == Linux
// (OHOS) ASSERT: scan-not env != ohos
// (OHOS) ASSERT: scan env == ohos
// (not OHOS) ASSERT: scan-not os == Linux
// (not OHOS) ASSERT: scan env != ohos
// (not OHOS) ASSERT: scan-not env == ohos

import std.reflect.*
import std.collection.*

public class C {
    @When[os == "Linux"]
    public func test0(): Unit {
        println("os == Linux")
    }

    @When[env != "ohos"]
    public func test1(): Unit {
        println("env != ohos")
    }

    @When[env == "ohos"]
    public func test2(): Unit {
        println("env == ohos")
    }
}

main(): Unit {
    let c = C()
    ClassTypeInfo.of<C>().instanceFunctions |> forEach {f => f.apply(c)}
}
