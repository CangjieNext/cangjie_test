// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    public override func visit(curPattern: ConstPattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: WildcardPattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: VarPattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: VarOrEnumPattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: ExceptTypePattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: TypePattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: EnumPattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: TuplePattern) {
        curPattern.dump()
    }
}

main(): Int64 {
    let input = quote(
        func x() {
            match (a) {
                case 1 => 1
                case (a,b) => 1
                case a : Int64 => 1
                case X => 1
                case X | Y => 1
                case Year(y) => y * 365 * 24
                case _ => 1
                case _ where (a) => 1
            }
        }
    )
    let decl = parseDecl(input)

    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)

    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
