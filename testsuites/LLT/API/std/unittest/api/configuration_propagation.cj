/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC-PIPE-0: %run %run_opt %output --no-color 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*

@UnittestOption[String](b)

@UnittestOption[String](a)

@UnittestOption[String](c)

@UnittestOption[String](d)

var prefix = ""
let knownProps = ["a", "b", "c", "d"]

class ConfigPrint <: DataStrategy<Unit> & DataProvider<Unit> {
    public prop isInfinite: Bool {
        get() {
            false
        }
    }

    public func provide(): Iterable<Unit> {
        [()]
    }

    public func provider(configuration: Configuration): DataProvider<Unit> {
        logConfig(configuration)
        this
    }

    private func logConfig(configuration: Configuration) {
        print(prefix)
        print(": ")
        for (p in knownProps) {
            if (let Some(v) <- configuration.getByName<String>(p)) {
                print("${p} = ${v}, ")
            }
        }
        println(";")
    }
}

let strat = ConfigPrint()

func cfg(vs: Array<(String, String)>) {
    let c = Configuration()
    for (v in vs) {
        c.setByName(v[0], v[1])
    }
    c
}

main(): Unit {
    let config1 = Configuration()
    let case1 = UnitTestCase.createParameterized("t", strat) {_ =>}
    prefix = "C1"
    case1.run()
    // ASSERT: scan C1: ;
    config1.set(KeyA.a, "A")
    config1.set(KeyB.b, "B")
    let case2 = UnitTestCase.createParameterized("t", strat, configuration: cfg([("a", "A"), ("b", "B")])) {_ =>}
    prefix = "C2"
    case2.run()
    // ASSERT: scan C2: a = A, b = B, ;
    prefix = "C3"
    let suite = TestSuite.builder("s").add(case2).build()

    suite.runTests()
    // ASSERT: scan C3: a = A, b = B, ;
    prefix = "C4"
    suite.runTests(cfg(("a", "AAA"), ("c", "C")))
    // ASSERT: scan C4: a = A, b = B, c = C, ;

    let suite2 = TestSuite.builder("s").add(case1).configure(cfg(("a", "1"), ("b", "2"))).build()

    prefix = "C5"
    suite2.runTests()
    // ASSERT: scan C5: a = 1, b = 2, ;

    prefix = "C6"
    let suite3 = TestSuite
        .builder("s")
        .add(case1)
        .configure(cfg(("a", "2"), ("b", "3")))
        .configure(cfg(("a", "10"), ("c", "20")))
        .build()
    suite3.runTests()
    // ASSERT: scan C6: a = 10, b = 3, c = 20, ;

    prefix = "C7"
    TestSuite.builder(suite3).configure(cfg(("a", "101"), ("d", "20"))).build().runTests()
    // ASSERT: scan C7: a = 101, b = 3, c = 20, d = 20, ;

    let tg = TestGroup.builder("g").add(suite2).add(suite3).configure(cfg(("d", "D"))).build()
    prefix = "TGC"
    // ASSERT: scan TGC: a = 1, b = 2, d = D, ;
    // ASSERT: scan TGC: a = 10, b = 3, c = 20, d = D, ;
    tg.runTests()
    prefix = "TGC2"
    tg.runTests(cfg(("c", "220")))
    // ASSERT: scan TGC2: a = 1, b = 2, c = 220, d = D, ;
    // ASSERT: scan TGC2: a = 10, b = 3, c = 20, d = D, ;
}
