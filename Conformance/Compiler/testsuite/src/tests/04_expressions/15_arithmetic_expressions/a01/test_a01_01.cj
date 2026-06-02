
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a01_01

  @Level:         1

  @Assertion:   4.15(1)  Arithmetic expressions are expressions that contain arithmetic operators. Arithmetic operators
                include: unary negative ( - ), add (+), subtract(-), multiply(*), divide(/), remainder(%), power (**).
  @Description: Checks compilation of a program that uses arithmetic operators. 
  @Mode: compileonly
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

main() {
    let x = 1
    let y = 2
    let fx = 1.0
    let fy = 2.0

    println(1+2)
    println(x+2)
    println((x)+2)
    println((x)+2)
    println(1+y)
    println(x+y)
    println((x)+y)
    println((x)+y)
    println(1+(y))
    println(x+(y))
    println((x)+(y))
    println((x)+(y))
    println(1+(y))
    println(x+(y))
    println((x)+(y))
    println((x)+(y))

    println(1-2)
    println(x-2)
    println((x)-2)
    println((x)-2)
    println(1-y)
    println(x-y)
    println((x)-y)
    println((x)-y)
    println(1-(y))
    println(x-(y))
    println((x)-(y))
    println((x)-(y))
    println(1-(y))
    println(x-(y))
    println((x)-(y))
    println((x)-(y))

    println(1*2)
    println(x*2)
    println((x)*2)
    println((x)*2)
    println(1*y)
    println(x*y)
    println((x)*y)
    println((x)*y)
    println(1*(y))
    println(x*(y))
    println((x)*(y))
    println((x)*(y))
    println(1*(y))
    println(x*(y))
    println((x)*(y))
    println((x)*(y))

    println(1/2)
    println(x/2)
    println((x)/2)
    println((x)/2)
    println(1/y)
    println(x/y)
    println((x)/y)
    println((x)/y)
    println(1/(y))
    println(x/(y))
    println((x)/(y))
    println((x)/(y))
    println(1/(y))
    println(x/(y))
    println((x)/(y))
    println((x)/(y))

    println(1%2)
    println(x%2)
    println((x)%2)
    println((x)%2)
    println(1%y)
    println(x%y)
    println((x)%y)
    println((x)%y)
    println(1%(y))
    println(x%(y))
    println((x)%(y))
    println((x)%(y))
    println(1%(y))
    println(x%(y))
    println((x)%(y))
    println((x)%(y))

    println(1.0**2.0)
    println(fx**2.0)
    println((fx)**2.0)
    println((fx)**2.0)
    println(1.0**fy)
    println(fx**fy)
    println((fx)**fy)
    println((fx)**fy)
    println(1.0**(fy))
    println(fx**(fy))
    println((fx)**(fy))
    println((fx)**(fy))
    println(1.0**(fy))
    println(fx**(fy))
    println((fx)**(fy))
    println((fx)**(fy))
}
