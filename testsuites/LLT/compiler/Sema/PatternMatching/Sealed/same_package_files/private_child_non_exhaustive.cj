// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: missing_private_child.cj
// ERRCHECK: %frontendCompiler %cmp_opt %typecheck %f missing_private_child.cj

sealed interface MissingRoot {}

class MissingVisible <: MissingRoot {}

func classifyMissing(value: MissingRoot): Int64 {
    match (value) {
        case _: MissingVisible => 0
    }
}

/* SCAN
error: non-exhaustive patterns
  ==> private_child_non_exhaustive.cj:15:12:
   | 
15 |     match (value) {
   |            ^^^^^ the selector is of type 'Interface-MissingRoot'
   | 
   # note: Class-MissingHidden is not covered

1 error generated, 1 error printed.
*/
