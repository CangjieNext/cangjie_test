/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_06_a08_01

  @Level:         1

  @Assertion:    11.1.3.6(8) 
    package pkg1 
    public class AuxTestA0801 {} 

    package pkg2 
    public import pkg1.AuxTestA0801            // class AuxTestA0801 of pkg1 must be re-exported. 
    public func f() { 
         let c = AuxTestA0801() 
         return c 
    } 

    package pkg3 
    import pkg2.f 
    main(): Int64 { 
        let obj = f()              // OK 
        return 0 
    } 
    In the above example, f is a public function in pkg2 whose return value type is the imported type AuxTestA0801.
    Another package pkg3 imports the function f in pkg2. If pkg3 does not manually import the class AuxTestA0801 in pkg1,
    or keyword public import is not used in pkg2 when importing function f to indicate that class AuxTestA0801 is re-exported,
    an error will be reported when invoking the function f in pkg3 because class AuxTestA0801 can not be found. Forcibly
    restricting pkg2 to re-export class AuxTestA0801, pkg3 does not need to manually import class AuxTestA0801 from pkg1 when using f. 

  @Description:  Check that code sample

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a08_02.cj

*/

package pkg3 
import pkg2.f 
main(): Int64 { 
    let obj = f()              // OK 
    return 0 
} 