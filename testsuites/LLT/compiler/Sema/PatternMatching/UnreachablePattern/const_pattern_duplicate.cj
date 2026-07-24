// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Capitalized identifiers in these patterns are bindings, not references to const declarations.
// Each binding covers every later sibling case.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f


const MatchValue = 1
const CalculatedValue = 2 + 3

func constValueDuplicate(value: Int64): Int64 {
    return match (value) {
        case MatchValue => 0
        case 1 => 1
        case _ => 2
    }
}

func constArithmeticDuplicate(value: Int64): Int64 {
    return match (value) {
        case CalculatedValue => 0
        case 5 => 1
        case _ => 2
    }
}

/* SCAN
warning: unreachable pattern
  ==> const_pattern_duplicate.cj:18:14:
   | 
18 |         case 1 => 1
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> const_pattern_duplicate.cj:19:14:
   | 
19 |         case _ => 2
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> const_pattern_duplicate.cj:26:14:
   | 
26 |         case 5 => 1
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> const_pattern_duplicate.cj:27:14:
   | 
27 |         case _ => 2
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

4 warnings generated, 4 warnings printed.
*/
