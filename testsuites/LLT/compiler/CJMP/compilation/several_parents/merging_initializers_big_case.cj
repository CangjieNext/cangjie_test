// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


//        a
//      /| \
//     / |  \
//    b  c   e
//    \  /  /\
//     d   f  g
//     |   / /
//     \  / /
//      \/ /
//       h

// SEPARATE-FILE: a/a.cj
// EXEC-0: %compiler %noColor --experimental a/a.cj --output-type=chir --output-dir=a
package cmp

public let a = "a"
public common let x = "x_a"

// SEPARATE-FILE: b/b.cj
// EXEC: %compiler %noColor --experimental b/b.cj a/cmp.chir --common-part-cjo=./a/cmp.cjo --output-type=chir --output-dir=b
package cmp

public let b = "b"

// SEPARATE-FILE: c/c.cj
// EXEC: %compiler %noColor --experimental c/c.cj a/cmp.chir --common-part-cjo=./a/cmp.cjo --output-type=chir --output-dir=c
package cmp

public let c = "c"
public specific let x = "x_c"

// SEPARATE-FILE: d/d.cj
// EXEC: %compiler %noColor --experimental d/d.cj b/cmp.chir c/cmp.chir --common-part-cjo=b/cmp.cjo --common-part-cjo=c/cmp.cjo --output-type=chir --output-dir=d
package cmp

public let d = "d"

// SEPARATE-FILE: e/e.cj
// EXEC: %compiler %noColor --experimental e/e.cj a/cmp.chir --common-part-cjo=./a/cmp.cjo --output-type=chir --output-dir=e
package cmp

public let e = "e"
public common let z = "z_e"

// SEPARATE-FILE: f/f.cj
// EXEC: %compiler %noColor --experimental f/f.cj e/cmp.chir --common-part-cjo=./e/cmp.cjo --output-type=chir --output-dir=f
package cmp

public let f = "f"
public specific let x = "x_f"
public common let y = "y_f"
public specific let z = "z_f"

// SEPARATE-FILE: g/g.cj
// EXEC: %compiler %noColor --experimental g/g.cj e/cmp.chir --common-part-cjo=./e/cmp.cjo --output-type=chir --output-dir=g
package cmp

public let g = "g"

// SEPARATE-FILE: h/h.cj
// EXEC: %compiler %noColor --experimental h/h.cj d/cmp.chir f/cmp.chir g/cmp.chir --common-part-cjo=d/cmp.cjo --common-part-cjo=f/cmp.cjo --common-part-cjo=g/cmp.cjo --output-type=dylib
package cmp

public let h = "h"
public specific let x = "x_h"
public specific let y = "y_h"

// SEPARATE-FILE: main.cj
// EXEC: %compiler %noColor --test main.cj -lcmp -L. -o %output
// RUN: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
  println(a)
  println(b)
  println(c)
  println(d)
  println(e)
  println(f)
  println(g)
  println(h)

  println(x)
  println(y)
  println(z)
}

/* SCAN
a
b
c
d
e
f
g
h

x_h
y_h
z_f
*/

