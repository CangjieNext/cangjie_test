/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a27_03

  @Level:         1

  @Assertion:    3.2.3.2(27) As for try-with-resources expressions: name introduced between try and {}.
                             Its scope starts after the declaration and ends with the try-with-resources expression.

  @Description:  Checks that the rtesource introduced for the try-with-resources expression is accessible 
                 for try-block.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

public class TestA2703 <: Resource {
    public func isClosed() : Bool {
        return true
    }

    public func close() : Unit {}
}

main() {
    try (res = TestA2703()) {
        Assert.isTrue(res.isClosed())
    } catch(_) {
    } finally {}
}