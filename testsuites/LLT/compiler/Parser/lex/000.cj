// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %f -o %output %diag_json 2>&1 | compare %f

main() {
    let _ = 000.a
}

// ASSERT: scan lex_cannot_start_with_digit
// ASSERT: scan "Errors": 1,