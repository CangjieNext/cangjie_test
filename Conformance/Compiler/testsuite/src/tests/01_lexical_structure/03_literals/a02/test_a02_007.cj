/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_a02_007

  @Level:         1

  @Assertion:    1.3(2) Literals also have types. The types that have literals in Cangjie
                 include: integer types, floating point types, character type, boolean type
                 and string type.

  @Description:  Checks that:
                 - literal, defined with IntegerLiteralSuffix for type Int64, has type Int64.
                 - immutable variable, assigned by literal with IntegerLiteralSuffix for type Int64,
                   has type Int64.
                 - mutable variable, assigned by literal with IntegerLiteralSuffix for type Int64,
                   has type Int64.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.*

main(){
    var isExpectedType:Bool = -9223372036854775808i64 is Int64;
    Assert.isTrue(isExpectedType) 

    let immutable_var = 9223372036854775807i64;
    isExpectedType = immutable_var is Int64;
    Assert.isTrue(isExpectedType);

    var mutable_var = 9920000i64;
    isExpectedType = mutable_var is Int64;
    Assert.isTrue(isExpectedType);

    return 0;
}

