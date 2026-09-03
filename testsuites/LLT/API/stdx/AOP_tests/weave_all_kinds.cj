/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// One compile covers the three weaveFuncBody arms: InsertAtEntry (with params),
// InsertAtExit (lambda is skipped, exit is instrumented), and ReplaceFuncBody
// for both args.size == 1 and args.size != 1.

// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan entry:ok\nenter-body\nlambda\nexit-body\n#----- exit -----#\nwrap1\norig1\n1\nwrap2\norig2\nnine\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

@InsertAtEntry[packageName: "default", className: "", methodName: "enterTarget", isStatic: false,
    recursive: false, funcTypeStr: "(std.core.String)->Unit"]
public func enterAspect(x: String): Unit {
    println("entry:${x}")
}

@InsertAtExit[packageName: "default", className: "", methodName: "exitTarget", isStatic: false,
    recursive: false, funcTypeStr: "()->Unit"]
public func exitAspect(): Unit {
    println("#----- exit -----#")
}

@ReplaceFuncBody[packageName: "default", className: "", methodName: "replaceOne", isStatic: false,
    recursive: false]
public func wrapOne(original: () -> Int64): Int64 {
    println("wrap1")
    original()
}

@ReplaceFuncBody[packageName: "default", className: "", methodName: "replaceTwo", isStatic: false,
    recursive: false]
public func wrapTwo(x: String, original: (String) -> String): String {
    println("wrap2")
    original(x)
}

public func enterTarget(x: String): Unit {
    println("enter-body")
}

public func exitTarget(): Unit {
    let f = { =>
        println("lambda")
    }
    f()
    println("exit-body")
}

public func replaceOne(): Int64 {
    println("orig1")
    1
}

public func replaceTwo(x: String): String {
    println("orig2")
    x
}

main() {
    enterTarget("ok")
    exitTarget()
    println(replaceOne())
    println(replaceTwo("nine"))
    0
}
