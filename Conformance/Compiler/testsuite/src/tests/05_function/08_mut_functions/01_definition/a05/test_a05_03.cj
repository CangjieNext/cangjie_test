/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_01_a05_03

  @Level:         1

  @Assertion:       5.8.1(5) this in a mut function cannot be captured (meaning the fields of the current instance 
                    cannot be captured either), nor can it be used as an expression. 
                    struct Foo { 
                        var i = 0 
                        mut func f(): Foo { 
                            let f1 = { => this } // error 
                        } 
                    } 

  @Description:     Negative example from spec.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct Foo { 
    var i = 0 
    mut func f(): Foo { 
        let f3 = { => this.i } // error 
        return Foo()
    } 
} 
 
main() { 
} 