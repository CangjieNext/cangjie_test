/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a27_01

  @Level:         1

  @Assertion:    3.2.3.2(27) As for try-with-resources expressions: name introduced between try and {}.
                             Its scope starts after the declaration and ends with the try-with-resources expression.

  @Description:  Checks that the resource introduced for try-with-resources expression is inaccesible 
                 for the catch-block.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006149

*/

import utils.assert.Assert

public class TestA2701 <: Resource {
    public func isClosed() : Bool {
        return true
    }

    public func close() : Unit {}
}

main() {
    var res: TestA2701 = TestA2701()
    try (res = TestA2701()) {
        res  // resource is accessible
    } catch(_) {
        Assert.isTrue(res.isClosed())
    }
}
