// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

@Deprecated
public common struct A {
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


// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-0: %compiler %diag_json --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib 2>&1 | compare %f
package cmp

public specific struct A {
    public specific let name: String = "string"
    public specific init() {}
    public specific prop NAME: String {
        get() { name }
    }
    public specific func foo(): Unit {}
    public specific operator func == (_: A): Bool { true }
}

/* SCAN
*/
