// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %n.cj %diag_json

import define.*

@M0 // error
class C {
    @When[!debug]
    var m = 0
}

main() {
    C().m
}

// ASSERT: scan conditional_compilation_unexpected_after_macro
