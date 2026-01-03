// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

@Deprecated
public common class A {
    @Deprecated
    public common let name: String
    @Deprecated
    public common init()
    @Deprecated
    public common prop NAME: String
    @Deprecated
    public common func foo(): Unit
    @Deprecated
    public common operator func == (_: A): Bool
}

common extend A {
    common func doo(): Unit
}

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib 2>&1 | compare %f
// ASSERT: scan sema_platform_has_deprecated_annotation
package cmp

@Deprecated
public platform class A {
    @Deprecated
    public platform let name: String = "string"
    @Deprecated
    public platform init() {}
    @Deprecated
    public platform prop NAME: String {
        get() { name }
    }
    @Deprecated
    public platform func foo(): Unit {}
    @Deprecated
    public platform operator func == (_: A): Bool { true }
}

platform extend A {
    platform func doo() {}
}

