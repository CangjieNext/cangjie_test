// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %cmp_macro syntax_parse_string_late_macro.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan-not core dumped
// ASSERT: scan redefinition of declaration 'M'

import stdx.syntax.*
import stdx.syntax

main() {
    let tks = '''
        @LateM
        class A {}
    )'''
    let decl = syntax.parseString(tks).node.getOrThrow()
    decl.toTokens().dump()
}