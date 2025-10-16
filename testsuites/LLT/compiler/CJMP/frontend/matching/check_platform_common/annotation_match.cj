// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
@Deprecated public common let v0: Int64

@Deprecated public common func f0(): Int64 { 1 }

@Deprecated public common class A {}

@Deprecated public common struct B {}

@Deprecated public common interface I {}

@Deprecated public common enum E { R | G | B }

@Frozen public common func f1(): Int64

public common func f2(): Int64

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib 2>&1 | compare %f
// ASSERT: scan-3 sema_platform_has_different_annotation
// ASSERT: scan-5 sema_not_matched
package cmp
public platform let v0: Int64 = 1

public platform func f0(): Int64 { 0 }

public platform class A {}

public platform struct B {}

public platform interface I {}

public platform enum E { R | G | B }

public platform func f1(): Int64 { 0 }

@Frozen public platform func f2(): Int64 { 0 }


