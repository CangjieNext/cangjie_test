package demo

import demo.macro_definition.*
import dep.aoo.*

main(): Int64 {
    println("I'm in function body")
    let a: Int64 = @TestDef(1 + 2)
    println("a = ${a}")
    depAoo()
    return 0
}
