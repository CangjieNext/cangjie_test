/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: rangeexpr002.cj
// (not iOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (not iOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_rangeexpr_002() {
    let res = parseFile("./rangeexpr002.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Assert(sourcefile.toString().contains("0..=10:-2"))
    @Assert(sourcefile.name, "rangeexpr002.cj")
    @Assert(sourcefile.path.contains("rangeexpr002.cj"))
    @Assert(sourcefile.pkgHeader.isNone())

    var maindecl = (sourcefile.topLevelDecls[0] as MainDecl).getOrThrow()
    var rangeexpr = (maindecl.body.nodes[0] as RangeExpr).getOrThrow()
    //toString()
    @Assert(rangeexpr.toString(), "0..=10:-2")

    //end
    @Assert(rangeexpr.end.getOrThrow().toString(), "10")

    //start
    @Assert(rangeexpr.start.getOrThrow().toString(), "0")

    //kind
    match (rangeexpr.kind) {
        case RangeKind.ClosedRangeOp => ()
        case _ => @Assert(false)
    }

    //step
    match (rangeexpr.step) {
        case Some(v) => @Assert(v.toString(),"-2")
        case _ => @Assert(false)
    }
}
