/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_02_a02_06

  @Level:         1

  @Assertion:   4.17.2(2) When the runtime type R of e is a subtype of T, the value of e as T is Some(e), otherwise the
                value is None.
  @Description: Check that (e as T) is not None for various T when the type of e is Nothing.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: Ignore

*/

interface I {}

class C {}

class G<T> {}

func check(n : Nothing) {
    (n as Int8).getOrThrow()
    (n as Int16).getOrThrow()
    (n as Int32).getOrThrow()
    (n as Int64).getOrThrow()
    (n as IntNative).getOrThrow()
    (n as UInt8).getOrThrow()
    (n as UInt16).getOrThrow()
    (n as UInt32).getOrThrow()
    (n as UInt64).getOrThrow()
    (n as UIntNative).getOrThrow()
    (n as Float16).getOrThrow()
    (n as Float32).getOrThrow()
    (n as Float64).getOrThrow()
    (n as Bool).getOrThrow()
    (n as Rune).getOrThrow()
    (n as String).getOrThrow()
    (n as Array<UInt8>).getOrThrow()
    (n as Range<Int64>).getOrThrow()
    (n as (Rune, Int16)).getOrThrow()
    (n as Unit).getOrThrow()
    (n as C).getOrThrow()
    (n as I).getOrThrow()
    (n as G<String>).getOrThrow()
}

main() {
    do { check(break) } while (false)

    0
}
