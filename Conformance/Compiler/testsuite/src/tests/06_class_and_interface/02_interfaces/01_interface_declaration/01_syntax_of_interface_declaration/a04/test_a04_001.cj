/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a04_001

  @Level:         1

  @Assertion: 6.2.1.1(4)
              The syntax of interface declaration is as follows.
              interfaceDefinition
                : interfaceModifierList? 'interface' identifier
                typeParameters?
                ('<:' superInterfaces)?
                genericConstraints?
                interfaceBody
                ;

  @Description: Check that correctly defined interfaces are compiled correctly

  @Mode: compileonly

  @Negative: no

  @Structure: single

*/

interface sB {}

interface EQe {
    func IoyCoV(): Bool
}

public interface `TZnQyzxm6` {}
public interface `jLrp0L` {}
interface `Li7kVONWA` <: `TZnQyzxm6` & `jLrp0L`  {}

public interface EVsv {}
public interface NF {}
interface `WCCyNf` <: EVsv & NF  {
    func `R_xv92Wd`(): Int8
}

interface EBhJAiSR<xY3RELL, `Pg916imS`, `V`> {}

interface `eVwd0RLk5`<`sKFrPWJ2`, pS3> {
    func EU(): Rune
}

public interface `eFDXdrj` {}
public interface kU71C {}
interface KhX<ewiEDMpgYy> <: `eFDXdrj` & kU71C  {}

public interface k6zPn4j {}
public interface `njIJe` {}
public interface I {}
interface JwJnRrb3Fb<`lxDHVC53`, Z, `EahfDDswJ`> <: k6zPn4j & `njIJe` & I  {
    func jQn6WL5F(): Float64
}

interface eBLv<`b7ZJ`, V> {}

interface `g_`<NKQT0SO2AH, `W3PD03ftW5`> {
    func sBL(): Array<Array<UInt8>>
}

public interface `Y` {}
interface tzW<`DGX5A0IsAL`, `fl9UYX`> <: `Y` {}

public interface w {}
public interface Cjk4Z2cexu {}
interface BIZWzC8O5H<C, Rx_7ZbzS, `Naa7iX7`, `Ca`> <: w & Cjk4Z2cexu {
    func h(): String
}

interface MdHcZbUs {}

public interface `unIP5eB1E` {
    func `lQf2m53`(): Unit
}

public interface abxd9gG72 {}
public interface `f961` {}
interface `hXwItI2fp` <: abxd9gG72 & `f961`  {}

public interface `XgiMr` {}
public interface U5ZC0X {}
public interface `CNh0NjNTrx` {}
public interface B1 <: `XgiMr` & U5ZC0X & `CNh0NjNTrx`  {
    func `rJvm`(): Rune
}

public interface ewUZdVpJz<`CD3KD`, MO1, `vB`, `I5Rwwfo2xj`> {}

public interface h<`A5ADS0X`, zsSe> {
    func `r61sBWh3V1`(): String
}

public interface `LP1mX` {}
public interface `YfZCipJsz` {}
interface z<`jQtq`, t> <: `LP1mX` & `YfZCipJsz`  {}

public interface `Wl6pf` {}
public interface `zY` {}
public interface qvvY5NEZ<`WK2Ld`, jQLFoj, y2CmrEDRE> <: `Wl6pf` & `zY`  {
    func `n3rTV5tg`(): (Bool) -> Float16
}

public interface `aUeGRMmHkj`<MTE, G9Swbz, YEKxk_OhO> {}

public interface VCXk7UbJs<`USiRTMaC`, Cyonh, qNk4J8, pkg4gxs> {
    func QK8qen1ddO(): String
}

public interface yiJd5Z {}
public interface hTi56ItXy {}
public interface `D6` {}
interface `Ax`<`AJcgt`, `pN`, `OkhSJ6Ip`> <: yiJd5Z & hTi56ItXy & `D6` {}

public interface `g9mXrYD` {}
public interface `R`<`Q`, `p7s_H4jpQ2`, BZ9i> <: `g9mXrYD` {
    func fLSK8(): (Unit, Range<Int32>, Bool)
}

main() {
}