// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*

class MyVisitor <: Visitor {
    public override func visit(curNode: Node) {
        println("Node")
    }

    public override func visit(curExpr: Expr) {
        println("Expr")
    }

    public override func visit(curExpr: IsExpr) {
        println("Expr")
    }

    public override func visit(curExpr: AsExpr) {
        println("AsExpr")
    }

    public override func visit(curExpr: LitConstExpr) {
        println("LitConstExpr")
    }

    public override func visit(curExpr: UnaryExpr) {
        println("UnaryExpr")
    }

    public override func visit(curExpr: BinaryExpr) {
        println("BinaryExpr")
    }

    public override func visit(curExpr: ParenExpr) {
        println("ParenExpr")
    }

    public override func visit(curExpr: CallExpr) {
        println("CallExpr")
    }

    public override func visit(curExpr: RefExpr) {
        println("RefExpr")
    }

    public override func visit(curExpr: ReturnExpr) {
        println("ReturnExpr")
    }

    public override func visit(curExpr: AssignExpr) {
        println("AssignExpr")
    }

    public override func visit(curExpr: MemberAccess) {
        println("MemberAccess")
    }

    public override func visit(curExpr: IfExpr) {
        println("IfExpr")
    }

    public override func visit(curExpr: MatchExpr) {
        println("MatchExpr")
    }

    public override func visit(curExpr: WhileExpr) {
        println("WhileExpr")
    }

    public override func visit(curExpr: LambdaExpr) {
        println("LambdaExpr")
    }

    public override func visit(curExpr: SpawnExpr) {
        println("SpawnExpr")
    }

    public override func visit(curExpr: SynchronizedExpr) {
        println("SynchronizedExpr")
    }

    public override func visit(curExpr: TrailingClosureExpr) {
        println("TrailingClosureExpr")
    }

    public override func visit(curExpr: TypeConvExpr) {
        println("TypeConvExpr")
    }

    public override func visit(curExpr: ForInExpr) {
        println("ForInExpr")
    }

    public override func visit(curExpr: PrimitiveTypeExpr) {
        println("PrimitiveTypeExpr")
    }

    public override func visit(curExpr: ArrayLiteral) {
        println("ArrayLit")
    }

    public override func visit(curExpr: TupleLiteral) {
        println("TupleLit")
    }

    public override func visit(curExpr: SubscriptExpr) {
        println("SubscriptExpr")
    }

    public override func visit(curExpr: RangeExpr) {
        println("RangeExpr")
    }

    public override func visit(curExpr: Block) {
        println("Block")
    }

    public override func visit(curExpr: DoWhileExpr) {
        println("DoWhileExpr")
    }

    public override func visit(curExpr: JumpExpr) {
        println("JumpExpr")
    }

    public override func visit(curExpr: IncOrDecExpr) {
        println("IncOrDecExpr")
    }

    public override func visit(curExpr: TryExpr) {
        println("TryExpr")
    }

    public override func visit(curExpr: ThrowExpr) {
        println("ThrowExpr")
    }

    //****************append****************//

    public override func visit(curExpr: LetPatternExpr) {
        println("LetPatternExpr")
    }

    public override func visit(curExpr: OptionalExpr) {
        println("OptionalExpr")
    }

    public override func visit(curExpr: QuoteExpr) {
        println("QuoteExpr")
    }

    public override func visit(curExpr: WildcardExpr) {
        println("WildcardExpr")
    }

    public override func visit(curExpr: VArrayExpr) {
        println("VArrayExpr")
    }

    public override func visit(curExpr: MacroExpandExpr) {
        println("MacroExpandExpr")
    }
}

main(): Int64 {
    var input = quote(
        try {
            var a = 1
        } catch (e: IOException) {
            throw e
        } finally {
            if (true) {
                return
            }
        }
    )
    var decl = parseExpr(input)
    var myVisitor = MyVisitor()
    decl.traverse(myVisitor)

    input = quote(
            while(true) {
                let range1 = 0..=10:3
            }
        } 
    )
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(0..=10:3)
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(Array<Int32>(10,2))
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote((123))
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(a++)
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(return)
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote({=> 42})
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(throw e)
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(if(a) {})
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(break)
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(Float32(a+b))
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(!a)
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote([1, 2, 3])
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote((1, 2, 3, 4))
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(derive1 as base1)
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(spawn {})
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(for(input in inputs) {})
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(
        synchronized(mtx) {
            count = count + 1
        }
    )
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(
        if (let Some(x) <- v) {
            print(x)
        }
    )
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(
        Int32(0)
    )
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(
        (parseExpr(quote( ))) is QuoteExpr
    )
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(
        VArray<Int64, \$3>{i => i}
    )
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(
        if (let Some(tmp) <- val) {}
    )
    decl = parseExpr(input)

    input = quote(
        do {
            
        } while (false)
    )
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(
        spawn { =>
            sleep(100 * Duration.millisecond)
        }
    )
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(
        1..10
    )
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(
        (1, 2, 3)
    )
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(
        for (v in [1, 2, 3]) {}
    )
    decl = parseExpr(input)
    decl.traverse(myVisitor)
    decl.traverse(myVisitor)

    input = quote(
        try {
        
        } catch (e: ASTException) {

        }
    )
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(
        match (v) {
            case _ => throw ASTException("exception")
        }
    )
    decl = parseExpr(input)
    decl.traverse(myVisitor)

    input = quote(
        @M(res)
    )
    decl = parseExpr(input)
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
