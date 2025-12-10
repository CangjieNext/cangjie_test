/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// DEPENDENCE: main.cj
// EXEC: %compiler %cmp_opt main.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// (MAC and not OHOS) ASSERT: scan positive
// (Windows and not OHOS) ASSERT: scan negative
// (not Windows and not MAC and not OHOS and arm) ASSERT: scan negative
// (not Windows and not MAC and not OHOS and x86) ASSERT: scan negative
// (OHOS) ASSERT: scan negative

public open class P {
    public open func foo(): Unit {
        println("negative")
    }
}

public class S <: P {
    @When[os != "Linux" && arch != "x86_64" && env != "ohos"]
    public func foo(): Unit {
        println("positive")
    }
}

main(): Unit {
    S().foo()
}
