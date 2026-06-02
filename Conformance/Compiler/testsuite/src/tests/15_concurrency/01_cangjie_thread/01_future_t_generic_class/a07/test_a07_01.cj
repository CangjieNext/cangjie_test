/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_01_a07_01

  @Level:         1
  @Assertion:    15.1.1(7)
                main() {
                    let fut: Future<Int64> = spawn {
                        throw TestException()
                        return 100
                    }
                    try {
                        let res: Int64 = fut.get()
                        print("val = ${res}\n")
                    } catch (e: TestExcetpion) {
                        print("Exception occured\n")
                    }
                }
                // OUTPUT:
                // Exception occured: TestException

  @Description:  Checks that example from the spec works

  @Mode:         run
  @Negative:     no
  @Structure:    single
  @CompileWarning: no

  @Issue:        0006116

*/

main(args:Array<String>) {
    let fut: Future<Int64> = spawn {
        // this check is required to pass compilation
        if (args.size != -1) {
            throw IllegalArgumentException()
        }
        return 100
    }
    try {
        let res: Int64 = fut.get()
        print("val = ${res}\n")
    } catch (e: IllegalArgumentException) {
        print("Exception occured\n")
    }
}
// OUTPUT:
// Exception occured
