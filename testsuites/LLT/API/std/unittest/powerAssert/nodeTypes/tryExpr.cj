/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TryExprTest {
    @TestCase
    func caseOrdinary(): Unit {
        let returning = {=> 5321}
        let caught1 = 0
        let caught2 = 1
        @PowerAssert(
            try { 
                returning()
            } catch(e: IllegalStateException | IllegalArgumentException) { 
                caught1 
            } catch(_) { 
                caught2
            }, 0)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}try { returning() } catch (e: IllegalStateException | IllegalArgumentException) { caught1 } catch (_) { caught2 } == 0{/COLOR})`
                    |     |___________|                                                                                               |
                    |          5321                                                                                                   |
                    |_________________________________________________________________________________________________________________|
                                                                            5321
     */
    @TestCase
    func caseCatch(): Unit {
        let throwing: () -> Int64 = {=> throw IllegalStateException()}
        let caught = 0
        @PowerAssert(
            try { throwing() } catch(_: IllegalStateException) { caught },
            caught + 1
        )
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=GRAY}try { {/COLOR}{COLOR=RED}throwing(){/COLOR}{COLOR=GRAY} } catch (_: IllegalStateException) { caught } == caught + 1{/COLOR})`
                    |     |__________|                                             |             |
                    |[IllegalStateException]                                       |             |
                    |______________________________________________________________|             |
                    |                        [not computed]                                      |
                    |____________________________________________________________________________|
                                                    [not computed]
     */
    @TestCase
    func caseFinally(): Unit {
        let throwing: () -> Int64 = {=> throw IllegalStateException()}
        let caught = 0
        let final = 1
        @PowerAssert(
            try { throwing() } catch(_: IllegalStateException) { caught } finally { final },
            caught
        )
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=GRAY}try { {/COLOR}{COLOR=RED}throwing(){/COLOR}{COLOR=GRAY} } catch (_: IllegalStateException) { caught } finally { {/COLOR}{COLOR=YELLOW}final{/COLOR}{COLOR=GRAY} } == caught{/COLOR})`
                    |     |__________|                                                       |_____| |         |
                    |[IllegalStateException]                                                    1    |         |
                    |________________________________________________________________________________|         |
                    |                                 [not computed]                                           |
                    |__________________________________________________________________________________________|
                                                           [not computed]
     */
    @TestCase
    func caseResource(): Unit {
        let throwing: () -> Bool = {=> throw IllegalStateException()}
        let _res1 = Res(1)
        let _res2 = Res(2)
        @PowerAssert(
            try(res = _res1, res2 = _res2, res3 = _res2) {
                !res.flag && !res2.flag && throwing()
            } catch(_: IllegalStateException) {
                _res1.flag
            } finally { _res1.flag } != ()
        )
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=GRAY}try (res = {/COLOR}{COLOR=YELLOW}_res1{/COLOR}{COLOR=GRAY}, res2 = {/COLOR}{COLOR=YELLOW}_res2{/COLOR}{COLOR=GRAY}, res3 = {/COLOR}{COLOR=YELLOW}_res2{/COLOR}{COLOR=GRAY}) { {/COLOR}{COLOR=YELLOW}!res.flag && !res2.flag{/COLOR}{COLOR=GRAY} && {/COLOR}{COLOR=RED}throwing(){/COLOR}{COLOR=GRAY} } catch (_: IllegalStateException) { _res1.flag } finally { {/COLOR}{COLOR=YELLOW}_res1.flag{/COLOR}{COLOR=GRAY} } != (){/COLOR})`
                    |          |_____|       |_____|       |_____|  ||   |    |  ||____|    |  |          |                                                           |_____|    | |     |
                    |        Res(1:false)  Res(2:false)  Res(2:false)|   |    |Res(2:false) |  |          |                                                         Res(1:true)  | |     |
                    |                                               ||___|    |  ||_________|  |          |                                                           |__________| |     |
                    |                                             Res(1:false)|  |   false  |  |          |                                                               true     |     |
                    |                                               ||________|  |__________|  |          |                                                                        |     |
                    |                                               |   false |      true   |  |          |                                                                        |     |
                    |                                               |_________|             |  |__________|                                                                        |     |
                    |                                               |   true              [IllegalStateException]                                                                  |     |
                    |                                               |_______________________|             |                                                                        |     |
                    |                                               |          true                       |                                                                        |     |
                    |                                               |_____________________________________|                                                                        |     |
                    |                                                            [not computed]                                                                                    |     |
                    |______________________________________________________________________________________________________________________________________________________________|     |
                    |                                                                        [not computed]                                                                              |
                    |____________________________________________________________________________________________________________________________________________________________________|
                                                                                                [not computed]
     */
}

class Res <: Resource & ToString {
    Res(let id: Int64) {}
    var flag = false
    public func isClosed() {
        flag
    }
    public func close() {
        flag = true
    }

    public func toString() {
        "Res(${id}:${flag})"
    }
}
