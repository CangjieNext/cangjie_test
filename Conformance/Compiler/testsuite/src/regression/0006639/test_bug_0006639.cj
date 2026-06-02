/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            bug_0006639
  @Assertion:       Compilation error typo "defintion" "Declareation"

  @Description:     Check that a compilation error doesn't contain the listed misspelled words.

  @Mode:            compileonly
  @Negative:        yes
  @Structure:       single

  @Comment:         CompilerBug v0.38.2
*/

import utils.assert.Assert

@Differentiable func f16 (x: Float16): Float16 {x}

main() {}
