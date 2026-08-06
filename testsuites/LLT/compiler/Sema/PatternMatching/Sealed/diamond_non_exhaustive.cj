// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A sealed descendant keeps the wildcard fallback reachable across a diamond hierarchy.
// ERRCHECK: %compiler %cmp_opt %f -o %output

sealed interface Root {}

sealed interface Left <: Root {}

sealed interface Right <: Root {}

class Leaf <: Left & Right {}

class Other <: Root {}

func diamondMissingLeaf(value: Root) {
    match (value) {
        case _: Other => 0
    }
}

main() {
    diamondMissingLeaf(Other())
}

/* SCAN
error: non-exhaustive patterns
  ==> diamond_non_exhaustive.cj:21:12:
   | 
21 |     match (value) {
   |            ^^^^^ the selector is of type 'Interface-Root'
   | 
   # note: _ is not covered

1 error generated, 1 error printed.
*/
