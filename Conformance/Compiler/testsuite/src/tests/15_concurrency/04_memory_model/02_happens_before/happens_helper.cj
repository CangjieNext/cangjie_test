/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         happens_helper

  @Level:         1

  @Description:  Helper functions for happens-before tests

  @Structure:    complex-aux
*/
package happens_helper

import std.sync.*  // Multithreading
import utils.assert.Assert

let idx:AtomicInt64 = AtomicInt64(0)

let orderQ:Array<Int64> = Array<Int64>(256){i => -1}

public func orderAdd(order:Int64):Unit {
    let i = idx.fetchAdd(1)
    orderQ[i] = order
}

public func orderCheck(upTo!:Int64 = -1):Unit {
    let length:Int64 = match {
        case upTo < -1 => idx.load()
        case _ => upTo
    }

    for (i in 0..length) {
        Assert.equals(i, orderQ[i])
    }
}
