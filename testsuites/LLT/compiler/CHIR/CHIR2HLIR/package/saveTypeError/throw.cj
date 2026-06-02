// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %noColor %f %diag_json 2>&1 | compare %f

main() {
    var t = Exception()
    throw t
}
// ASSERT: scan sema_unexpected_return_type_for_entry
