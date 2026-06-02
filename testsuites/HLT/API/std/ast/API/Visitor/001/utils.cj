/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
import std.ast.*

class MyVisitor <: Visitor {
    public override func visit(_: Node): Unit {
        println("Node");
        res += 1
        return
    }

    public override func visit(_: Expr): Unit {
        println("Expr");
        res += 1
        return
    }

    public override func visit(_: IsExpr): Unit {
        println("IsExpr");
        res += 1
        return
    }

    public override func visit(_: AsExpr): Unit {
        println("AsExpr");
        res += 1
        return
    }

    public override func visit(_: LitConstExpr): Unit {
        println("LitConstExpr");
        res += 1
        return
    }

    public override func visit(_: UnaryExpr): Unit {
        println("UnaryExpr");
        res += 1
        return
    }

    public override func visit(_: BinaryExpr): Unit {
        println("BinaryExpr");
        res += 1
        return
    }

    public override func visit(_: ParenExpr): Unit {
        println("ParenExpr");
        res += 1
        return
    }

    public override func visit(_: CallExpr): Unit {
        println("CallExpr");
        res += 1
        return
    }

    public override func visit(_: RefExpr): Unit {
        println("RefExpr");
        res += 1
        return
    }

    public override func visit(_: ReturnExpr): Unit {
        println("ReturnExpr");
        res += 1
        return
    }

    public override func visit(_: AssignExpr): Unit {
        println("AssignExpr");
        res += 1
        return
    }

    public override func visit(_: MemberAccess): Unit {
        println("MemberAccess");
        res += 1
        return
    }

    public override func visit(_: IfExpr): Unit {
        println("IfExpr");
        res += 1
        return
    }

    public override func visit(_: LetPatternExpr): Unit {
        println("LetPatternExpr");
        res += 1
        return
    }

    public override func visit(_: MatchExpr): Unit {
        println("MatchExpr");
        res += 1
        return
    }

    public override func visit(_: WhileExpr): Unit {
        println("WhileExpr");
        res += 1
        return
    }

    public override func visit(_: LambdaExpr): Unit {
        println("LambdaExpr");
        res += 1
        return
    }

    public override func visit(_: SpawnExpr): Unit {
        println("SpawnExpr");
        res += 1
        return
    }

    public override func visit(_: SynchronizedExpr): Unit {
        println("SynchronizedExpr");
        res += 1
        return
    }

    public override func visit(_: TrailingClosureExpr): Unit {
        println("TrailingClosureExpr");
        res += 1
        return
    }

    public override func visit(_: TypeConvExpr): Unit {
        println("TypeConvExpr");
        res += 1
        return
    }

    public override func visit(_: ForInExpr): Unit {
        println("ForInExpr");
        res += 1
        return
    }

    public override func visit(_: PrimitiveTypeExpr): Unit {
        println("PrimitiveTypeExpr");
        res += 1
        return
    }

    public override func visit(_: ArrayLiteral): Unit {
        println("ArrayLiteral");
        res += 1
        return
    }

    public override func visit(_: TupleLiteral): Unit {
        println("TupleLiteral");
        res += 1
        return
    }

    public override func visit(_: SubscriptExpr): Unit {
        println("");
        res += 1
        return
    }

    public override func visit(_: RangeExpr): Unit {
        println("RangeExpr");
        res += 1
        return
    }

    public override func visit(_: Block): Unit {
        println("Block");
        res += 1
        return
    }

    public override func visit(_: DoWhileExpr): Unit {
        println("DoWhileExpr");
        res += 1
        return
    }

    public override func visit(_: JumpExpr): Unit {
        println("JumpExpr");
        res += 1
        return
    }

    public override func visit(_: IncOrDecExpr): Unit {
        println("IncOrDecExpr");
        res += 1
        return
    }

    public override func visit(_: TryExpr): Unit {
        println("TryExpr");
        res += 1
        return
    }

    public override func visit(_: ThrowExpr): Unit {
        println("ThrowExpr");
        res += 1
        return
    }

    public override func visit(_: OptionalExpr): Unit {
        println("OptionalExpr");
        res += 1
        return
    }

    public override func visit(_: QuoteExpr): Unit {
        println("QuoteExpr");
        res += 1
        return
    }

    public override func visit(_: MacroExpandExpr): Unit {
        println("MacroExpandExpr");
        res += 1
        return
    }

    public override func visit(_: WildcardExpr): Unit {
        println("WildcardExpr");
        res += 1
        return
    }

    public override func visit(_: VArrayExpr): Unit {
        println("VArrayExpr");
        res += 1
        return
    }

    public override func visit(_: Decl): Unit {
        println("Decl");
        res += 1
        return
    }

    public override func visit(_: ClassDecl): Unit {
        println("ClassDecl");
        res += 1
        return
    }

    public override func visit(_: FuncDecl): Unit {
        println("FuncDecl");
        res += 1
        return
    }

    public override func visit(_: MainDecl): Unit {
        println("MainDecl");
        res += 1
        return
    }

    public override func visit(_: MacroDecl): Unit {
        println("MacroDecl");
        res += 1
        return
    }

    public override func visit(_: StructDecl): Unit {
        println("StructDecl");
        res += 1
        return
    }

    public override func visit(_: InterfaceDecl): Unit {
        println("InterfaceDecl");
        res += 1
        return
    }

    public override func visit(_: PropDecl): Unit {
        println("PropDecl");
        res += 1
        return
    }

    public override func visit(_: VarDecl): Unit {
        println("VarDecl");
        res += 1
        return
    }

    public override func visit(_: PrimaryCtorDecl): Unit {
        println("PrimaryCtorDecl");
        res += 1
        return
    }

    public override func visit(_: EnumDecl): Unit {
        println("EnumDecl");
        res += 1
        return
    }

    public override func visit(_: FuncParam): Unit {
        println("FuncParam");
        res += 1
        return
    }

    public override func visit(_: TypeAliasDecl): Unit {
        println("TypeAliasDecl");
        res += 1
        return
    }

    public override func visit(_: ExtendDecl): Unit {
        println("ExtendDecl");
        res += 1
        return
    }

    public override func visit(_: MacroExpandDecl): Unit {
        println("MacroExpandDecl");
        res += 1
        return
    }

    public override func visit(_: TypeNode): Unit {
        println("TypeNode");
        res += 1
        return
    }

    public override func visit(_: RefType): Unit {
        println("RefType");
        res += 1
        return
    }

    public override func visit(_: PrimitiveType): Unit {
        println("PrimitiveType");
        res += 1
        return
    }

    public override func visit(_: FuncType): Unit {
        println("FuncType");
        res += 1
        return
    }

    public override func visit(_: ThisType): Unit {
        println("ThisType");
        res += 1
        return
    }

    public override func visit(_: ParenType): Unit {
        println("ParenType");
        res += 1
        return
    }

    public override func visit(_: QualifiedType): Unit {
        println("QualifiedType");
        res += 1
        return
    }

    public override func visit(_: PrefixType): Unit {
        println("PrefixType");
        res += 1
        return
    }

    public override func visit(_: TupleType): Unit {
        println("TupleType");
        res += 1
        return
    }

    public override func visit(_: VArrayType): Unit {
        println("VArrayType");
        res += 1
        return
    }

    public override func visit(_: Pattern): Unit {
        println("Pattern");
        res += 1
        return
    }

    public override func visit(_: ConstPattern): Unit {
        println("ConstPattern");
        res += 1
        return
    }

    public override func visit(_: WildcardPattern): Unit {
        println("WildcardPattern");
        res += 1
        return
    }

    public override func visit(_: VarPattern): Unit {
        println("VarPattern");
        res += 1
        return
    }

    public override func visit(_: VarOrEnumPattern): Unit {
        println("VarOrEnumPattern");
        res += 1
        return
    }

    public override func visit(_: ExceptTypePattern): Unit {
        println("ExceptTypePattern");
        res += 1
        return
    }

    public override func visit(_: TypePattern): Unit {
        println("TypePattern");
        res += 1
        return
    }

    public override func visit(_: EnumPattern): Unit {
        println("EnumPattern");
        res += 1
        return
    }

    public override func visit(_: TuplePattern): Unit {
        println("TuplePattern");
        res += 1
        return
    }

    public override func visit(_: GenericParam): Unit {
        println("GenericParam");
        res += 1
        return
    }

    public override func visit(_: GenericConstraint): Unit {
        println("GenericConstraint");
        res += 1
        return
    }

    public override func visit(_: MatchCase): Unit {
        println("MatchCase");
        res += 1
        return
    }

    public override func visit(_: Program): Unit {
        println("Program");
        res += 1
        return
    }

    public override func visit(_: PackageHeader): Unit {
        println("PackageHeader");
        res += 1
        return
    }

    public override func visit(_: ImportList): Unit {
        println("ImportList");
        res += 1
        return
    }

    public override func visit(_: Constructor): Unit {
        println("Constructor");
        res += 1
        return
    }

    public override func visit(_: Argument): Unit {
        println("Argument");
        res += 1
        return
    }

    public override func visit(_: Annotation): Unit {
        println("Annotation");
        res += 1
        return
    }

    public override func visit(_: Modifier): Unit {
        println("Modifier");
        res += 1
        return
    }
}
