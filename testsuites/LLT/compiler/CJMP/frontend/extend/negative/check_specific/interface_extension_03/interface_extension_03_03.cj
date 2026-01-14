// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common interface I1 {}
common interface I2 {}
common interface I3 {}
interface I4 {}

common class Foo { init() {} }

common extend Foo {}
common extend Foo <: I1 & I2 {}
common extend Foo <: I3 {}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

specific interface I1 {}
specific interface I2 {}
specific interface I3 {}
specific class Foo {}

specific extend Foo {}
specific extend Foo <: I2 & I1 {}
specific extend Foo <: I3 {}
