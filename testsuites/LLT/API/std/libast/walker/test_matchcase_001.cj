// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

class Myvisitor <: Visitor {
    public override func visit(mc: MatchCase) {
        let allpatterns = mc.patterns
        println(allpatterns[0].toTokens())
    }
}

main() {
    let input = quote(
        func assdfdsf(x:Int64){
            match (x) {
                case 1 => ""
                case _ => ""
            }    
        }
    )
    let a = parseDecl(input)
    a.traverse(Myvisitor())
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
