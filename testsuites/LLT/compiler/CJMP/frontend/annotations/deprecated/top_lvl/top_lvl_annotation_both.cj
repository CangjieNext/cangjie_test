// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

@Deprecated
public common interface fofo {
    @Deprecated
    common func jojo(): Unit
}
@Deprecated
public common func foo(): Unit
@Deprecated
public common let glob: Bool = true


// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib 2>&1 | compare %f
// ASSERT: scan sema_platform_has_deprecated_annotation
package cmp

@Deprecated
public platform interface fofo {
    platform func jojo(): Unit {}
}
@Deprecated
public platform func foo(): Unit {}
@Deprecated
public platform let glob: Bool = true
