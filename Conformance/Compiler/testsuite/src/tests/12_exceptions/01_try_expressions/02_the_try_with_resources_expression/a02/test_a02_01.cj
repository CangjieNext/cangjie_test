/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a02_01

  @Level:         1

  @Assertion:    12.1.2(2) In a try-with-resources expression, one or more ResourceSpecifications are defined
                           between the keyword try and its following block.

  @Description:  Checks that some number of resource specification can be defined after try keyword.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

public class TestA0201 <: Resource {
    var res_closed : Bool = false
    public func isClosed() : Bool {
        return res_closed
    }
    public func close() : Unit {
        res_closed = true    
    }
}

main() {
    let res1 = TestA0201()
    let res2 = TestA0201()
    let res3 = TestA0201()
    let e = try (r1 = res1, r2 = res2, r3 = res3) {
        Assert.isFalse(r1.isClosed())
        Assert.isFalse(r2.isClosed())
        Assert.isFalse(r3.isClosed())
    }
}
