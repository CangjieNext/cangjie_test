// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f --target=x86_64-unknown-target-linux-gnu -o %output 2>&1 | compare %f
// ASSERT: regex error.*: The target must be in either form of {ARCH}-{VENDOR}-{SYSTEM}-{ENV} or {ARCH}-{SYSTEM}-{ENV}.

main() {
    return 0
}
