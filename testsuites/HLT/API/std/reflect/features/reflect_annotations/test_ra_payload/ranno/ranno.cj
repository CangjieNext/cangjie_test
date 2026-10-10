/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

 package ranno

import std.reflect.*
import rann.*

// ── 穿透族 ──
public func raTypeAnnoCounts(): String {
    try {
        let c = TypeInfo.get("rann.CRich").annotations.size
        let i = TypeInfo.get("rann.IRich").annotations.size
        let s = TypeInfo.get("rann.SRich").annotations.size
        return "OK:${c}|${i}|${s}"
    } catch (e: Exception) { return e.toString() }
}

public func raMemberAnnoCounts(): String {
    try {
        let ct = (TypeInfo.of(CRich(3)) as ClassTypeInfo).getOrThrow()
        let f = ct.getInstanceFunction("fm").annotations.size
        let v = ct.getInstanceVariable("fv").annotations.size
        let k = ct.getConstructor(TypeInfo.of<Int64>()).annotations.size
        return "OK:${f}|${v}|${k}"
    } catch (e: Exception) { return e.toString() }
}

public func raParamAnnoCounts(): String {
    try {
        let ct = (TypeInfo.of(CRich(3)) as ClassTypeInfo).getOrThrow()
        let ctor = ct.getConstructor(TypeInfo.of<Int64>())
        return "OK:${ctor.parameters[0].annotations.size}|${ctor.parameters.size}"
    } catch (e: Exception) { return e.toString() }
}

public func raInterfaceMember(): String {
    try {
        let it = TypeInfo.get("rann.IRich")
        let f = (it as InterfaceTypeInfo).getOrThrow().getInstanceFunction("ifm")
        return "OK:${f.annotations.size}|${it.annotations.size}"
    } catch (e: Exception) { return e.toString() }
}

public func raStructVar(): String {
    try {
        let st = TypeInfo.get("rann.SRich")
        let v = (st as StructTypeInfo).getOrThrow().getInstanceVariable("sv")
        return "OK:${v.annotations.size}|${st.annotations.size}"
    } catch (e: Exception) { return e.toString() }
}

public func raFindPresence(): String {
    try {
        let c = TypeInfo.of(CRich(3))
        let ct = (c as ClassTypeInfo).getOrThrow()
        let t = if (c.findAnnotation<RAOne>().isSome()) { 1 } else { 0 }
        let f = if (ct.getInstanceFunction("fm").findAnnotation<RAMix>().isSome()) { 1 } else { 0 }
        let p = if (ct.getConstructor(TypeInfo.of<Int64>()).parameters[0].findAnnotation<RAOne>().isSome()) { 1 } else { 0 }
        return "OK:${t}|${f}|${p}"
    } catch (e: Exception) { return e.toString() }
}

// ── payload 族（双段 getOrThrow 后读字段）──
public func raPayloadType(): String {
    try {
        let c = TypeInfo.of(CRich(3))
        let one = (c.findAnnotation<RAOne>().getOrThrow() as RAOne).getOrThrow().value
        let mix = (c.findAnnotation<RAMix>().getOrThrow() as RAMix).getOrThrow()
        return "OK:${one}|${mix.p2}|${mix.p3}"
    } catch (e: Exception) { return e.toString() }
}

public func raPayloadFunc(): String {
    try {
        let ct = (TypeInfo.of(CRich(3)) as ClassTypeInfo).getOrThrow()
        let mix = (ct.getInstanceFunction("fm").findAnnotation<RAMix>().getOrThrow() as RAMix).getOrThrow()
        return "OK:${mix.p2}|${mix.p3}"
    } catch (e: Exception) { return e.toString() }
}

public func raPayloadVar(): String {
    try {
        let ct = (TypeInfo.of(CRich(3)) as ClassTypeInfo).getOrThrow()
        let one = (ct.getInstanceVariable("fv").findAnnotation<RAOne>().getOrThrow() as RAOne).getOrThrow().value
        return "OK:${one}"
    } catch (e: Exception) { return e.toString() }
}

public func raPayloadParam(): String {
    try {
        let ct = (TypeInfo.of(CRich(3)) as ClassTypeInfo).getOrThrow()
        let one = (ct.getConstructor(TypeInfo.of<Int64>()).parameters[0].findAnnotation<RAOne>().getOrThrow() as RAOne).getOrThrow().value
        return "OK:${one}"
    } catch (e: Exception) { return e.toString() }
}

public func raPayloadIface(): String {
    try {
        let it = TypeInfo.get("rann.IRich")
        let f = (it as InterfaceTypeInfo).getOrThrow().getInstanceFunction("ifm")
        let mix = (f.findAnnotation<RAMix>().getOrThrow() as RAMix).getOrThrow()
        return "OK:${mix.p2}"
    } catch (e: Exception) { return e.toString() }
}

public func raPayloadMiss(): String {
    try {
        let n = if (TypeInfo.get("rann.SRich").findAnnotation<RAMix>().isNone()) { "none" } else { "unexpected" }
        return "OK:${n}"
    } catch (e: Exception) { return e.toString() }
}

// ── 相等语义族 ──
public func raEqSame(): String {
    try {
        let a = TypeInfo.of(CRich(3))
        let b = TypeInfo.of(CRich(9))
        return "OK:${a == b}"
    } catch (e: Exception) { return e.toString() }
}

public func raEqPrim(): String {
    try {
        let a = TypeInfo.of(Int64(1))
        let b = TypeInfo.of(Int64(2))
        return "OK:${a == b}"
    } catch (e: Exception) { return e.toString() }
}

public func raEqCross(): String {
    try {
        let a = TypeInfo.of(CRich(3))
        let b = TypeInfo.of(Int64(1))
        return "OK:${a == b}"
    } catch (e: Exception) { return e.toString() }
}

public func raHashSelf(): String {
    try {
        let a = TypeInfo.of(CRich(3))
        let b = TypeInfo.of(CRich(9))
        return "OK:${a.hashCode() == b.hashCode()}"
    } catch (e: Exception) { return e.toString() }
}

// ── construct 族 ──
public func raConstructDrill(): String {
    try {
        let ct = (TypeInfo.of(CRich(3)) as ClassTypeInfo).getOrThrow()
        let inst = (ct.construct([Int64(3)]) as CRich).getOrThrow()
        return "OK:${inst.fv}"
    } catch (e: Exception) { return e.toString() }
}

public func raConstructAbstract(): String {
    try {
        let ca = (TypeInfo.of<CAbs>() as ClassTypeInfo).getOrThrow()
        let x = ca.construct([])
        return "OK:${TypeInfo.of(x).name}"
    } catch (e: Exception) { return e.toString() }
}

public func raConstructMiss(): String {
    try {
        let ct = (TypeInfo.of(CRich(3)) as ClassTypeInfo).getOrThrow()
        let x = ct.construct([Int64(1), Int64(2)])
        return "OK:${TypeInfo.of(x).name}"
    } catch (e: Exception) { return e.toString() }
}

public func raConstructThrow(): String {
    try {
        let c = (TypeInfo.of<CThrow>() as ClassTypeInfo).getOrThrow()
        let x = c.construct([])
        return "OK:${TypeInfo.of(x).name}"
    } catch (e: Exception) { return e.toString() }
}
