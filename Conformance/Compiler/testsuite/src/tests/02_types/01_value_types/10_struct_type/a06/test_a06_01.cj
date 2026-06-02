/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_10_a06_01

  @Level:         1

  @Assertion:   2.1.10(6)
                Of course, it is possible to override the == (or !=) operator 
                (see section operator overloading) to make custom struct types support == (or !=).

  @Description: Checks that it is possible to overload the '==' operator for struct type.

  @Mode:        run
  @Negative:    no
  @Structure:   single

*/

import utils.assert.Assert

struct Struct {
    var member: Int32;
    public Struct(param: Int32) {
        this.member = param;
    }

    operator func ==(toCompare: Struct) { 
        return toCompare.member == this.member;
    }
}


main() {
    // Test case 1
    Assert.equals(true, Struct(10) == Struct(10), 
        reason: "Test case 1 FAILED.");

    // Test case 2
    var struct1: Struct = Struct(10);
    var struct2: Struct = Struct(10);
    Assert.equals(true, struct1 == struct2, 
        reason: "Test case 2 FAILED.");

    // Test case 3
    Assert.equals(false, Struct(10) == Struct(11), 
        reason: "Test case 3 FAILED.");

    // Test case 4
    var struct3: Struct = Struct(10);
    var struct4: Struct = Struct(11);
    Assert.equals(false, struct3 == struct4, 
        reason: "Test case 4 FAILED.");

    return 0;
}

