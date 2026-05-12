/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// description: specify --compile-as-exe flag while not specifying --lto=[full|thin], expecting driver's compilation error.
// (target_linux | target_ohos) EXEC: %compiler %cmp_opt --compile-as-exe %f -o %output 2>&1 | compare %f
// (target_linux | target_ohos) ASSERT: scan --compile-as-exe only takes effect when lto mode is enabled

main(): Int64 {
    return 0
}
