// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Nested relative-common: p1 introduces a default; p2 ({p1,p2}) writes another.
// Must conflict — same rule as common+specific both_sides, after p1 demotes to
// relative common.

// NOTE: p0
// SEPARATE-FILE: p0/p0.cj
// EXEC-0: %compiler %noColor --experimental p0/p0.cj --output-type=chir --output-dir=p0
@NonProduct
features { }
package cmp

public common func f(x!: Int64): Int64

// NOTE: p1
// SEPARATE-FILE: p1/p1.cj
// EXEC: %compiler %noColor --experimental p1/p1.cj --common-part-chir=p0/cmp.chir --common-part-cjo=./p0/cmp.cjo --output-type=chir --output-dir=p1
@NonProduct
features { p1 }
package cmp

public specific func f(x!: Int64 = 10) { x }

// NOTE: p2
// SEPARATE-FILE: p2/p2.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental p2/p2.cj --common-part-chir=p1/cmp.chir --common-part-cjo=./p1/cmp.cjo --output-type=chir --output-dir=p2 2>&1 | compare %f
// ASSERT: scan sema_cjmp_parameter_default_value_both_sides
@NonProduct
features { p1, p2 }
package cmp

public specific func f(x!: Int64 = 20) { x + 100 }
