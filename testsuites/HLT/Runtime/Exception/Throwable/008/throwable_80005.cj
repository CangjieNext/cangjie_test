/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: use_80005.cj
// EXEC: %compiler %cmp_opt %f %compile_lib_opt -o define.%middle
// EXEC: %compiler %cmp_opt use_80005.cj define.%middle -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan An exception has occurred
// ASSERT: scan Exception
// (!(target_ios | target_ios_simulator)) ASSERT: scan throwable_80005.cj:23
// ASSERT: scan-not b global init
// ASSERT: scan-not main func

package define

var a = if (true) {
    throw Exception()
} else {
    1
}
