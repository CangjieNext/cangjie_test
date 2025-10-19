// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: a/a.cj
// EXEC-0: %compiler %noColor a/a.cj --output-type=staticlib
package A

public class Foo {}


// SEPARATE-FILE: b/b.cj
// EXEC-0: %compiler %noColor b/b.cj --output-type=staticlib
package B

public class Foo {}


// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj libA.a --output-type=chir --output-dir ./c
package cmp

import A

common extend A.Foo {
}


// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
// ASSERT: scan error: 'common' extend 'Foo' can not find 'platform' match
// ASSERT: scan error: 'platform' extend 'Foo' can not find 'common' match
package cmp

import B

platform extend B.Foo {
}
