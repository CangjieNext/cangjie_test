// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// case: specific decls inherit @Deprecated from common decls. No error for specific if @Deprecated is used on common.
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

@Annotation
public class Anno {
    public const init() {}
}

@Anno public common let v0: Int64

@Anno public common func f0(): Int64 { 1 }

@Anno public common class A { A(){} }

@Anno public common struct B { B(){} }

@Anno public common interface I {}

@Anno public common enum E { R | G | B }

@Frozen public common func f1(): Int64

public common func f2(): Int64

common func jj(): Int

@Attribute["TEST_REGISTER"] common func attrs(): Int

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %diag_json --error-count-limit=100 --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib 2>&1 | compare %f
// ASSERT: scan-1 sema_common_specific_annotation_not_allowed
// ASSERT: scan-8 sema_specific_has_different_annotation
package cmp
public specific let v0: Int64 = 1

public specific func f0(): Int64 { 0 }

public specific class A {}

public specific struct B {}

public specific interface I {}

public specific enum E { R | G | B }

public specific func f1(): Int64 { 0 }

@Frozen public specific func f2(): Int64 { 0 }

@EnsurePreparedToMock specific func jj() { 0 }

@Attribute[kk] specific func attrs() { 1 }
