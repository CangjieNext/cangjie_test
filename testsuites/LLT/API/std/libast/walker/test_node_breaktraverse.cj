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
import std.collection.*

public class MyVisitor <: Visitor{
    public override func visit(_: Annotation){
        println("visit Annotation")
    }
    public override func visit(_: GenericConstraint){
        println("visit GenericConstraint")
    }
    public override func visit(_: Body){
        println("visit Body")
    }
    public override func visit(_: Argument){
        println("visit Argument")
    }
    public override func visit(_: MatchCase){
        println("visit MatchCase")
    }
    public override func visit(_: Program){
        println("visit Program")
    }
    public override func visit(_: FeaturesSet){
        println("visit FeaturesSet")
    }
    public override func visit(_: FeaturesDirective){
        println("visit FeaturesDirective")
    }
    public override func visit(_: ImportContent){
        println("visit ImportContent")
    }
    public override func visit(_: ImportList){
        println("visit ImportList")
    }
    public override func visit(_: Constructor){
        println("visit Constructor")
    }


    public override func visit(_: Node){
        println("visit Node(Generic)")
    }
}

main(): Unit {
    let visitor = MyVisitor()

    println("=== Testing Annotation ===")
    visitor.breakTraverse()
    let annotation = Annotation(quote(@When[os == "Linux"]))
    annotation.traverse(visitor)

    println("=== Testing GenericConstraint ===")
    visitor.breakTraverse()
    let interfaceDecl = InterfaceDecl(quote(
        interface Enumerable<U> where U <: Bounded {}
    ))
   let genericConstraint = interfaceDecl.genericConstraint[0]
    genericConstraint.traverse(visitor)

    println("=== Testing Body ===")
    visitor.breakTraverse()
    let classDecl = ClassDecl(quote(
        class A {}
    ))
    let declList = ArrayList<Decl>()
    declList.add(classDecl)
    let body = Body(declList)
    body.traverse(visitor)

    println("=== Testing Argument ===")
    visitor.breakTraverse()
    let callExpr = CallExpr(quote(
        foo(arg: 100)
    ))
    let argument = callExpr.arguments[0]
    argument.traverse(visitor)

    println("=== Testing MatchCase ===")
    visitor.breakTraverse()
    let matchExpr = MatchExpr(quote(
        match (x) {
            case 1 => ()
        }
    ))
    let matchCase = matchExpr.matchCases[0]
    matchCase.traverse(visitor)

    println("=== Testing Constructor ===")
    visitor.breakTraverse()
    let enumDecl = EnumDecl(quote(enum Time{ Day(Int16) | Hour(Int16) }))
    let constructor = enumDecl.constructors[0]
    constructor.traverse(visitor)

    println("=== Testing ImportList ===")
    visitor.breakTraverse()
    let importList = ImportList(quote(import std.collection.*))
    importList.traverse(visitor)

    println("=== Testing ImportContent ===")
    visitor.breakTraverse()
    let importContent = importList.content
    importContent.traverse(visitor)

    println("=== Testing Program ===")
    visitor.breakTraverse()
    let program = parseProgram(quote(
        features {
            linux,
            debug
        }
        package my_pkg
        main() {}
    ))
    program.traverse(visitor)

    println("=== Testing FeaturesDirective ===")
    visitor.breakTraverse()
    let featuresDirective = program.featuresDirective.getOrThrow()
    featuresDirective.traverse(visitor)

    println("=== Testing FeaturesSet ===")
    visitor.breakTraverse()
    let featuresSet = featuresDirective.featuresSet
    featuresSet.traverse(visitor)
}

/* SCAN-IN
=== Testing Annotation ===
visit Annotation
visit Node(Generic)
=== Testing GenericConstraint ===
visit GenericConstraint
visit Node(Generic)
=== Testing Body ===
visit Body
visit Node(Generic)
=== Testing Argument ===
visit Argument
visit Node(Generic)
=== Testing MatchCase ===
visit MatchCase
visit Node(Generic)
=== Testing Constructor ===
visit Constructor
visit Node(Generic)
=== Testing ImportList ===
visit ImportList
visit Node(Generic)
=== Testing ImportContent ===
visit ImportContent
visit Node(Generic)
=== Testing Program ===
visit Program
visit Node(Generic)
=== Testing FeaturesDirective ===
visit FeaturesDirective
visit Node(Generic)
=== Testing FeaturesSet ===
visit FeaturesSet
visit Node(Generic)
*/