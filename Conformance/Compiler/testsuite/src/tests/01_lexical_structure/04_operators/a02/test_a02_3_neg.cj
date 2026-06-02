
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a02_3

  @Level:         1

  @Assertion:    1.4(2) @ Macro call expression
                  
  @Description:  Emit error with wrong macros name

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

import utils.macros.*

main() {
      let e = "EXPECTED"
      @mtchOrThrow ["EXPECTED"]  (e)

}
