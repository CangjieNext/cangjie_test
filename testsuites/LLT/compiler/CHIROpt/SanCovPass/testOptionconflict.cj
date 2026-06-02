// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-1: %compiler --sanitizer-coverage-inline-8bit-counters --sanitizer-coverage-trace-pc-guard %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE) ASSERT: regex-not core dumped

main() {
    println(12)
    0
}
