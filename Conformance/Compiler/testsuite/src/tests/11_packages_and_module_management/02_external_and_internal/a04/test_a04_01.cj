/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a04_01

  @Level:         1

  @Assertion:    11.2(4) 
    public let a = 1 
    let b = a    // OK 

    let c = 2 
    public let d = c     // OK 
 
  @Description:  Check that code sample 

  @Mode:         compileonly 

  @Negative:     no  

  @Structure:    single
 
*/

package pkg1

public let a = 1 
let b = a    // OK 

let c = 2 
public let d = c     // OK 

main() {
    return 0
}