

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_05_a01_01

  @Level:         1

  @Assertion:   6.1.2.5(1)  Class finalizer is an instance member function which gets invoked when an instance of a
                class is garbage collected.
  @Description: Checks that finalizer gets invoked when an instance of a class gets garbage collected.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/
import std.sync.*
import std.time.*
import std.runtime.*
import utils.assert.Assert

var counter = 1
var lastFinalized = 0

class C {
    let id = counter

    init() {
        counter++
    }

    ~init() {
        lastFinalized = id
    }
}

main() {
    C()
    while (lastFinalized > 0) {
        gc(heavy: true)
        Assert.isTrue(lastFinalized > 0)  
    }
}
