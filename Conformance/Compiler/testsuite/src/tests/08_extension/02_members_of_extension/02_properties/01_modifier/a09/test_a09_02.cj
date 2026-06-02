/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_01_a09_02

  @Level:         1

  @Assertion:       8.2.2.1(9) 
                    class Foo {
                        open prop v1: Int64 {
                            get() { 0 }
                        }
                        static prop v2: Int64 {
                            get() { 0 }
                        }
                    }

                    extend Foo {
                        override prop v1: Int64 { // error
                            get() { 0 }
                        }
                        open prop v3: Int64 { // error
                            get() { 0 }
                        }
                        redef static prop v2: Int64 { // error
                            get() { 0 }
                        }
                    }

  @Description:     Negative examples from spec: case 2.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

  @Issue:           6124

*/

class Foo {
    open prop v1: Int64 {
        get() { 0 }
    }
    static prop v2: Int64 {
        get() { 0 }
    }
}

extend Foo {
    open prop v3: Int64 { // error
        get() { 0 }
    }
}

main(): Unit { } 
