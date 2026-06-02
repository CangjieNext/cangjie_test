/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_a03_01

  @Level:         1

  @Assertion: 6.2.2(3)
              The syntax of interface members is as follows.
              interfaceMemberDeclaration
                : (functionDefinition|macroExpression|propertyDefinition) end*
                ;

  @Description: Check that described members can be defined in an interface

  @Mode: compileonly

  @Negative: no

  @Structure: complex-main

  @Dependencies: macro_defs.cj

  @Issue: 0006124
*/

import p1.*

interface I {
    func fhoh(): Int64
    func fnuirqhk(): Unit
    func fnubqfweu(x: Int64, fhuir: String, fnirq!: Int64): Int64
    func qtequr(p: Unit): Unit

    static func ebqyga(): Unit
    static func dhqirqn(): (Array<Unit>, String, Float32)
    static func ncyYR37(x: String): Rune
    static func BYR18g(fwo!: Bool): Unit

    static func BNF239<T>(): Unit
    static func NF29a3r<T>(): Range<Int64>
    static func bfu2ws<T>(x: T, y: T): Bool
    static func rqwu9<T>(fhu!: Rune): Unit

    func Ocne3_() {}
    func U7fh3b(pfwq: Rune, fhe_: String) {}
    func Nbuqer(x: Int64) {
        return 1
    }
    func Pfnquir() {
        return (20, r'a')
    }

    static func UFD_r2y92() {}
    static func BF368FI() {
        return "fjqoirjkf"
    }
    static func Nfuoqr84(fw: String, nfi!: Bool) {}
    static func N_fh37H(vnaf: Bool, fhiq: String) {
        return 10
    }

    static func _fhi249<T>() {}
    static func YF286_fh<T>() {
        return 410
    }
    static func Bfv3r1or3<T>(fas: Bool, bfsja: Rune) {}
    static func asqw<T>(pow!: String) {
        return pow + "ffqfa"
    }

    operator func -(x: I): Int64
    operator func /(fafg: I) {
        return fhoh()
    }

    mut prop fjaoir: String
    prop Fbiqr: Unit
    static mut prop Fbyuqr3: Int64
    static prop Nf383r: Float16

    mut prop FBqyriqr: (Int64, Int64) {
        get() {
            (1, 1)
        }
        set(v) {}
    }
    prop BNfgyq: String {
        get() {
            "frrfsf"
        }
    }
    static mut prop NF732f: Bool {
        get() {
            false
        }
        set(v) {}
    }
    static prop Nf3682f: Rune {
        get() {
            r'a'
        }
    }

    @InstFunc[fhur36](12)
    @StaticFunc[fhuiwr39]("")
    @StaticFuncGen[ppzaHr](-9)
    @InstFuncAbs[vnYr23](Int16)
    @StaticFuncAbs[NMpr23](Float16)
    @StaticFuncAbsGen[oohw](Rune)

    @Op[!](false)
    @OpAbs[-](String)

    @InstProp[Qadxtq](419)
    @InstMutProp[MNqr](1)
    @StaticProp[MNvtr3179](341)
    @StaticMutProp[Cqrr](414)
    @InstPropAbs[Bvkfa](Int64)
    @InstMutPropAbs[q_fh29](String)
    @StaticPropAbs[vb327fa](() -> Rune)
    @StaticMutPropAbs[Tfg238](Array<(String, Bool, Rune)>)
}

main() {
}