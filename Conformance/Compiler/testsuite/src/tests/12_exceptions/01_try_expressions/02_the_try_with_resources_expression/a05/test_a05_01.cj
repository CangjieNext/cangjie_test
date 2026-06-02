/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a05_01

  @Level:         1

  @Assertion:    12.1.2(5) Furthermore, ResourceSpecification does not affect the type of the try expression.

  @Description:  Checks that the resource specfication doesn't effect the type of try_with_resource expressions.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

public class TestA0501 <: Resource {
    public func isClosed() : Bool {
        return true
    }
    public func close() : Unit {}
}

main() {
    let e = try (r = TestA0501()) {}
    Assert.isFalse(e is Resource)
}
