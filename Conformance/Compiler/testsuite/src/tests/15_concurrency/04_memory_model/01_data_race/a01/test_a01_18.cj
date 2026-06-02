/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_04_01_a01_18

  @Level:         1
  @Assertion:    15.4.1(1) If two threads access the same data, at least one of
                 them is a write operation, and there is no happens-before
                 relation (defined in Section 15.4.2) between them, there is a
                 data race.

    Definition of access on the same data:
    1. Accesses to the same variable of the same primitive type, enum, array,
       or to the same field of struct/class  type, are regarded as accesses the
       same data.

  @Description:  Checks that 50 threads simultaneously writing to the enum
                 will not corrupt it

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../../thread_commons.cj

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.Assert
import thread_commons.*

enum MyEnum {
    AA|BB|CC|DD|EE
}
var variable:MyEnum = MyEnum.AA

main(): Int64 {
    let threads:Int64 = 5
    let iterCount:Int64 = 200
    let amount:AtomicInt64 = AtomicInt64(0)
    let m = Mutex()
    let c = synchronized(m) { m.condition() }

    let starter = ThreadStarter<MyEnum>(threads){i =>
        let id = match(i) {
                case 0 => MyEnum.AA
                case 1 => MyEnum.BB
                case 2 => MyEnum.CC
                case 3 => MyEnum.DD
                case _ => MyEnum.EE
            }
        return spawn {
            synchronized(m) {
                amount.fetchAdd(1)
                c.wait()
            }
            for (i in 0..iterCount) {
                variable = id
            }

            return id
        }
    }
    while (amount.load() < threads) {
        sleep(Duration.nanosecond * 50)
    }
    sleep(Duration.nanosecond * 300_000) // wait enough
    synchronized(m) {
        c.notifyAll()
    }

    // wait for results
    let results = starter.waitAll()

    // there is nothing to check the variable should be of type MyEnum
    Assert.equals(threads, results.size)

    return 0
}
