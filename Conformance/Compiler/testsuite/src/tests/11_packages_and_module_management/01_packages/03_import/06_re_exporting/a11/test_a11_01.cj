/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_06_a11_01

  @Level:         1

  @Assertion:    11.1.3.6(11) For the re-export scenario using wildcards,
                 re-export declarations that cause name conflicts are ignored
                 and an alarm is reported, indicating that the corresponding 
                 declarations are ignored. 
 
  @Description:    Check that re-export declarations that cause name conflicts
                   are ignored and an alaram is reported. re-exported declaration
                   imported with `import`

  @Mode:           run

  @Negative:       no

  @Structure:      complex-main

  @Dependencies:   pkg2.cj 

  @Issue:          0006389

  @CompileWarning: no

  @Comment:        declaration 'pkg1' of pkg1 was re-exported in pkg2 and then
                   imported by pkg3 with 'import.
 
 */

package pkg3

import pkg2.*
import utils.assert.Assert

public var testA1101 = "pkg3"

main() { 
    Assert.equals("pkg3", pkg1)
    return 0
} 