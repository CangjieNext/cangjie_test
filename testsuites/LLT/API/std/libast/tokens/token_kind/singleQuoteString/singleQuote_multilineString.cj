// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan kind: MULTILINE_STRING
// ASSERT: scan kind: MULTILINE_RAW_STRING

import std.ast.*

main() {
    var tks = quote(var a = '''
            package c4j.cjj
            import c4j.cjj.annotations.Mapping

            main(){}
            ''')
    var a = (parseDecl(tks) as VarDecl).getOrThrow()
    a.expr.dump()

    tks = quote(var a = ##'
            package c4j.cjj
            import c4j.cjj.annotations.Mapping

            main(){}
            '##)
    a = (parseDecl(tks) as VarDecl).getOrThrow()
    a.expr.dump()
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
