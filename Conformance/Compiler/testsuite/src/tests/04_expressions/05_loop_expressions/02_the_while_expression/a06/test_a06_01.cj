/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_02_a06_01

  @Level:         1

  @Assertion: 4.5.2(6) The while-let expression first evaluates the expression after <-
              (the type of the expression can be any type), and if the value of the expression
              matches the pattern after let, it executes the block after it, then recalculates
              the value of the expression and matches it again and determines whether to execute
              the loop again; if the match fails, it terminates the current while loop.
  @Description: Check that type of expression can be of any type
  @Mode: compileonly
  @Negative: no
  @Issue: 6473

*/

struct S { }
class C { }
enum E { Foo | Bar }
type Func = (Int32, Bool) -> String

func tag (i: Int32, b: Bool) { "${i} {b}" }

main() {
    while (let _ <- ())             { break }
    while (let _ <- true)           { break }
    while (let _ <- "String")       { break }
    while (let _ <- 1)              { break }
    while (let _ <- 1.1)            { break }
    while (let _ <- ([1, 2], Foo))  { break }
    while (let _ <- S())            { break }
    while (let _ <- C())            { break }
    while (let _ <- Some(true))     { break }
    while (let _ <- Some(tag))      { break }
    while (let _ <- None<Bool>)     { break }
    while (let _ <- None<Func>)     { break }
    while (let _ <- tag)            { break }
    while (let _ <- { i: Int32, b: Bool, f: Func => f(i,b) })                         { break }
    while (let _ <- { i: Int32, b: Bool, f: Func => f(i,b) } (Int32(100), true, tag)) { break }

    while (let x <- ())             { break }
    while (let x <- true)           { break }
    while (let x <- "String")       { break }
    while (let x <- 1)              { break }
    while (let x <- 1.1)            { break }
    while (let x <- ([1, 2], Foo))  { break }
    while (let x <- S())            { break }
    while (let x <- C())            { break }
    while (let x <- Some(true))     { break }
    while (let x <- Some(tag))      { break }
    while (let x <- None<Bool>)     { break }
    while (let x <- None<Func>)     { break }
    while (let x <- tag)            { break }
    while (let x <- { i: Int32, b: Bool, f: Func => f(i,b) })                         { break }
    while (let x <- { i: Int32, b: Bool, f: Func => f(i,b) } (Int32(100), true, tag)) { break }

    return 0
}
