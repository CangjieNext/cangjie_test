/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// (not OHOS and not iOS) RUN-EXEC-PIPE: %export MRT_LOG_LEVEL=i && %run %run_opt %output %run_args | compare %f
// ASSERT:scan gcThreshold is set to 234234234 KB.

import std.runtime.*

main() {
    SetGCThreshold(234234234)
}
