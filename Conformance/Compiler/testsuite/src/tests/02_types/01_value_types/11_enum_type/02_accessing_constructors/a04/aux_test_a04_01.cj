/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Structure:       complex-aux
*/

package p1

import p2.E
import utils.assert.Assert

public enum E {
    D | G(Rune)
    public func desc() { "p1.E" }
    public func check() {
        var e = D
        Assert.equals("p1.E", e.desc())
        Assert.isTrue(e is E)
        var e2 = G(r'b')
        Assert.equals("p1.E", e2.desc())
        Assert.isTrue(e2 is E)
    }
}
