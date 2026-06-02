/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a08_04

  @Level:         1

  @Assertion:    11.1.3(8)
    import module_name.package1.*
    import module_name.package1.*, package2.*
    import module_name.package1.foo
    import module_name.package1.foo, package2.bar
    import module_name.package1.foo as alias1, package2.bar as alias2

    // p1 without module name
    package p1

    // p2 without module name
    package p2
    import p1.* // this means import p1 without module name.

    // p1 in module2
    package p1

    // p2 in module2
    package p2
    import p1.* // this means import p1 from module2.
                  // if parent path of p1.cjo is not module2,
                  // p1 is not a legal package and will not be imported.

    // p3 in module2
    package p3
    import p1.* // Error\00p1 does not exist in module2


  @Description:  Check that code sample is correct

  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a08_01.cj aux_test_a08_02.cj

  @Module:       module_name

*/
import {package1.foo, package2.bar}

main() {
    return 0
}
