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

main(): Unit {
    @When[os == "Linux"]
    println("os == Linux")

    @When[env != "ohos"]
    println("env != ohos")

    @When[env == "ohos"]
    println("env == ohos")
}
