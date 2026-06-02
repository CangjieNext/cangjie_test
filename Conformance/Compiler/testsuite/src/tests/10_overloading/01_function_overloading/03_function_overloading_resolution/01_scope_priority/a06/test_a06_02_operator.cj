/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_01_a06_02_operator

  @Level:         1

  @Assertion:   10.1.3.1(6) 4. The operator overloading functions in the extension or type 
                and built in operators are processed in the same scope priority 
                when the functions are overloaded.
  
  @Description:  Built in + operator is redefining in class
  
  @Mode:         run

  @Negative:     no

  @Structure:    single

*/
import utils.assert.Assert

open class Klass {
    var o: Int32
    init(x: Int32) {
        this.o = x
    }
     public operator func == (Right:IntNative):Bool {
        this.o == Int32(Right) // built-in 
    }
   
    public operator func + (Right:IntNative):Klass {
        Klass(this.o + Int32(Right)) // built-in 
    }

}
extend Klass {
}

main(ina :Array<String>) {
    var kl:Klass = Klass(1)
    Assert.isTrue((kl + IntNative(1)) == IntNative(2))
    0
}
