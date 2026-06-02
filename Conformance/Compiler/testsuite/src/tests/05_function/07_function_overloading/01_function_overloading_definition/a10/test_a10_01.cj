/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:           05_07_01_a10_01

  @Level:         1

  @Assertion:      5.7.1(10) In the following example, constructors in class C are overloading. 
                    class C { 
                        let name: String = "abc" 
                        // constructor overloading 
                        init(){ 
                            print(name) 
                        } 
                        init(name: String){ 
                            this.name = name 
                        } 
                    } 

  @Description:     Positive example from spec

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issue:           6300

*/
import utils.assert.Assert

class C { 
    var name: String = "abc" 
    // constructor overloading 
    init(){ 
        print(name)
        Assert.equals("abc", this.name) 
    } 
    init(name: String){ 
        this.name = name 
    } 
} 

main() {
    var classImpl = C()
}
