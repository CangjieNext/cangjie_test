/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_06_a12_01

  @Level:         1

  @Assertion:    11.1.3.6(12) 
    // pkga
    public func Pkga() {} 
    public class Pkga {} 
    public func A2() {} 

     // pkgb 
    public import pkga.* // warning\00imported declaration Pkga conflicted in namespace of pkgb, 
                           //            it will be ignored by compiler. 
                           // add A2 into namespace of pkgb 
    public func Pkga() {}    // OK 

    // pkgc 
    public import pkgb.* // add Pkga\00A2 into namespace of pkgb 

    // pkgd 
    public import pkgb.* // warning\00imported declaration Pkga\00A2 conflicted in namespace of pkgd, 
                           //            they will be ignored by compiler. 
    public import pkgc.* // warning\00imported declaration Pkga\00A2 conflicted in namespace of pkgd, 
                             //            they will be ignored by compiler. 

    main() { 
         pkgb.Pkga()   // OK 
        Pkga()    // Error 
    } 
 
  @Description:    Check that code sample.

  @Mode:           compileonly

  @Negative:       yes

  @Structure:      complex-main

  @Dependencies:   pkgc.cj 

  @Issue:          6388

 */

package pkgd
// pkgd 
public import pkgb.* // warning\00imported declaration Pkga\00A2 conflicted in namespace of pkgd, 
                           //            they will be ignored by compiler. 
public import pkgc.* // warning\00imported declaration Pkga\00A2 conflicted in namespace of pkgd, 
                             //            they will be ignored by compiler.   

main() { 
    Pkga()   // OK 
} 