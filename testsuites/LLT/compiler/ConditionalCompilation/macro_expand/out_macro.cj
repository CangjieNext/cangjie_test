// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %n.cj
// EXEC: %compiler %enableCompileDebug %cmp_macro define.cj
// ERRCHECK: %compiler %enableCompileDebug %n.cj %diag_json

import define.*

@When[!debug]
@M0
main() {
    0
}

// ASSERT: scan sema_missing_entry
