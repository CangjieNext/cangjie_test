//  Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information. 
 
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

// here it is important to have Range type
public common func faf(fafParam!: Range<Int> = 1..2) { fafParam }

// SEPARATE-FILE: p/p.cj
// EXEC: %compiler %diag_json --experimental --common-part-cjo=c/cmp.cjo --common-part-chir=c/cmp.chir p/p.cj --output-type=dylib 2>&1 | compare %f
package cmp
 
public specific func faf(fafParam!: Range<Int> = 10..20) { fafParam }

// ASSERT: scan sema_cjmp_parameter_default_value_both_sides
