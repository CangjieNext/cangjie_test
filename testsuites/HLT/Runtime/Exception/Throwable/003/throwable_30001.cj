/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (iOS) RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// (iOS) ASSERT: scan Failed to InitCJLibrary
// (not iOS) ASSERT: regex Exception in thread "main" java.lang.Exception|An exception has occurred
// (not iOS) ASSERT: scan throwable_30001.cj:17
var a = if (true) {
    throw Exception();
    0
} else {
    1
}

main() {
    return 5 // throw before main.
}
