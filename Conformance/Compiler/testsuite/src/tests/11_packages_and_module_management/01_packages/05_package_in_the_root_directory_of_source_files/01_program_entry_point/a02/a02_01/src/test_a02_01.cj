/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_05_01_a02_01

  @Level:         1

  @Assertion:    11.1.5.1(2) The main is the entry point to a Cangjie program.
 
  @Description:  Check that main is the entry point to a Cangjie program. 
                 
  @Mode:         run 

  @Negative:     no  
 
  @Comment:      This test uses custom driver `custom.py`. Test considered passed
                 if after test execution only "Hello, world!" will appear in stdout.
*/

public func foo1() {
    print("foo1")
}

public class TestA0201 {
    public func foo2() {
        print("foo2")
    }
}

main() {
    print("Hello, world!")
    return 0
}