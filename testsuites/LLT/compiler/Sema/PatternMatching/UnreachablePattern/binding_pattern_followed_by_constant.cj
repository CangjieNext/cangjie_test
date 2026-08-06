// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Binding patterns cover every remaining sibling case, regardless of identifier spelling.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f

const MatchValue = 1
const CalculatedValue = 2 + 3

func bindingThenConstant(value: Int64) {
    match (value) {
        case captured => 0
        case 1 => 1
        case 2 => 2
        case _ => 3
    }
}

func capitalizedBindingThenConstant(value: Int64): Int64 {
    return match (value) {
        case MatchValue => 0
        case 1 => 1
        case _ => 2
    }
}

func calculatedBindingThenConstant(value: Int64): Int64 {
    return match (value) {
        case CalculatedValue => 0
        case 5 => 1
        case _ => 2
    }
}

/* SCAN
warning: unreachable pattern
  ==> binding_pattern_followed_by_constant.cj:16:14:
   | 
16 |         case 1 => 1
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> binding_pattern_followed_by_constant.cj:17:14:
   | 
17 |         case 2 => 2
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> binding_pattern_followed_by_constant.cj:18:14:
   | 
18 |         case _ => 3
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> binding_pattern_followed_by_constant.cj:25:14:
   | 
25 |         case 1 => 1
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> binding_pattern_followed_by_constant.cj:26:14:
   | 
26 |         case _ => 2
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> binding_pattern_followed_by_constant.cj:33:14:
   | 
33 |         case 5 => 1
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> binding_pattern_followed_by_constant.cj:34:14:
   | 
34 |         case _ => 2
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

7 warnings generated, 7 warnings printed.
*/
