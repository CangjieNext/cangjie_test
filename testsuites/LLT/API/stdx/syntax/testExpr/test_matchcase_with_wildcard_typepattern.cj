// DEPENDENCE: sourceFile/matchcase_with_wildcard_typepattern.cj
// (not Windows) EXEC: dos2unix matchcase_with_wildcard_typepattern.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_MatchCase_17() {
    let res = parseFile("matchcase_with_wildcard_typepattern.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile : SourceFile = res.node.getOrThrow()
    @Expect(sourcefile.toString().contains(##"main() {
    match(xxx) {
        case _: T => { => }
    }
}"##))

    var mainDecl: MainDecl = (sourcefile.topLevelDecls[0] as MainDecl).getOrThrow()
    var expr: MatchExpr = (mainDecl.body.nodes[0] as MatchExpr).getOrThrow()
    @Assert(expr.matchCases.size, 1)

    let case_1 = expr.matchCases[0]

    @Assert(case_1.toString(), ##"case _: T => { => }"##)
    @Assert(case_1.toTokens().toString(), ##"case _: T => { => }"##)
    @Assert(case_1.body.size, 1)
    @Assert(case_1.body[0].toString(), ##"{ => }"##)
    @Assert(case_1.caseCond.isNone())
    @Assert(case_1.patternGuardCond.isNone())
    @Assert(case_1.patterns.size, 1)
    @Assert(case_1.patterns[0] is TypePattern)
    @Assert(case_1.patterns[0].toString(), "_: T")
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
