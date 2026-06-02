
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a70_01

  @Level:         1

  @Assertion:   4.15(70) Especially, for these cases INT_MIN * -1 , INT_MIN / -1 and INT_MIN % -1, the results are
                defined as below.
                 expression                   | @OverflowThrowing          | @OverflowWrapping | @OverflowSaturating
                -----------------------------------------------------------------------------------------------------
                INT_MIN * -1 or -1 * INT_MIN  | throw an OverflowException | INT_MIN           | INT_MAX
                INT_MIN / -1                  | throw an OverflowException | INT_MIN           | INT_MAX
                INT_MIN % -1                  | 0                          | 0                 | 0
  @Description: Checks the table contents.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert

@OverflowThrowing
func overflowThrowing() {
    Assert.throws({ => Int8.Min * -1 }, check: { e => e is OverflowException})
    Assert.throws({ => Int16.Min * -1 }, check: { e => e is OverflowException})
    Assert.throws({ => Int32.Min * -1 }, check: { e => e is OverflowException})
    Assert.throws({ => Int64.Min * -1 }, check: { e => e is OverflowException})

    Assert.throws({ => -1 * Int8.Min }, check: { e => e is OverflowException})
    Assert.throws({ => -1 * Int16.Min }, check: { e => e is OverflowException})
    Assert.throws({ => -1 * Int32.Min }, check: { e => e is OverflowException})
    Assert.throws({ => -1 * Int64.Min }, check: { e => e is OverflowException})

    Assert.throws({ => Int8.Min / -1 }, check: { e => e is OverflowException})
    Assert.throws({ => Int16.Min / -1 }, check: { e => e is OverflowException})
    Assert.throws({ => Int32.Min / -1 }, check: { e => e is OverflowException})
    Assert.throws({ => Int64.Min / -1 }, check: { e => e is OverflowException})

    Assert.equals(0, Int8.Min % 1)
    Assert.equals(0, Int16.Min % 1)
    Assert.equals(0, Int32.Min % 1)
    Assert.equals(0, Int64.Min % 1)
}

@OverflowWrapping
func overflowWrapping() {
    Assert.equals(Int8.Min, Int8.Min * -1)
    Assert.equals(Int16.Min, Int16.Min * -1)
    Assert.equals(Int32.Min, Int32.Min * -1)
    Assert.equals(Int64.Min, Int64.Min * -1)

    Assert.equals(Int8.Min, -1 * Int8.Min)
    Assert.equals(Int16.Min, -1 * Int16.Min)
    Assert.equals(Int32.Min, -1 * Int32.Min)
    Assert.equals(Int64.Min, -1 * Int64.Min)

    Assert.equals(Int8.Min, Int8.Min / -1)
    Assert.equals(Int16.Min, Int16.Min / -1)
    Assert.equals(Int32.Min, Int32.Min / -1)
    Assert.equals(Int64.Min, Int64.Min / -1)

    Assert.equals(0, Int8.Min % 1)
    Assert.equals(0, Int16.Min % 1)
    Assert.equals(0, Int32.Min % 1)
    Assert.equals(0, Int64.Min % 1)
}

@OverflowSaturating
func overflowSaturating() {
    Assert.equals(Int8.Max, Int8.Min * -1)
    Assert.equals(Int16.Max, Int16.Min * -1)
    Assert.equals(Int32.Max, Int32.Min * -1)
    Assert.equals(Int64.Max, Int64.Min * -1)

    Assert.equals(Int8.Max, -1 * Int8.Min)
    Assert.equals(Int16.Max, -1 * Int16.Min)
    Assert.equals(Int32.Max, -1 * Int32.Min)
    Assert.equals(Int64.Max, -1 * Int64.Min)

    Assert.equals(Int8.Max, Int8.Min / -1)
    Assert.equals(Int16.Max, Int16.Min / -1)
    Assert.equals(Int32.Max, Int32.Min / -1)
    Assert.equals(Int64.Max, Int64.Min / -1)

    Assert.equals(0, Int8.Min % 1)
    Assert.equals(0, Int16.Min % 1)
    Assert.equals(0, Int32.Min % 1)
    Assert.equals(0, Int64.Min % 1)
}

main() {
    overflowThrowing()
    overflowWrapping()
    overflowSaturating()
}
