// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: mod1 mod2
// EXEC: %compiler %cmp_opt %compile_lib_opt mod1/pkg/a.cj --module-name mod1 -o mod1
// EXEC: %compiler %cmp_opt %compile_lib_opt mod2/pkg/a.cj --module-name mod2 -o mod2
// ERRCHECK: %compiler %cmp_opt %diag_json %f

import mod1.pkg.*
import mod2.pkg.*

func test() {
    var a: A
}

main() {}

// ASSERT: scan sema_ambiguous_use
