/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Structure:       complex-aux
  @CompileWarning:  ignore
*/

package p1

import utils.assert.Assert

public enum E {
    D
    public static func c1() {
        match("56") {
            case "65" => ()
            case _ => Assert.isTrue(true)
        }
    }

    public prop c2: String {
        get() {
            { c3: ()->String =>
                Assert.isTrue(this is E)
                c3()
            }({ => "ф" })
        }
    }

    public operator func -() {
        let c4 = "d"
        if (false) {} else {
            Assert.equals("d", c4)
        }
    }
}
