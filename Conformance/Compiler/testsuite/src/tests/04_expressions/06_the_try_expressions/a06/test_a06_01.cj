/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_06_a06_01

  @Level:         1

  @Assertion: 4.6(6)
              The primary use of try-with-resources is to automatically release non-memory resources, see Chapter
              Exceptions for details.

  @Description: Check the try-with-resources expression example.

  @Mode: run

  @Negative: no

*/

// NOTE: Try-with-resources expressions should be well tested within "Exceptions" chapter. No need to duplicate tests
//       here. Just provide an example.

import utils.assert.Assert

var isResourceFree = true

class GlobalResource <: Resource {
    init() {
        isResourceFree = false
    }

    public func isClosed() {
        isResourceFree
    }

    public func close() {
        isResourceFree = true
    }
}

main() {
    var caught = false
    Assert.isTrue(isResourceFree)
    try (gv = GlobalResource()) {
        Assert.isFalse(isResourceFree)
        throw Exception()
    } catch (e: Exception) {
        caught = true
    }
    Assert.isTrue(isResourceFree)
    Assert.isTrue(caught)
}

