/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

import std.ast.{Visitor, FeaturesDirective, Node}

class MyVisitor1 <: Visitor {
    public override func visit(_: FeaturesDirective) {
        println("Visiting FeaturesDirective")
    }
}

class MyVisitor2 <: Visitor {
    public override func visit(_: Node) {
        println("Visiting Node")
    }
}

main(): Unit {
    let featuresDirective = FeaturesDirective()

    featuresDirective.traverse(MyVisitor1())
    featuresDirective.traverse(MyVisitor2())
}

/* SCAN
Visiting FeaturesDirective
Visiting Node
Visiting Node
*/