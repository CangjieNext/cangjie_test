/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a03_01

  @Level:         1

  @Assertion:    12.1.2(3) A resource is in general an object in Cangjie.

  @Description:  Checks the resource is an object in Cangjie.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

public class TestA0301 <: Resource {
    var res_closed : Bool = false
    public func isClosed() : Bool {
        return res_closed
    }
    public func close() : Unit {
        res_closed = true    
    }
}

main() {
    Assert.isTrue(TestA0301() is Object)
}
