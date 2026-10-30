// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 1
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir=c
package cmp

public common class C {
    public init() {}
}
public common struct S {
    public init() {}
}
public common interface I {}
public common enum E {
    Value(Int64)
}

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental p/p.cj --common-part-cjo=c/cmp.cjo --common-part-chir=c/cmp.chir --output-type=staticlib 2>&1 | compare %f
package cmp

public specific class C<R> {}
public specific struct S<R> {}
public specific interface I<R> {}
public specific enum E<R> {
    Value(Int64)
}

// ASSERT: scan-4 sema_specific_has_different_generic_parameter_count
// ASSERT: scan 'specific' class 'C' type parameter count is 1, but its 'common' declaration requires 0
// ASSERT: scan 'specific' struct 'S' type parameter count is 1, but its 'common' declaration requires 0
// ASSERT: scan 'specific' interface 'I' type parameter count is 1, but its 'common' declaration requires 0
// ASSERT: scan 'specific' enum 'E' type parameter count is 1, but its 'common' declaration requires 0
// ASSERT: scan-4 'common' declaration is here
// ASSERT: scan-not sema_not_matched
// ASSERT: scan-not Internal Compiler Error
