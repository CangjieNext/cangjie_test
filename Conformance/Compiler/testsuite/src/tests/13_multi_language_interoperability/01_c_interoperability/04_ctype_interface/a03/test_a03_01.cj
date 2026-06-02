/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_04_a03_01

  @Level:         1

  @Assertion:    13.1.4(3)
                    @C
                    struct Data {}

                    @C
                    func foo(){}

                    main() {
                      var c:CType =Data() // ok
                      c=0// ok
                      c=true // ok
                      c = CString(CPointer<UInt8>()) // ok
                      c=CPointer <Int8 >()// ok
                      c=foo // ok
                    }


  @Description:  The example.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

@C
struct Data {}

@C
func foo() {}

main() {
    var c: CType = Data() // ok
    c = 0 // ok
    c = true // ok
    c = CString(CPointer<UInt8>()) // ok
    c = CPointer<Int8>() // ok
    c = foo // ok
}
