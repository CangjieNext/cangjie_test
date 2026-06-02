/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_01_a01_01

  @Level:         1
  @Assertion:    15.1.1(1) The value of a spawn expression is a Future<T>
                 object, which can be used to get the computation result
                 of the created thread.

  @Description:  Checks that the value of a spawn expression is a Future<T>
                 object

  @Mode:         run
  @Negative:     no
  @Structure:    single
  @CompileWarning: no

*/

import utils.assert.Assert

main(args:Array<String>): Int64 {
    Assert.isTrue(spawn {
            return 0.5f16
        } is Future<Float16>)
    Assert.isTrue(spawn {
            return ""
        } is Future<String>)
    Assert.isTrue(spawn {
            return spawn {
                return 0i8
            }
        } is Future<Future<Int8>>)
    let f1 = spawn {
        // required to pass compilation
        let i = if (args.size != -1) { 0 } else { 2 }
        return 2 / i
    }
    Assert.isTrue(f1 is Future<Int64>)

    0
}
