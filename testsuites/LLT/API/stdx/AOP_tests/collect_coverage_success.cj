/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Collect-only: exercise success branches that error-only AOP tests never hit.
// - @Marker skip (non-AOP custom anno continue)
// - isGlobalVarsChecked / annoinfo Append across multiple aspects
// - successful @ReplaceFuncBody (funcTypeStr from last parameter, empty aspectParams)
// - successful @ReplaceFuncBody with extra params (type-string equality)
// - instance-member @InsertAtEntry with params (strip this / funcExplicitParamSize)
// - instance-member @ReplaceFuncBody (strip this before empty-aspectParams check)
// - aspect in `extend CA` (ExtendDef + CustomType)

// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt -Woff unused %f -o %output %collect_aspects_plugin && grep -q 'ReplaceFuncBody' default-default.annoinfo && grep -q 'InsertAtEntry' default-default.annoinfo
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan collected\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

@Annotation
public class Marker {
    public const init() {}
}

@Marker
@InsertAtEntry[packageName: "default", className: "", methodName: "g1", isStatic: false,
    recursive: false, funcTypeStr: "()->Unit"]
public func a1(): Unit {}

@InsertAtEntry[packageName: "default", className: "", methodName: "g2", isStatic: false,
    recursive: false, funcTypeStr: "(Int64)->Unit"]
public func a2(x: Int64): Unit {}

@ReplaceFuncBody[packageName: "default", className: "", methodName: "g3", isStatic: false,
    recursive: false]
public func rOnly(original: () -> Unit): Unit {
    original()
}

@ReplaceFuncBody[packageName: "default", className: "", methodName: "g4", isStatic: false,
    recursive: false]
public func rParams(x: Int64, original: (Int64) -> Int64): Int64 {
    original(x)
}

public class CA {
    @InsertAtEntry[packageName: "default", className: "CA", methodName: "foo", isStatic: false,
        recursive: false, funcTypeStr: "(std.core.String)->Unit"]
    public func insAspect(x: String): Unit {}

    @ReplaceFuncBody[packageName: "default", className: "CA", methodName: "bar", isStatic: false,
        recursive: false]
    public func insReplace(original: () -> Unit): Unit {
        original()
    }

    public func foo(y: String): Unit {}
    public func bar(): Unit {}
}

open class CB {}
extend CB {
    @InsertAtEntry[packageName: "default", className: "CB", methodName: "baz", isStatic: false,
        recursive: false, funcTypeStr: "()->Unit"]
    public func extAspect(): Unit {}

    public func baz(): Unit {}
}

public func g1(): Unit {}
public func g2(x: Int64): Unit {}
public func g3(): Unit {}
public func g4(x: Int64): Int64 { x }

main() {
    println("collected")
    0
}
