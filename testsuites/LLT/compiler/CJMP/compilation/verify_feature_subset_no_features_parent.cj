// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
@NonProduct
features { }

package cmp

common func foo() { 1 }

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir p
features { child.feature }

package cmp

specific func foo() { 2 }

// SEPARATE-FILE: c/c2.cj
// EXEC-0: %compiler %noColor --experimental c/c2.cj --output-type=chir --output-dir ./c
package cmp2

common func foo1() { 1 }

// SEPARATE-FILE: p/p2.cj
// EXEC-0: %compiler %noColor --experimental p/p2.cj --common-part-chir=c/cmp2.chir --common-part-cjo=./c/cmp2.cjo --import-path=./p/ --output-type=chir --output-dir p
features { child.feature }
package cmp2

import cmp.*

specific func foo1() { 2 }
