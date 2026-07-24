// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A binding pattern covers every remaining sibling case, regardless of pattern form.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f


func bindingThenConstant(value: Int64) {
    match (value) {
        case captured => 0
        case 1 => 1
        case 2 => 2
        case _ => 3
    }
}

/* SCAN
warning: unreachable pattern
  ==> binding_pattern_followed_by_constant.cj:14:14:
   | 
14 |         case 1 => 1
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> binding_pattern_followed_by_constant.cj:15:14:
   | 
15 |         case 2 => 2
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> binding_pattern_followed_by_constant.cj:16:14:
   | 
16 |         case _ => 3
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
