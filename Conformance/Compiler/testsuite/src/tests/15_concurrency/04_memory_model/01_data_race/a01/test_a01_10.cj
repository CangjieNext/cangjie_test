/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_04_01_a01_10

  @Level:         1
  @Assertion:    15.4.1(1) If two threads access the same data, at least one of
                 them is a write operation, and there is no happens-before
                 relation (defined in Section 15.4.2) between them, there is a
                 data race.

    Definition of access on the same data:
    1. Accesses to the same variable of the same primitive type, enum, array,
       or to the same field of struct/class  type, are regarded as accesses the
       same data.

  @Description:  Checks that 50 threads simultaneously writing to the Float16
                 will not corrupt it

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../data_race_helper.cj ../../../thread_commons.cj

*/


import std.collection.* // HashSet
import utils.assert.Assert
import thread_commons.*
import data_race.*

let BASE:Float16 = 0.4648214461453536
var variable:Float16 = BASE

main(): Int64 {
    let checker = DataRaceHelper<Float16>(50, 200)

    checker.check(
        {i => Float16(Float16(i) * BASE)},
        {id, i =>
            Assert.isTrue(checker.valuesAllowed.contains(variable),
                    reason: "Intermediate Value ${variable} should be in allowed list ${checker.allowed}")
            variable = id
        },
        {results =>
            Assert.isTrue(checker.valuesAllowed.contains(variable),
                    reason: "Value ${variable} should be in allowed list ${checker.allowed}")
        }
    )

    return 0
}
