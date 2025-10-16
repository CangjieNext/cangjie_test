// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c1.cj
package cmp

public func id(x: Int) { return x }

// X depends on Y(via argument)
public let X: Int64 = id(id2(Y))

// SEPARATE-FILE: c/c2.cj
package cmp

public common func id2(x: Int): Int { return x }

public common func foo(): Int { return X } 

// SEPARATE-FILE: c/c3.cj
// EXEC-PIPE-1: %compiler %noColor --experimental c/c1.cj c/c2.cj c/c3.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
package cmp

public func id3(x: Int) { return X }

// Y depends on X(via function body)
public var Y = id2(id3(id(foo())))

/* SCAN
error: variable 'X' is used before initialization
 ==> c/c3.cj:4:34:
  | 
4 | public func id3(x: Int) { return X }
  |                                  ^ 
  | 

1 error generated, 1 error printed.
*/


