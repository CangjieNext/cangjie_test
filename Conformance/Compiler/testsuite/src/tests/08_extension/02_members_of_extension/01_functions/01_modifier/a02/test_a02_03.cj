/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_01_a02_03

  @Level:         1

  @Assertion:   8.2.1.1(2) Functions modified with private can only be used inside this extension
                and are not visible outside.

  @Description: Checks that functions modified with private cannot be used outside this extension.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single


*/

class A {}

extend A {
    private func foo1(): Int64 { 7 }

    protected func foo2(): Int64 { foo1() + 1 }
    
    public func foo3(): Int64 { foo1() + 2 }
}

main() {
    let x = A()
    x.foo1()
    return 0
}
