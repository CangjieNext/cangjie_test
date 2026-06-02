/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// this seemingly extra step is for iOS cross-compilation scenario to work, modifying source file first, so please do not remove this step.
// (!host_win) EXEC: %compiler %cmp_opt %f -o %output
// (!host_win) EXEC: mkdir '$(ls)'; cp %f '$(ls)'
// (!host_win) EXEC: %compiler %cmp_opt '$(ls)'/%f -o %output
// (!host_win) RUN-EXEC: %run %run_opt %output %run_args

main() {
    0
}
