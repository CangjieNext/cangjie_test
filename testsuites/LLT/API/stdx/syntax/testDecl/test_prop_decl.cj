// DEPENDENCE: sourceFile/prop_decl.cj
// (not Windows) EXEC: dos2unix prop_decl.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.syntax.*
import std.fs.*
import std.collection.ArrayList

@Test
class Test {
    var decls: Array<Decl> = []

    @BeforeAll
    func readDecls(): Unit {
        let node = parseFile("prop_decl.cj")
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        let decl = (file.topLevelDecls[0] as ClassDecl).getOrThrow()
        decls = decl.body.memberDecls
    }

    @TestCase
    func testDecl01() {
        let decl = (decls[0] as PropDecl).getOrThrow()
        @Expect(decl.name, "a")
        @Expect(decl.tyAnnotation.toString(), "Unit")
        let getter = decl.getter.getOrThrow()
        @Expect(getter.identifier.isNone())
        @Expect(getter.isGetter, true)
        @Expect(getter.block.toString(), """
{
            ()
        }""")
        @Expect(getter.toString(), """
get() {
            ()
        }""")
        @Expect(decl.toString(), """
prop a: Unit {
        get() {
            ()
        }
    }""")
        @Expect(decl.toTokens().toString(), """
prop a: Unit {
    get() {
        ()
    }
}""")
        var pos = decl.getPropKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 9]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 10, 2, 11]).toArray())
        pos = decl.getTyAnnotationColonPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 11, 2, 12]).toArray())
        pos = decl.getLCurlPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 18, 2, 19]).toArray())
        pos = decl.getRCurlPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([6, 5, 6, 6]).toArray())
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 6, 6]).toArray())

        pos = getter.getGetKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 9, 3, 12]).toArray())
        @Expect(getter.getSetKeyWordPos().isNone())
        @Expect(getter.getIdentifierPos().isNone())
        pos = getter.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 12, 3, 13]).toArray())
        pos = getter.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 13, 3, 14]).toArray())
        pos = getter.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([3, 9, 5, 10]).toArray())
    }

    @TestCase
    func testDecl02() {
        let decl = (decls[1] as PropDecl).getOrThrow()
        @Expect(decl.name, "b")
        @Expect(decl.tyAnnotation.toString(), "Int64")
        let getter = decl.getter.getOrThrow()
        @Expect(getter.identifier.isNone())
        @Expect(getter.isGetter, true)
        @Expect(getter.block.toString(), """
{
            1
        }""")
        @Expect(getter.toString(), """
get() {
            1
        }""")
        let setter = decl.setter.getOrThrow()
        @Expect(setter.identifier.getOrThrow().toString(), "v")
        @Expect(setter.isGetter, false)
        @Expect(setter.block.toString(), """
{
            println(v)
        }""")
        @Expect(setter.toString(), """
set(v) {
            println(v)
        }""")
        @Expect(decl.toString(), """
mut prop b: Int64 {
        get() {
            1
        }
        set(v) {
            println(v)
        }
    }""")
        @Expect(parseTokens(decl.toTokens(), refreshPos: false).node.getOrThrow().toString(), decl.toString())
        var pos = decl.getPropKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 9, 8, 13]).toArray())
        pos = decl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 14, 8, 15]).toArray())
        pos = decl.getTyAnnotationColonPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 15, 8, 16]).toArray())
        pos = decl.getLCurlPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 23, 8, 24]).toArray())
        pos = decl.getRCurlPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([15, 5, 15, 6]).toArray())
        pos = decl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 5, 15, 6]).toArray())

        pos = getter.getGetKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 9, 9, 12]).toArray())
        @Expect(getter.getSetKeyWordPos().isNone())
        @Expect(getter.getIdentifierPos().isNone())
        pos = getter.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 12, 9, 13]).toArray())
        pos = getter.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 13, 9, 14]).toArray())
        pos = getter.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([9, 9, 11, 10]).toArray())
        
        pos = setter.getSetKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 9, 12, 12]).toArray())
        @Expect(setter.getGetKeyWordPos().isNone())
        pos = setter.getIdentifierPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 13, 12, 14]).toArray())
        pos = setter.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 12, 12, 13]).toArray())
        pos = setter.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 14, 12, 15]).toArray())
        pos = setter.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([12, 9, 14, 10]).toArray())
    }

    @TestCase
    func testPropDeclInit() {
        let decl = (decls[1] as PropDecl).getOrThrow()
        let propDecl = PropDecl(decl.getter, decl.name, decl.setter, decl.tyAnnotation, annotations: decl.annotations, modifiers: decl.modifiers)
        @Expect(propDecl.name, "b")
        @Expect(propDecl.tyAnnotation.toString(), "Int64")

        var pos = propDecl.getPropKeyWordPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 5, 1, 9]).toArray())
        pos = propDecl.getIdentifierPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 10, 1, 11]).toArray())
        pos = propDecl.getTyAnnotationColonPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 11, 1, 12]).toArray())
        pos = propDecl.getLCurlPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 19, 1, 20]).toArray())
        pos = propDecl.getRCurlPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([8, 1, 8, 2]).toArray())
        pos = propDecl.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([1, 1, 8, 2]).toArray())


        let getter = propDecl.getter.getOrThrow()
        let getDecl = PropGetterOrSetter(getter.block, getter.identifier, getter.isGetter, annotations: getter.annotations)
        @Expect(getDecl.identifier.isNone())
        @Expect(getDecl.isGetter, true)
        @Expect(getDecl.block.toString(), """
{
            1
        }""")
        @Expect(getDecl.toString(), """
get() {
            1
        }""")
        pos = getter.getGetKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 2, 8]).toArray())
        @Expect(getter.getSetKeyWordPos().isNone())
        @Expect(getter.getIdentifierPos().isNone())
        pos = getter.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 8, 2, 9]).toArray())
        pos = getter.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 9, 2, 10]).toArray())
        pos = getter.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([2, 5, 4, 10]).toArray())


        let setter = propDecl.setter.getOrThrow()
        let setDecl = PropGetterOrSetter(setter.block, setter.identifier, setter.isGetter, annotations: setter.annotations)
        @Expect(setDecl.identifier.getOrThrow().toString(), "v")
        @Expect(setDecl.isGetter, false)
        @Expect(setDecl.block.toString(), """
{
            println(v)
        }""")
        @Expect(setDecl.toString(), """
set(v) {
            println(v)
        }""")
        @Expect(propDecl.toString(), """
mut prop b: Int64 {
    get() {
            1
        }
    set(v) {
            println(v)
        }
}""") 
        pos = setter.getSetKeyWordPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 5, 5, 8]).toArray())
        @Expect(setter.getGetKeyWordPos().isNone())
        pos = setter.getIdentifierPos().getOrThrow()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 9, 5, 10]).toArray())
        pos = setter.getLParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 8, 5, 9]).toArray())
        pos = setter.getRParenPos()
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 10, 5, 11]).toArray())
        pos = setter.nodePos
        @Expect([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], ArrayList<Int32>([5, 5, 7, 10]).toArray())
    }

    @TestCase
    func testFileToString() {
        let node = parseFile("prop_decl.cj")
        let input = String.fromUtf8(File.readFrom("prop_decl.cj"))
        let file = (node.node.getOrThrow() as SourceFile).getOrThrow()
        @Expect(file.toString(), input)
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
