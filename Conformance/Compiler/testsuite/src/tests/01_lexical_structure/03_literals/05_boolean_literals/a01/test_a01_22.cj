/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_05_a01_22

  @Level:         1

  @Assertion:    1.3.5(1) There are only two Boolean literals: true and false.
                 booleanLiteral : 'true' | 'false' ;

  @Description:  Checks that Boolean literal true has the same value which is produced
                 by the '==' operator with equal operands.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

main(){

    Assert.equals(1 == 1, true);
    return 0;
}

