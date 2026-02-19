// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
@NonProduct
features { os.windows }

package cmp

common func foo() { 1 }

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=chir --output-dir p 2>&1 | compare %f
features { os.linux }

package cmp

specific func foo() { 2 }

/*SCAN
error: parent feature set must be subset of child feature set, package: 'cmp', file with conflicted features: 'c/c.cj'
 ==> (package cmp)c.cj:1:1:
  # note: Extra feature from common part file: 'os.windows' 
note: Conflicting specific feature set:
 ==> p/p.cj:2:1:
  | 
2 | features { os.linux }
  | ^^^^^^^^^^^^^^^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/
