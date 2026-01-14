// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c1.cj
package cmp

public func id(x: Int) { return x }

// X depends on Y
public let X: Int64 = depY()

// SEPARATE-FILE: c/c2.cj
// EXEC-0: %compiler %noColor --experimental c/c1.cj c/c2.cj --output-type=chir --output-dir ./c
package cmp

public common var Y: Int = 1

private let Z = Y

func depY(): Int { return id2(id(getY())) }

// NOTE: dependency going through private non exportable declarations
private func id2(x: Int): Int { return x } 

private func getYviaZ(): Int { return Z }

private func getY(): Int { return getYviaZ() }


// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
package cmp

// Y depends on X
public specific var Y: Int = id(X)

/* SCAN
error: p.cj and c2.cj and c1.cj might have file circular dependency
1 error generated, 1 error printed.
*/


