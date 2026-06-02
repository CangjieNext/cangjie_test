/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_06_a01_03

  @Level:         1

  @Assertion:       8.6(1) The extension itself cannot be modified with public, and the extension can only be 
                    imported and exported together with the type being extended or interface.

  @Description:     Check that struct extension cannot be modified with public in current package.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

package pkg1

public struct TestA0103 {}

public extend TestA0103 { 
    public func g(): Unit {}
}

main() { 
} 
