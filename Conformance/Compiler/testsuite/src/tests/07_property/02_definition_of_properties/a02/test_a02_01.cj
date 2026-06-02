/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a02_01

  @Level:         1

  @Assertion:   7.2(2)
                class A {
                  prop i: Int64 {
                    get() {
                      0
                    }
                  }
                }

                struct B {
                  prop i: Int64 {
                    get() {
                      0
                    }
                  }
                }

                enum C {
                  prop i: Int64 {
                    get() {
                      0
                    }
                  }
                }

                extend A {
                  prop s: String {
                    get() {
                      ""
                    }
                  }
                }

  @Description: Checks that example compiled w/o errors.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124, 0006153


*/

class A {
  prop i: Int64 {
    get() {
      0
    }
  }
}

struct B {
  prop i: Int64 {
    get() {
      0
    }
  }
}

enum C {
  CASE1
  prop i: Int64 {
    get() {
      0
    }
  }
}

extend A {
  prop s: String {
    get() {
      ""
    }
  }
}

main() {
    return 0;
}


