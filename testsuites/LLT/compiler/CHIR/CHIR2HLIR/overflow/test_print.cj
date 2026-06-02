// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt --int-overflow saturating %enableCompileDebug %f -o %n.%suffix
// EXEC-PIPE: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan Hello, world!
// ASSERT: scan 9223372036854775807

main() {
    print("Hello, world!\n")
    print("${9_223_372_036_854_775_807 + 1}\n")
    0
}
