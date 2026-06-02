/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_06_a11_02

  @Level:         1

  @Assertion:    11.1.3.6(11) For the re-export scenario using wildcards,
                 re-export declarations that cause name conflicts are ignored
                 and an alarm is reported, indicating that the corresponding 
                 declarations are ignored. 
 
  @Description:    Check that re-export declarations that cause name conflicts
                   are ignored and an alaram is reported. re-exported declaration

  @Mode:           run

  @Negative:       no

  @Structure:      complex-main

  @Dependencies:   pkg2.cj 

  @CompileWarning: no

 */

package pkg3

public import pkg2.*
import utils.assert.Assert

public var currentYear = 20.23

main() {
    Assert.equals(20.23, currentYear) 
    return 0
} 
