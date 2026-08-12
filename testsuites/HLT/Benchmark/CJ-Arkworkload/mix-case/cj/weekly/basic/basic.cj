/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.convert.*
import std.collection.*
import std.time.*
import std.math.*
import std.regex.*
import std.core.*

let DEBUG = false

let ONE_THOUSAND: Float64 = 1000.0
let LOOP_COUNT: Int64 = 120

/*
 * @State
 * @Tags Jetstream2
 */
class Benchmark {
    
    var sp1: String = "10 print \"hello, world!\"\n20 end"

    var sp2: String = "10 let x = 0\n20 let x = x + 1\n30 print x\n40 if x < 10 then 20\n50 end"

    var sp3: String = "10 print int(rnd * 100)\n20 end"

    var sp4: String = "10 let value = int(rnd * 2000)\n20 print value\n30 if value <> 100 then 10\n40 end"


    var sp5: String = "10 dim a(2000)\n20 for i = 2 to 2000\n30 let a(i) = 1\n40 next i\n50 for i = 2 to sqr(2000)\n60 if a(i) = 0 then 100\n70 for j = i ^ 2 to 2000 step i\n80 let a(j) = 0\n90 next j\n100 next i\n110 for i = 2 to 2000\n120 if a(i) = 0 then 140\n130 print i\n140 next i\n150 end"
	
    /*
     * @Benchmark
     */
    func runIteration() {
        let start = Timer().getTime()
        for (_ in 0..LOOP_COUNT) {
            run()
        }
        let end = Timer().getTime()
        println("basic: ms = ${Float64((end - start).toNanoseconds())/1000000.0}")
    }

    func run() {
        let tests = [sp1, sp2, sp3, sp4, sp5]
        for (sp in tests) {
            prepare(sp)
        }
    }

    open func prepare(string: String) {
        try {
            let program =  Parse(Lexer(source: string)).parse()
            let state = State(program)
            program.process(state)
	} catch (ignored: Exception) { }

    }

}

class NormalError <: Exception {

    var desc: String

    init(desc: String) {
        this.desc = desc
    }

}

class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time
    }

}
