/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: test_replay
  @Assertion: Harness support Replay tag
  @Description: In normal mode the test gets the random integer and checks
                if it is even. In replay mode test previous seed from file
                and 'Replay' it.

  @Mode: run
  @Negative: no
  @Replay
  @Structure: single
*/
package replay

import std.convert.*
import std.random.Random
import std.time.DateTime

main(args:Array<String>) {
    let seed:UInt64

    if (args.size > 0) {
        seed = UInt64.parse(args[0])
    } else {
        seed = UInt64(DateTime.now().toUnixTimeStamp().toMilliseconds())
        print("@@Param ${seed}@@\n")
    }
    let rnd:Random = Random(seed);

    return rnd.nextInt64() % 2
}
