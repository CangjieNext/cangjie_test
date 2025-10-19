// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: a/a.cj
// EXEC-0: %compiler %noColor a/a.cj --output-type=staticlib
package A

public class Foo {}


// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj libA.a --output-type=chir --output-dir ./c
package cmp

import A

common extend A.Foo {
    common func foo():Unit {}
}


// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

import A.*

platform extend Foo {
    platform func foo():Unit {}
}
