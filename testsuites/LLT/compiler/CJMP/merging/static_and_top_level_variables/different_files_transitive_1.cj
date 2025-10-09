// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c1.cj
package cmp

public func id(x: Int) { return x }

public let X: Int64 = id(id2(Y))

// SEPARATE-FILE: c/c2.cj
package cmp

public func id2(x: Int) { return x }

// SEPARATE-FILE: c/c3.cj
// EXEC-0: %compiler %noColor --experimental c/c1.cj c/c2.cj c/c3.cj --output-type=chir --output-dir ./c
package cmp

public common let Y: Int64 = 1

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
package cmp

public func id3(x: Int) { return x }

// NOTE:
// Y depends on X
// however in common part already fixed that X depends on Y
public platform let Y: Int64 = id2(id3(id(X)))

/* SCAN
error: p.cj and c1.cj might have file circular dependency
1 error generated, 1 error printed.
*/

