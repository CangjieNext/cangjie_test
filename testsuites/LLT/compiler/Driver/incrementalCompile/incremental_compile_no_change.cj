// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %verbose_opt --experimental --incremental-compile %f -o %output
// EXEC: %compiler %verbose_opt --experimental --incremental-compile %f -o %output 2>&1 | compare %f
// EXEC: %run_opt %output
// ASSERT: scan-not cangjie/output/third_party/llvm/bin/opt
// ASSERT: scan-not cangjie/output/third_party/llvm/bin/llc

main() {
    return 0
}
