// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan-not undeclared identifier 'Tokens' 

main() {
    let tks = quote(1+2)
    return 0
}
