package b

import b.macro_definition.*

func aaa(): Int64 {
    println("I'm in function body")
    let a: Int64 = @TestDef(1+2)
    println("a = ${a}")
    return 0
}
