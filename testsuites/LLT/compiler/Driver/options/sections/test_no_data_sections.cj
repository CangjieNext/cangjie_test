// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  (DEBUG_OPTION)EXEC-PIPE-0: %compiler %verbose_opt --fno-data-sections %f 2>&1 -o %output | compare %f
//  ASSERT: regex-not opt(.exe)?['"] .*-data-sections
//  ASSERT: regex-not llc(.exe)?['"] .*-data-sections
//  (DEBUG_OPTION)EXEC-PIPE-0: %run_opt %output

main() {
    return 0
}
