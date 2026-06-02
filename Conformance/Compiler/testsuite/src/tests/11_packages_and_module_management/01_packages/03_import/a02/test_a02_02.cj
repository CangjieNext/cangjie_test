/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a02_02

  @Level:         1

  @Assertion:    11.1.3(2)
    • Take import pkga.pkgb.item as an example, ‘pkga.pkgb is the name of the package where the imported
     top-level definition or declaration locates, and item is the imported top-level definition or declaration. 
    • The identifier that follows the keyword as in importAlias is an alias for the for the imported 
     top-level definition or declaration. 
    • The identifier after the from keyword is the name of the imported module, which is the same as the module 
     name specified in the import profile output by the module management tool or in the import profile set by
     the user (these profiles maintain the mapping of the module name to the path of the corresponding cjo file
     of the module).


  @Description:  Check that identifier after `as` keyword is importAlias 

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: pkga/aux_test_a02_01.cj pkga/pkgb/aux_test_a02_02.cj

  @Module:       importedModuleName

*/

import importedModuleName.pkga.* as alias1.*
import importedModuleName.pkga.pkgb.* as alias2.*

main() {
    AuxTestA0201.packageName()
    return 0
}

