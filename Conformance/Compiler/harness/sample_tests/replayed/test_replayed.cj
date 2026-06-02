/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        test_replayed

  @Assertion:   Harness support @Replay tag 

  @Description: In normal mode test generating random variable & write him to stdout.
                In replay mode test read variable from arguments
  
  @Mode:        run

  @Negative:    no

  @Replay

  @Structure:   single

  @Comment:
*/

package replayed

import std.convert.*
import std.random.Random
import std.time.DateTime
import std.process.*

main() {
  var args = Process.current.arguments
  var seed:UInt64

  if (args.size > 0) {
      seed = UInt64.parse(args[0])
  } else {
      seed = UInt64(DateTime.now().toUnixTimeStamp().toMilliseconds())
      print("@@Param ${seed}@@\n")
  }
  let rnd:Random = Random(seed);

  if((rnd.nextInt64() % 2) == 0) {
      return 0
  } else {
      return 1
  }
}
