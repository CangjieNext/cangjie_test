/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_04_01_a01_20

  @Level:         1
  @Assertion:    15.4.1(1) If two threads access the same data, at least one of
                 them is a write operation, and there is no happens-before
                 relation (defined in Section 15.4.2) between them, there is a
                 data race.

    Definition of access on the same data:
    1. Accesses to the same variable of the same primitive type, enum, array,
       or to the same field of struct/class  type, are regarded as accesses the
       same data.

  @Description:  Checks that 50 threads simultaneously writing to elements of
                 the Array<Int8> (which is the field of the struct) will not
                 corrupt it

  @Comment:      We are writing elements of the Array due to there is no option
                 to write directly to the memory

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../data_race_helper.cj ../../../thread_commons.cj

*/


import std.collection.* // HashSet
import utils.assert.Assert
import thread_commons.*
import data_race.*

struct MyStruct {
    var variable:Array<Int8> = Array<Int8>(200){i => 0}
}

var myStruct = MyStruct()

main(): Int64 {
    let checker = DataRaceHelper<Int8>(50, 200)

    checker.check(
        {i => Int8(i)},
        {id, i =>
            Assert.isTrue(checker.valuesAllowed.contains(myStruct.variable[i]),
                    reason: "Intermediate Value ${myStruct.variable[i]} should be in allowed list ${checker.allowed}")
            myStruct.variable[i] = id
        },
        {results =>
            for (v in myStruct.variable) {
                Assert.isTrue(checker.valuesAllowed.contains(v),
                    reason: "Value ${v} should be in allowed list ${checker.allowed}")
            }
        }
    )

    return 0
}
