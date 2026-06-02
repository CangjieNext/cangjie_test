/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.{Visitor, Annotation, Constructor}
internal import std.collection.ArrayList

class MyVisitor <: Visitor {
    public override func visit(_: Constructor) {
        println("Inside Constructor")
    }
}

main() {
    let annotations = ArrayList<Annotation>([Annotation(quote(@!Anno0)), Annotation(quote(@!Anno1))])
    let constructor = Constructor()
    constructor.annotations = annotations
    constructor.toTokens() |> println
    constructor.traverse(MyVisitor())
}

/* SCAN
@!Anno0
@!Anno1

Inside Constructor
*/