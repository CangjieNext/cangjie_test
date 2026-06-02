// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    public var funcNames: ArrayList<String> = ArrayList<String>(0)
    public var funcDecls: ArrayList<FuncDecl> = ArrayList<FuncDecl>(0)
    public var varNames: ArrayList<String> = ArrayList<String>(0)
    public var varDecls: ArrayList<VarDecl> = ArrayList<VarDecl>(0)

    public override func visit(d: FuncDecl) {
        let name = d.identifier.value
        funcNames.add(name)
        funcDecls.add(d)
        return
    }

    public override func visit(d: VarDecl) {
        let name = d.identifier.value
        varNames.add(name)
        varDecls.add(d)
        return
    }
}

main(): Int64 {
    let input = quote(
	class Data {
        var a: Int64 = 1
        var b: Int64 = 2
        init(a_: Int64, b_: Int64) {
            this.a = a_
            this.b = b_
		}
        func getA() {
            func testa(): Int64 {
		        return 19
	        }
			let t = testa()
			return a + t
		}
		func getB() {
			func testb(): Int64 {
				return 42
			}
			let t = testb()
			return b + t
		}
	})
    let decl = parseDecl(input)

    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)

    // check myVisitor.
    if (myVisitor.funcNames.size != myVisitor.funcDecls.size || myVisitor.varNames.size != myVisitor.varDecls.size) {
        return 1
    }
    // func names: init, getA, testa, getB, testB
    let funcNamesSize = myVisitor.funcNames.size
    if (funcNamesSize != 5) {
        print("funcNames size is ${funcNamesSize}, supposed to be 5\n")
        return 2
    }
    if (myVisitor.funcNames[0] != "init" || myVisitor.funcNames[2] != "testa") {
        return 3
    }
    // var names: a, b, t, t
    let varNamesSize = myVisitor.varNames.size
    if (varNamesSize != 4) {
        print("varNamesSize size is ${varNamesSize}, supposed to be 5\n")
        return 4
    }
    if (myVisitor.varNames[1] != "b" || myVisitor.varNames[3] != "t") {
        return 5
    }
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
