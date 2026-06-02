/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_a02_051

  @Level:         1

  @Assertion:    1.3(2) Literals also have types. The types that have literals in Cangjie
                 include: integer types, floating point types, character type, boolean type
                 and string type.

  @Description:  Checks that:
                 - literal, defined with IntegerLiteralSuffix for type Int8, has expected integer value.
                 - immutable variable, assigned by literal with IntegerLiteralSuffix for type Int8,
                   has expected integer value.
                 - mutable variable, assigned by literal with IntegerLiteralSuffix for type Int8,
                   has expected integer value.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.*

main(){
    Assert.equals(127, 127i8, reason: "Test case 1 failed.");

    Assert.equals(-128, -128i8, reason: "Test case 2 failed.");

    let immutable_var = -128i8;
    Assert.equals(-128, immutable_var, reason: "Test case 3 failed.");

    var mutable_var = 127i8;
    Assert.equals(127, mutable_var, reason: "Test case 4 failed.");

    return 0;
}

