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
// (MAC and arm and not OHOS) RUN-EXEC-1: %run %run_opt %output %run_args
// (MAC and x86 and not OHOS) RUN-EXEC-1: %run %run_opt %output %run_args
// (iOS and arm and not OHOS) RUN-EXEC: %run %run_opt %output %run_args
// (iOS and x86 and not OHOS) RUN-EXEC: %run %run_opt %output %run_args
// (Windows and not OHOS) RUN-EXEC-1: %run %run_opt %output %run_args
// (not Windows and not MAC and not OHOS and arm) RUN-EXEC-1: %run %run_opt %output %run_args
// (not Windows and not MAC and not OHOS and x86) RUN-EXEC-1: %run %run_opt %output %run_args
// (OHOS) RUN-EXEC-1: %run %run_opt %output %run_args

public open class P {
    public open func foo(): Int64 {
        1i64
    }
}

public class S <: P {
    @When[os == "iOS" && env != "android"]
    public func foo(): Int64 {
        0i64
    }
}

main(): Int64 {
    S().foo()
}
