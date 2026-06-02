// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  (DEBUG_OPTION)EXEC: %compiler %verbose_opt --llc-options "-version" %f 2>&1 | compare %f
//  ASSERT: regex llc(.exe)?['"] .*\-version
//  ASSERT: scan LLVM version 15.0.4

main() {
    return 0
}
