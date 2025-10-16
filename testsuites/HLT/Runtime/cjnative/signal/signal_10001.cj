/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (not Windows) EXEC: %compiler %f %cmp_opt -o %output
// (not MAC and not Windows) RUN-EXEC-PIPE-134: %run %run_opt %output %run_args 2>&1 | compare %f
// (iOS) RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// (MAC and not iOS) RUN-EXEC-134: %run %run_opt %output %run_args
// (not Windows) ASSERT:scan SIGABRT

foreign func abort(): Unit

main(): Unit {
    unsafe { abort() }
}
