
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a13_01

  @Level:         1

  @Assertion:   4.23(13) 4.Index access expression e1[a] or e2?[a](see Index Access Expressions).
  @Description: Checks that assignment to an index access expression is permitted and gives correct result.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6457

*/

import utils.assert.Assert
import std.random.Random

class C {
    var a = [1, 2, 3, 4, 5]

    var b = true

    operator func[] (x : Int64) { a[x] }

    operator func[] (x : Int64, value! : Int64) { a[x] = value }

    operator func[] (x : UInt64) { b }

    operator func[] (x : UInt64, value! : Bool) { b = value }
}

main() {
    var a = [1, 2, 3, 4, 5]
    var aq : ?Array<Int64> = [1, 2, 3, 4, 5]
    var b = [true, false]
    var bq : ?Array<Bool> = [true, false]
    var c = C()
    var cq : ?C = C()

    a[0] = 0
    Assert.equals(0, a[0])
    aq?[0] = 0
    Assert.equals(0, aq?[0] ?? 1)
    c[0] = 0
    Assert.equals(0, c[0])
    cq?[0] = 0
    Assert.equals(0, cq?[0] ?? 1)

    a[0] += 2
    Assert.equals(2, a[0])
    aq?[0] += 2
    Assert.equals(2, aq?[0] ?? 1)
    c[0] += 2
    Assert.equals(2, c[0])
    cq?[0] += 2
    Assert.equals(2, cq?[0] ?? 1)

    a[0] *= 2
    Assert.equals(4, a[0])
    aq?[0] *= 2
    Assert.equals(4, aq?[0] ?? 2)
    c[0] *= 2
    Assert.equals(4, c[0])
    cq?[0] *= 2
    Assert.equals(4, cq?[0] ?? 2)

    a[0] **= 2
    Assert.equals(16, a[0])
    aq?[0] **= 2
    Assert.equals(16, aq?[0] ?? 4)
    c[0] **= 2
    Assert.equals(16, c[0])
    cq?[0] **= 2
    Assert.equals(16, cq?[0] ?? 4)

    a[0] -= 1
    Assert.equals(15, a[0])
    aq?[0] -= 1
    Assert.equals(15, aq?[0] ?? 4)
    c[0] -= 1
    Assert.equals(15, c[0])
    cq?[0] -= 1
    Assert.equals(15, cq?[0] ?? 4)

    a[0] /= 2
    Assert.equals(7, a[0])
    aq?[0] /= 2
    Assert.equals(7, aq?[0] ?? 4)
    c[0] /= 2
    Assert.equals(7, c[0])
    cq?[0] /= 2
    Assert.equals(7, cq?[0] ?? 4)

    a[0] %= 3
    Assert.equals(1, a[0])
    aq?[0] %= 3
    Assert.equals(1, aq?[0] ?? 4)
    c[0] %= 3
    Assert.equals(1, c[0])
    cq?[0] %= 3
    Assert.equals(1, cq?[0] ?? 4)

    a[0] <<= 1
    Assert.equals(2, a[0])
    aq?[0] <<= 1
    Assert.equals(2, aq?[0] ?? 4)
    c[0] <<= 1
    Assert.equals(2, c[0])
    cq?[0] <<= 1
    Assert.equals(2, cq?[0] ?? 4)

    a[0] >>= 1
    Assert.equals(1, a[0])
    aq?[0] >>= 1
    Assert.equals(1, aq?[0] ?? 4)
    c[0] >>= 1
    Assert.equals(1, c[0])
    cq?[0] >>= 1
    Assert.equals(1, cq?[0] ?? 4)

    a[0] |= 5
    Assert.equals(5, a[0])
    aq?[0] |= 5
    Assert.equals(5, aq?[0] ?? 4)
    c[0] |= 5
    Assert.equals(5, c[0])
    cq?[0] |= 5
    Assert.equals(5, cq?[0] ?? 4)

    a[0] ^= 3
    Assert.equals(6, a[0])
    aq?[0] ^= 3
    Assert.equals(6, aq?[0] ?? 4)
    c[0] ^= 3
    Assert.equals(6, c[0])
    cq?[0] ^= 3
    Assert.equals(6, cq?[0] ?? 4)

    a[0] &= 3
    Assert.equals(2, a[0])
    aq?[0] &= 3
    Assert.equals(2, aq?[0] ?? 4)
    c[0] &= 3
    Assert.equals(2, c[0])
    cq?[0] &= 3
    Assert.equals(2, cq?[0] ?? 4)

    b[0] &&= false
    Assert.equals(false, b[0])
    bq?[0] &&= false
    Assert.equals(false, bq?[0] ?? true)
    c[0u64] &&= false
    Assert.equals(false, c[0u64])
    cq?[0u64] &&= false
    Assert.equals(false, cq?[0u64] ?? true)

    b[0] ||= true
    Assert.equals(true, b[0])
    bq?[0] ||= true
    Assert.equals(true, bq?[0] ?? false)
    c[0u64] ||= true
    Assert.equals(true, c[0u64])
    cq?[0u64] ||= true
    Assert.equals(true, cq?[0u64] ?? false)

    a[..] = [5, 4, 3, 2, 1]
    Assert.equals([5, 4, 3, 2, 1], a[..])
    a[3..] = [6, 7]
    Assert.equals([6, 7], a[3..])
    a[..=2] = [8, 9, 10]
    Assert.equals([8, 9, 10], a[..=2])
    aq?[..] = [5, 4, 3, 2, 1]
    Assert.equals([5, 4, 3, 2, 1], aq?[..] ?? [1, 2, 3, 4, 5])
    aq?[3..] = [6, 7]
    Assert.equals([6, 7], aq?[3..] ?? [1, 2])
    aq?[..=2] = [8, 9, 10]
    Assert.equals([8, 9, 10], aq?[..=2] ?? [1, 2, 3])

}