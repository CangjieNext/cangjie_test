/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a04_10

  @Level:         1

  @Assertion: 4(4): Expressions can be composed into composite expressions. 
  @Description: Checks that expression can be a part of the 
                composute expression. Tests member access, function 
                invocation, index access, question mark.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

let arr : Array<UInt8>  = [72, 101, 108, 108, 111]

open class C {
    public let name: String = "C";
    public var city: String = "Novosibirsk";

    public func getHello(): String { 
        "Hello"
    }

    open public func getId(): Int32 { 
        1 
    }
} 

func checkFunctionName(f: () -> Int32): Int32 {
    f()
}
 
func simple(i: Int32): Bool { 
    if(i == 0) { 
       false 
    } else { 
       true 
    }
}

main() {
    let c: C = C()

    var str: String = "String of " + 
        c.name +
        " is: " + 
        c.getHello() + 
        " from " +
        c.city
    Assert.equals("String of C is: Hello from Novosibirsk", str)

    let c1 = Some(c)

    var num = 
        if(simple(10)) {
            Int64((checkFunctionName(c.getId) + 1)) * 
                    (Assert.getRuntimeZero() + 10) - 
                    Int64(arr[2]) /
                (match (c1?.name) {
                    case c1 => 2 
                } + 1)  
            }
        else {
            0
        }

    Assert.isTrue(num is Int64)
    Assert.equals(-16, num)
}
