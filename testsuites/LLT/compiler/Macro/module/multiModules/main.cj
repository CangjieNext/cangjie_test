// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./mod1 ./mod2
// (Unix) EXEC: %mkdir build/mod1 build/mod2
// (Windows) EXEC: %mkdir build\mod1 build\mod2
// EXEC: %compiler %pkg_opt mod1/src/p1 -o ./build/mod1/libp1.%middle %compile_lib_opt
// EXEC: %compiler %pkg_opt mod1/src/p2 -o ./build/mod1/libp2.%middle %compile_lib_opt
// EXEC: %compiler %pkg_opt mod1/src/p3 -o ./build/mod1/ --compile-macro
// EXEC: %compiler %pkg_opt mod2/src/p11 %import_path_opt ./build/mod1/ -o ./build/mod2/libp11.%middle %compile_lib_opt
// EXEC: %compiler %pkg_opt mod2/src/p22 %import_path_opt ./build/mod1/ -o ./build/mod2/libp22.%middle %compile_lib_opt
// EXEC: %compiler %pkg_opt mod2/src/p33 %import_path_opt ./build/mod1/ -o ./build/mod2/libp33.%middle %compile_lib_opt
// EXEC: %compiler main.cj ./build/mod1/libp1.%middle ./build/mod1/libp2.%middle ./build/mod2/libp11.%middle ./build/mod2/libp22.%middle ./build/mod2/libp33.%middle %import_path_opt ./build/mod1/ %import_path_opt ./build/mod2 -o %output
// EXEC: %run %run_opt %run_args %output 2>&1 | compare %f

/* SCAN
A sayHi
A1 sayHi
A2 sayHi
A3 sayHi
B1 sayHi
B2 sayHi
B3 sayHi
D1 sayHi
D2 sayHi
D3 sayHi
42
C1 sayHi
C2 sayHi
C3 sayHi
*/

/**
 * This test case aims to test the stability of macro when used in
 * a relatively large project. main.cj uses two modules, mod1 and
 * mod2. In mod1/p3, we define macro M1 and M2. In mod2, all packages
 * p11, p22, p33 use macro M1, M2. In order to do module-compile for
 * this project, we should do the followings.
 *
 * 0. create a directory build/ with mod1/ and mod2/ as sub directories
 *    set MODULE_PATH1=build/mod1
 *    set MODULE_PATH2=build/mod2
 *    export CANGJIE_PATH=$CANGJIE_PATH:$pwd/build
 *
 * 1. compile mod1 first.
 *    cjc --module mod1 -o $MODULE_PATH1 -c
 *
 * 2. compile mod2, which relies on the macro in mod1.
 *    cjc --module mod2 -o $MODULE_PATH2 -c $MODULE_PATH1/p3.o
 *
 * 3. compile main.cj which uses mod1 and mod2
 *    cjc $MODULE_PATH1/p3.o main.cj
 *
 * Notice: the pain to use macro here is to always explictly write p3.o in
 * the command line. p3.o is produced by the macro definition. We hope to
 * be able to remove it in the future. Also, for more info about module-compile
 * and its automation, check out UserManual and CPM.
 */

internal import mod1.p1.*
internal import mod1.p2.*
import mod1.p3.*
internal import mod2.p11.beep as beep
internal import mod2.p22.wee as wee
internal import mod2.p33.wow as wow
internal import mod2.p33.mew as mew

@M1
class A {}

main(): Int64 {
    let a = A()
    a.sayHi()

    beep()
    wee()
    wow()
    mew()

    0
}

// cjc ./build1/mod1/p3/p3.o main.cj
//     |___________________|
//               |
//   can we ignore this .o file?
//   Working on that!!!
