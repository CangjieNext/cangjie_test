// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
@NonProduct
features { parent.feature }

package cmp

common func foo() { 1 }

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=chir --output-dir p 2>&1 | compare %f
features { }

package cmp

specific func foo() { 2 }

/*SCAN
error: parent feature set must be subset of child feature set, package: 'cmp', file with conflicted features: 'c/c.cj'
 ==> (package cmp)c.cj:1:1:
  # note: Extra feature from common part file: 'parent.feature' 
note: Conflicting specific feature set:
 ==> p/p.cj:3:1:
  | 
3 | features { }
  | ^^^^^^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/

// SEPARATE-FILE: c/c2.cj
// EXEC-0: %compiler %noColor --experimental c/c2.cj --output-type=chir --output-dir ./c
@NonProduct
features { parent.feature }

package cmp2

common func foo() { 1 }

// SEPARATE-FILE: p/p2.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p2.cj c/cmp2.chir --common-part-cjo=./c/cmp2.cjo --output-type=chir --output-dir p 2>&1 | compare %f
package cmp2

specific func foo() { 2 }
/*SCAN
error: parent feature set must be subset of child feature set, package: 'cmp2', file with conflicted features: 'c/c2.cj'
 ==> (package cmp2)c2.cj:1:1:
  # note: Extra feature from common part file: 'parent.feature' 

1 error generated, 1 error printed.
*/