 /*
* Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
* This source file is part of the Cangjie project, licensed under Apache-2.0
* with Runtime Library Exception.
*
* See https://cangjie-lang.cn/pages/LICENSE for license information.
*/

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

import std.ast.*

public class MyVisitor <: Visitor{
    public override func visit(_: ClassDecl){
        println("visit ClassDecl")
    }
    public override func visit(_: StructDecl){
        println("visit StructDecl")
    }
    public override func visit(_: InterfaceDecl){
        println("visit InterfaceDecl")
    }
    public override func visit(_: EnumDecl){
        println("visit EnumDecl")
    }
    public override func visit(_: ExtendDecl){
        println("visit ExtendDecl")
    }
    public override func visit(_: FuncDecl){
        println("visit FuncDecl")
    }
    public override func visit(_: MainDecl){
        println("visit MainDecl")
    }
    public override func visit(_: MacroDecl){
        println("visit MacroDecl")
    }
    public override func visit(_: PrimaryCtorDecl){
        println("visit PrimaryCtorDecl")
    }
    public override func visit(_: VarDecl){
        println("visit VarDecl")
    }
    public override func visit(_: FuncParam){
        println("visit FuncParam")
    }
    public override func visit(_: PropDecl){
        println("visit PropDecl")
    }
    public override func visit(_: TypeAliasDecl){
        println("visit TypeAliasDecl")
    }
    public override func visit(_: MacroExpandDecl){
        println("visit MacroExpandDecl")
    }

    public override func visit(_: Decl){
        println("visit Decl(Generic)")
    }
    public override func visit(_: Node){
        println("visit Node(Generic)")
    }
}

main(): Unit {
    let visitor = MyVisitor()

    println("=== Testing ClassDecl ===")
    visitor.breakTraverse()
    let classDecl = ClassDecl(quote(
        class MyClass {}
    ))
    classDecl.traverse(visitor)

    println("=== Testing StructDecl ===")
    visitor.breakTraverse()
    let structDecl = StructDecl(quote(
        struct MyStruct {}
    ))
    structDecl.traverse(visitor)

    println("=== Testing InterfaceDecl ===")
    visitor.breakTraverse()
    let interfaceDecl = InterfaceDecl(quote(
        interface MyInterface {}
    ))
    interfaceDecl.traverse(visitor)

    println("=== Testing EnumDecl ===")
    visitor.breakTraverse()
    let enumDecl = EnumDecl(quote(
        enum MyEnum { A | B }
    ))
    enumDecl.traverse(visitor)

    println("=== Testing ExtendDecl ===")
    visitor.breakTraverse()
    let extendDecl = ExtendDecl(quote(
        extend Int64 {}
    ))
    extendDecl.traverse(visitor)

    println("=== Testing FuncDecl ===")
    visitor.breakTraverse()
    let funcDecl = FuncDecl(quote(
        func myFunc() {}
    ))
    funcDecl.traverse(visitor)

    println("=== Testing MainDecl ===")
    visitor.breakTraverse()
    let mainDecl = MainDecl(quote(
        main(): Unit {}
    ))
    mainDecl.traverse(visitor)

    println("=== Testing MacroDecl ===")
    visitor.breakTraverse()
    let macroDecl = MacroDecl(quote(
        public macro MyMacro(tokens: Tokens): Tokens { tokens }
    ))
    macroDecl.traverse(visitor)

    println("=== Testing PrimaryCtorDecl ===")
    visitor.breakTraverse()
    let primaryCtorDecl = PrimaryCtorDecl(quote(
        Point(var x: Int32, var y: Int32) {}, astKind: "PrimaryCtorDecl"
    ))
    primaryCtorDecl.traverse(visitor)

    println("=== Testing VarDecl ===")
    visitor.breakTraverse()
    let varDecl = VarDecl(quote(
        let myVar = 100
    ))
    varDecl.traverse(visitor)

    println("=== Testing FuncParam ===")
    visitor.breakTraverse()
    let funcParam = FuncParam(quote(
        p: Int64
    ))
    funcParam.traverse(visitor)

    println("=== Testing PropDecl ===")
    visitor.breakTraverse()
    let propDecl = PropDecl(quote(
        prop myProp: Int64 {
            get() { 0 }
        }
    ))
    propDecl.traverse(visitor)

    println("=== Testing TypeAliasDecl ===")
    visitor.breakTraverse()
    let typeAliasDecl = TypeAliasDecl(quote(
        type MyInt = Int64
    ))
    typeAliasDecl.traverse(visitor)

    println("=== Testing MacroExpandDecl ===")
    visitor.breakTraverse()
    let macroExpandDecl = MacroExpandDecl(quote(
        @MyMacro(func myfunc(){})
    ))
    macroExpandDecl.traverse(visitor)
}

/* SCAN-IN
=== Testing ClassDecl ===
visit ClassDecl
visit Decl(Generic)
visit Node(Generic)
=== Testing StructDecl ===
visit StructDecl
visit Decl(Generic)
visit Node(Generic)
=== Testing InterfaceDecl ===
visit InterfaceDecl
visit Decl(Generic)
visit Node(Generic)
=== Testing EnumDecl ===
visit EnumDecl
visit Decl(Generic)
visit Node(Generic)
=== Testing ExtendDecl ===
visit ExtendDecl
visit Decl(Generic)
visit Node(Generic)
=== Testing FuncDecl ===
visit FuncDecl
visit Decl(Generic)
visit Node(Generic)
=== Testing MainDecl ===
visit MainDecl
visit Decl(Generic)
visit Node(Generic)
=== Testing MacroDecl ===
visit MacroDecl
visit Decl(Generic)
visit Node(Generic)
=== Testing PrimaryCtorDecl ===
visit PrimaryCtorDecl
visit Decl(Generic)
visit Node(Generic)
=== Testing VarDecl ===
visit VarDecl
visit Decl(Generic)
visit Node(Generic)
=== Testing FuncParam ===
visit FuncParam
visit Decl(Generic)
visit Node(Generic)
=== Testing PropDecl ===
visit PropDecl
visit Decl(Generic)
visit Node(Generic)
=== Testing TypeAliasDecl ===
visit TypeAliasDecl
visit Decl(Generic)
visit Node(Generic)
=== Testing MacroExpandDecl ===
visit MacroExpandDecl
visit Decl(Generic)
visit Node(Generic)
*/
