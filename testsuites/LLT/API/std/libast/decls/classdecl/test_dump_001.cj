// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: ClassDecl) {
        ident.add(curNode.identifier.value)
        breakTraverse()
    }
    public override func visit(curNode: VarDecl) {
        ident.add(curNode.identifier.value)
    }
}

class NoBreakVisitor <: Visitor {
    var identNum = 0
    public override func visit(curNode: ClassDecl) {
        identNum++
    }
    public override func visit(curNode: VarDecl) {
        identNum++
    }
}

let myVisitor = MyVisitor()
let noBreakVisitor = NoBreakVisitor()

main(): Int64 {
    let input = quote(
        public open class A<T> <: T1 & T2 & T3 where T <: Comparable<T> & ToString {
            let a = 10
            var count =  0
            var res = ""
            let arr1 = [1,2,3,4,5]
            let arr2 = [a,a,a,10]

            init(res: String, count: int64) {
                super(res, count)
                this.res = res
                this.count = count
            }
       }
    )
    let classDecl = match (parseDecl(input) as ClassDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    classDecl.traverse(myVisitor)
    classDecl.traverse(noBreakVisitor)
    let modifiers = classDecl.modifiers
    if (modifiers.size != 2) {
        return 1
    }
    if (modifiers[0].keyword.value != "public" || modifiers[1].keyword.value != "open") {
        return 2
    }

    let output = quote($classDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 3
    }
    if (myVisitor.ident.size != 1) {
        return 4
    }
    if (noBreakVisitor.identNum != 6) {
        return 5
    }
    classDecl.dump()

    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
