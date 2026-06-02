/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_03_a05_02

  @Level:         1

  @Assertion:       4.4.3(5) The syntax of pattern guard is as follows.
                    patternGuard
                        : 'where' expression
                        ;

  @Description:     Check correct usages of different patternGuards in for-in expressions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  ignore

*/

import std.sync.*

struct Struct {
    let s = true
}

let B = true
let S = Struct()
func f(_: Bool) { true }

main() {
    // Literal
    for (b in [true] where true) {}

    // Variable name
    for (b in [true] where B) {}
    for (b in [true] where b) {}

    // Function name/function invocation expression
    for (b in [true] where f(b)) {}

    // Conditional expression
    for (b in [true] where if (1 << 20 > 0) { b } else { false }) {}

    // Pattern matching expression
    for (b in [true] where match ( (f(false), f(b)) ) {
                            case _ => b
                        }
        ) {}

    // Try expressions
    for (b in [true] where try { throw Exception() } catch (_: Exception) { b }) {}
    for (b in [true] where try { b } catch (_: Exception) { b }) {}

    // Synchronized expression
    for (b in [true] where synchronized(ReentrantMutex()) { b }) {}

    // Parenthesized expression
    for (b in [true] where (b)) {}

    // Member access
    for (b in [true] where S.s) {}

    // Index access
    for (b in [true] where (b, false)[0]) {}

    // Relational expressions
    for (b in [true] where b == true) {}
    for (b in [true] where b != false) {}
    for (_ in [true] where 0 < 1) {}
    for (_ in [true] where 0 <= 1) {}
    for (_ in [true] where 1 > 0) {}
    for (_ in [true] where 1 >= 0) {}

    // 'is'
    for (b in [true] where true is Bool) {}

    // Logical expressions
    for (b in [true] where !false) {}
    for (b in [true] where true && true) {}
    for (b in [true] where false || b) {}

    // Coalescing
    for (b in [true] where Option<Bool>.None ?? b) {}
    for (b in [true] where Some(b) ?? false) {}

    // Pipeline
    for (b in [true] where b |> f) {}
}
