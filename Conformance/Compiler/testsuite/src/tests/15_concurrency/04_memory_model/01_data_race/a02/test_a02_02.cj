/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_04_01_a02_02

  @Level:         1
  @Assertion:    15.4.1(2) 2. The accesses to different fields of struct/class
                 type are considered as accesses on different data.

  @Description:  Checks that 3 threads simultaneously read/write to different
                 fields of class without issues

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../data_race_helper.cj ../../../thread_commons.cj

*/

import std.sync.*  // Concurrency
import std.time.* // Duration
import std.collection.* // HashSet

import utils.assert.Assert
import thread_commons.*
import data_race.*

class MyClass {
    var gCounter1:Int64 = 0
    var gCounter2:Int64 = 0
    var gCounter3:Int64 = 0
}

let myClass = MyClass()

func read(i:Int64) {
    match (i) {
        case 0 => myClass.gCounter1
        case 1 => myClass.gCounter2
        case _ => myClass.gCounter3
    }
}

func write(i:Int64, curVal:Int64) {
    match (i) {
        case 0 => myClass.gCounter1 = curVal + 1
        case 1 => myClass.gCounter2 = curVal + 1
        case _ => myClass.gCounter3 = curVal + 1
    }
}

main(): Int64 {
    let threads = 3
    let iterCount = 200
    let checker = DataRaceHelper<Int64>(threads, iterCount)

    checker.check(
        {i => i},
        {id, i =>
            let curVal = read(id)
            sleep(Duration.nanosecond)
            write(id, curVal)
        },
        {results =>
            for (i in 0..threads) {
                Assert.equals(iterCount, read(i), reason: "Global var ${i} should match")

                Assert.equals(i, results[i], reason: "Thread result ${i} should match")
            }
        }
    )

    return 0
}
