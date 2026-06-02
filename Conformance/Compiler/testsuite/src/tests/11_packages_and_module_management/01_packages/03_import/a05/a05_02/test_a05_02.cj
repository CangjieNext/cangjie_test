/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a05_02

  @Level:         1

  @Assertion:    11.1.3(5) The compiler checks whether the path and the name of the imported package are the same.
                 Packages that do not match with their file paths will not be imported. An error will be reported 
                 indicating that the packages were not found.

  @Description:  Check that compiler throws an error whenever path and name of the imported package are not he same

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    single
 
  @Issue:        0006255

*/

main() {
    return 0
}