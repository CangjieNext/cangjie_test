/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ((host_win & target_win) | (host_mac & target_mac)) EXEC-PIPE-1: %compiler %cmp_opt --lto=thin %f -o %output 2>&1 | compare %f
// (host_win & target_win) ASSERT: scan Windows does not support LTO optimization.
// (host_mac & target_mac) ASSERT: scan libstd.core.bc: No such file or directory
// (!((host_win & target_win) | (host_mac & target_mac))) EXEC-PIPE: %compiler %cmp_opt --lto=thin %f -o %output -V 2>&1 | compare %f
// (!((host_win & target_win) | (host_mac & target_mac))) ASSERT: scan-not does not support
// (!((host_win & target_win) | (host_mac & target_mac))) ASSERT: scan --cangjie-lto
// (!((host_win & target_win) | (host_mac & target_mac) | (host_mac & target_ios))) ASSERT: scan --thinlto-cache-dir
// (!((host_win & target_win) | (host_mac & target_mac) | (host_mac & target_ios))) RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    return 0
}
