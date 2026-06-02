/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_03_a05_01

  @Level:         1

  @Assertion:       4.4.3(5) The syntax of pattern guard is as follows.
                    patternGuard
                        : 'where' expression
                        ;

  @Description:     Check correct usages of different patternGuards in match expressions.

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
    match (0) {
        case 0 where true => ()
        case _ => ()
    }

    // Variable name
    match (0) {
        case 0 where B => ()
        case _ => ()
    }

    // Function name/function invocation expression
    match (0) {
        case 0 where f(false) => ()
        case _ => ()
    }

    // Conditional expression
    match (0) {
        case 0 where if (1 << 20 > 0) { true } else { false } => ()
        case _ => ()
    }

    // Pattern matching expression
    match (0) {
        case x where
            match ( (f(false), f(true)) ) {
                case _ => x == 0
            } => ()
        case _ => ()
    }

    // Try expressions
    match (0) {
        case 0 where try { throw Exception() } catch (_: Exception) { true } => ()
        case _ => ()
    }
    match (0) {
        case 0 where try { true } catch (_: Exception) { true } => ()
        case _ => ()
    }

    // Synchronized expression
    match (0) {
        case 0 where synchronized(ReentrantMutex()) { true } => ()
        case _ => ()
    }

    // Parenthesized expression
    match (0) {
        case 0 where (true) => ()
        case _ => ()
    }

    // Member access
    match (0) {
        case 0 where S.s => ()
        case _ => ()
    }

    // Index access
    match (0) {
        case 0 where (false, true)[1] => ()
        case _ => ()
    }

    // Relational expressions
    match (0) {
        case 0 where 0 == 0 => ()
        case _ => ()
    }
    match (0) {
        case 0 where 0 != 1 => ()
        case _ => ()
    }
    match (0) {
        case 0 where 0 < 1 => ()
        case _ => ()
    }
    match (0) {
        case 0 where 0 <= 1 => ()
        case _ => ()
    }
    match (0) {
        case 0 where 1 > 0 => ()
        case _ => ()
    }
    match (0) {
        case 0 where 1 >= 0 => ()
        case _ => ()
    }

    // 'is'
    match (0) {
        case 0 where false is Bool => ()
        case _ => ()
    }

    // Logical expressions
    match (0) {
        case 0 where !false => ()
        case _ => ()
    }
    match (0) {
        case 0 where true && true => ()
        case _ => ()
    }
    match (0) {
        case 0 where false || true => ()
        case _ => ()
    }

    // Coalescing
    match (0) {
        case 0 where Option<Bool>.None ?? true => ()
        case _ => ()
    }
    match (0) {
        case 0 where Some(true) ?? false => ()
        case _ => ()
    }

    // Pipeline
    match (0) {
        case 0 where false |> f => ()
        case _ => ()
    }
}
