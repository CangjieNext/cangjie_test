/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %cmp_opt %f -o %output %cmp_utest_opt

// ASSERT: scan error: non-exhaustive patterns

import std.ast.*
import std.unittest.*
import std.unittest.testmacro.*

/**
 ** WARNING**: exhaustive check is closed, this is a ineffective test cases.

Note:
    This test checks all supported nodes in @PowerAssert.
    It can fail in case of a new node was added into AST but was not supported in @PowerAssert.

    To fix this test via support new node in @PowerAssert, please, do:
    1. Add node transformations in libs/std/unittest/testmacro/power_assert.cj
        for both PowerAssertWrapper and PowerAssertWrapperImpl.
    2. Add tests on this node in tests/LLT/libs/std/unittest/powerAssert/nodeTypes.
    3. Add this node to the `match` as case in this file.
 */
@Test
func testSupportedNodes() {
    /*
     Please, read the **Note** section above if this test has failed.
     */
    let node: Node = quote(0) |> parseExpr // Fake node.
    match (node) {
        // Nodes that covered in @PowerAssert.
        case _: IsExpr => ()
        case _: AsExpr => ()
        case _: LitConstExpr => ()
        case _: UnaryExpr => ()
        case _: BinaryExpr => ()
        case _: ParenExpr => ()
        case _: CallExpr => ()
        case _: RefExpr => ()
        case _: ReturnExpr => ()
        case _: AssignExpr => ()
        case _: MemberAccess => ()
        case _: IfExpr => ()
        case _: LetPatternExpr => ()
        case _: MatchExpr => ()
        case _: WhileExpr => ()
        case _: LambdaExpr => ()
        case _: SpawnExpr => ()
        case _: SynchronizedExpr => ()
        case _: TrailingClosureExpr => ()
        case _: TypeConvExpr => ()
        case _: ForInExpr => ()
        case _: PrimitiveTypeExpr => ()
        case _: ArrayLiteral => ()
        case _: TupleLiteral => ()
        case _: SubscriptExpr => ()
        case _: RangeExpr => ()
        case _: Block => ()
        case _: DoWhileExpr => ()
        case _: JumpExpr => ()
        case _: IncOrDecExpr => ()
        case _: TryExpr => ()
        case _: ThrowExpr => ()
        case _: OptionalExpr => ()
        case _: WildcardExpr => ()
        case _: VArrayExpr => ()
        case _: FuncDecl => ()
        case _: VarDecl => ()
        case _: FuncParam => ()
        case _: RefType => ()
        case _: PrimitiveType => ()
        case _: FuncType => ()
        case _: ThisType => ()
        case _: ParenType => ()
        case _: QualifiedType => ()
        case _: PrefixType => ()
        case _: TupleType => ()
        case _: VArrayType => ()
        case _: ConstPattern => ()
        case _: WildcardPattern => ()
        case _: VarPattern => ()
        case _: VarOrEnumPattern => ()
        case _: ExceptTypePattern => ()
        case _: TypePattern => ()
        case _: EnumPattern => ()
        case _: TuplePattern => ()
        case _: GenericParam => ()
        case _: GenericConstraint => ()
        case _: MatchCase => ()
        case _: Argument => ()
        case _: Modifier => ()

        // Nodes that sould not be met in @PowerAssert
        case _: TypeNode => ()
        case _: Program => ()
        case _: Pattern => ()
        case _: Annotation => ()
        case _: Body => ()
        case _: Constructor => ()
        case _: ClassDecl => ()
        case _: EnumDecl => ()
        case _: ExtendDecl => ()
        case _: InterfaceDecl => ()
        case _: MacroDecl => ()
        case _: MacroExpandDecl => ()
        case _: MainDecl => ()
        case _: PrimaryCtorDecl => ()
        case _: PropDecl => ()
        case _: StructDecl => ()
        case _: TypeAliasDecl => ()
        case _: Decl => ()
        case _: MacroExpandExpr => ()
        case _: QuoteExpr => ()
        case _: QuoteToken => ()
        case _: Expr => ()
        case _: ImportContent => ()
        case _: ImportList => ()
        case _: PackageHeader => ()
        // Do not add wildcard pattern case.
    }
}
