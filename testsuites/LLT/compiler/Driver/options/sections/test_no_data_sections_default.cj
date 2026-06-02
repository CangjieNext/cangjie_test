// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC-PIPE-0: %compiler %verbose_opt %f 2>&1 -o %output | compare %f
//  ASSERT: regex-not opt(.exe)?['"] .*-data-sections
//  ASSERT: regex-not llc(.exe)?['"] .*-data-sections
//  EXEC-PIPE-0: %run_opt %output

main() {
    return 0
}
