
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_a02_01

  @Level:         1

  @Assertion:   4.7(2) Control transfer expressions have type Nothing, which is the subtype of all types.
  @Description: Checks that control transfer expressions have type Nothing and Nothing is a subtype for various types. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

func f() {
    Assert.isTrue((return 1) is Nothing)
    return 2
}

func g() {
    Assert.isTrue((throw Exception()) is Nothing)
}

func checkNothing<T>(n : Nothing) {
    Assert.isTrue(n is T)
}

interface I { }

class C { }

class G<T> { }

struct S { }

enum E { E0 }

main() {
    var i : Int64

    do { Assert.isTrue(break is Nothing) } while(false)
    do { Assert.isTrue(continue is Nothing) } while(false)
    f()
    try {
        g()
    } catch (e : Exception) {}

}
