// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*

main(): Int64 {
    // vardecl
    var tks = quote(
    @When[!debug]
    @Frozen
    var A = 1)
    var d = parseDecl(tks)
    d.dump()

    // funcdecl
    tks = quote(
    @When[!test]
    @Frozen
    func A(){
        return 0
    })
    d = parseDecl(tks)
    d.dump()

    // funcdecl
    tks = quote(
    @!aaa["test"]
    @!aaa["11"]
    func A(){
        return 0
    })
    d = parseDecl(tks)
    d.dump()

    // extendDecl
    tks = quote(
    @!aaa["test"]
    @!aaa["11"]
    extend String {
        func foo(){}
    })
    d = parseDecl(tks)
    d.dump()

    // init
    tks = quote(
    struct R {
        let w: Int64

        @!aaa["test"]
        @!aaa["11"]
        public init(w: Int64) { 
            this.w = w
        }
    })
    d = parseDecl(tks)
    d.dump()

    tks = quote(
    struct Rectangle {
        @!aaa["test"]
        @!aaa["11"]
        public Rectangle(let width: Int64, let height: Int64) {}
    }
    )
    d = parseDecl(tks)
    d.dump()

    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
