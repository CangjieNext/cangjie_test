/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_03_a08_02

  @Level:         1

  @Assertion:    13.1.2.3(8) foreign func foo1 (ptr :CPointer <Int32 >):Unit
            @C
            func foo2 (ptr :CPointer <Int32 >):Unit {
                let n=unsafe {ptr.read() }
                println( "*ptr = ${n}")
            }
            let foo3 :CFunc <(CPointer <Int32 >)->Unit >={ptr =>
                let n=unsafe {ptr.read() }
                println( "*ptr = ${n}")
            }
            struct Data {
                var n:Int32 =0
            }
            class A{
                var data =Data()
            }
            main() {
                var n:Int32 =0
                unsafe {
                    foo1(inout n) // OK
                    foo2(inout n) // OK
                    foo3(inout n) // OK
                }
                var data =Data()
                var a=A()
                unsafe {
                    foo1(inout data.n) // OK
                    foo1(inout a.data.n) // Error, n is derived indirectly from instance member variables of class A
                }
            }

  @Description:  Example, negative variant.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Issue:        0006353

  @Comment:      

*/

foreign func foo1 (ptr :CPointer <Int32 >): Unit

@C
func foo2 (ptr :CPointer <Int32 >): Unit {
    let n=unsafe {ptr.read() }
    println( "*ptr = ${n}")
}

let foo3 :CFunc <(CPointer <Int32 >)->Unit >={ptr =>
    let n=unsafe {ptr.read() }
    println( "*ptr = ${n}")
}

struct Data {
    var n:Int32 =0
}

class A{
    var data =Data()
}

main() {
    var n:Int32 =0
    unsafe {
        foo1(inout n) // OK
        foo2(inout n) // OK
        foo3(inout n) // OK
    }
    var data =Data()
    var a=A()
    unsafe {
        foo1(inout data.n) // OK
        foo1(inout a.data.n) // Error, n is derived indirectly from instance member variables of class A
    }
}
