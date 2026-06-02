/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_10_a08_01

  @Level:         1

  @Assertion:   2.1.10(8) structs can implement interfaces.

  @Description: Checks that it is possible for struct to implement interfaces.

  @Mode:        run
  @Negative:    no
  @Structure:   single

*/

import utils.assert.Assert

interface Interface {
    func f(): Int8 { 127i8 
    }
}

struct Struct1 <: Interface {
    public Struct1() {
    }
}

struct Struct2 <: Interface {
    public Struct2() {
    }

    public func f(): Int8 { -128i8 
    }
}

main() {
    // Test case 1
    Assert.equals(127, Struct1().f(), 
        reason: "Test case 1 FAILED.");

    // Test case 2
    Assert.equals(-128, Struct2().f(), 
        reason: "Test case 2 FAILED.");

    return 0;
}

