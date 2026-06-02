/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a20_03

  @Level:         1

  @Assertion:    12.1.1(20) Because the type of a caught instance cannot be statically determined,
                            the instance is always converted to the least common supertype of all classes connected
                            by the |, after which the instance is bound with  identifier. As a result, member variables
                            and member functions that are only defined in the least common super-type
                            of all ExceptionClass_i (1 <= i <= n) can be accessed through identifier
                            within the catch block.

  @Description:  Checks that member variables defined in the sub classes of Exception class are not accessible
                 in the catch block thru exception identifier when the exceptions are connected with the |.  

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Issue: 0006124
*/

extend Exception {
    prop a : Int32 {
        get() {
            return -1
        }
    }
}

open class Exc0 <: Exception {
    prop a0 : Int32 {
        get() {
            return -1
        }
    }
}

open class Exc1 <: Exception {
    prop a1 : Int32 {
        get() {
            return -1
        }
    }
}

open class Exc2 <: Exception {
    prop a2 : Int32 {
        get() {
            return -1
        }
    }
}

main() {
    try {
        throw Exc1()
    } catch (e: Exc0 | Exc1 | Exc2) {
        print(e.a1)
    }
}
