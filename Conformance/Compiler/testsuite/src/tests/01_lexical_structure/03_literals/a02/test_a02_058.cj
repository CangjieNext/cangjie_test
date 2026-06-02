/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_a02_058

  @Level:         1

  @Assertion:    1.3(2) Literals also have types. The types that have literals in Cangjie
                 include: integer types, floating point types, character type, boolean type
                 and string type.

  @Description:  Checks that:
                 - literal, defined with IntegerLiteralSuffix for type UInt64, has expected integer value.
                 - immutable variable, assigned by literal with IntegerLiteralSuffix for type UInt64,
                   has expected integer value.
                 - mutable variable, assigned by literal with IntegerLiteralSuffix for type UInt64,
                   has expected integer value.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.*

main(){
    Assert.equals(127, 127u64, reason: "Test case 1 failed.");

    Assert.equals(18446744073709551615, 18446744073709551615u64, reason: "Test case 2 failed.");

    let immutable_var = 127u64;
    Assert.equals(127, immutable_var, reason: "Test case 3 failed.");

    var mutable_var = 18446744073709551615u64;
    Assert.equals(18446744073709551615, mutable_var, reason: "Test case 4 failed.");

    return 0;
}

