/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

 package utils

import std.reflect.*
import std.collection.*
import std.time.*
import std.fs.*

// Any 结果格式化：Int64 → 十进制；其余 → TypeInfo.name（探针 P59：Unit 名为 "Unit"）
public func anyShow(r: Any): String {
    let t = TypeInfo.of(r)
    if (t.name == "Int64") {
        "${(r as Int64).getOrThrow()}"
    } else {
        t.name
    }
}

// ── apply 消息 oracle（消息契约 S 层：class_GenericApplyMatrix）──

public func msgInst2(inst: Any, f: InstanceFunctionInfo, args: Array<Any>): String {
    try {
        let r = f.apply(inst, args)
        return "OK:${anyShow(r)}"
    } catch (e: Exception) {
        return e.message
    }
}

public func msgInst3(inst: Any, f: InstanceFunctionInfo, targs: Array<TypeInfo>, args: Array<Any>): String {
    try {
        let r = f.apply(inst, targs, args)
        return "OK:${anyShow(r)}"
    } catch (e: Exception) {
        return e.message
    }
}

public func msgStat2(owner: TypeInfo, f: StaticFunctionInfo, args: Array<Any>): String {
    try {
        let r = f.apply(owner, args)
        return "OK:${anyShow(r)}"
    } catch (e: Exception) {
        return e.message
    }
}

public func msgStat3(owner: TypeInfo, f: StaticFunctionInfo, targs: Array<TypeInfo>, args: Array<Any>): String {
    try {
        let r = f.apply(owner, targs, args)
        return "OK:${anyShow(r)}"
    } catch (e: Exception) {
        return e.message
    }
}

public func msgG1(f: GlobalFunctionInfo, args: Array<Any>): String {
    try {
        let r = f.apply(args)
        return "OK:${anyShow(r)}"
    } catch (e: Exception) {
        return e.message
    }
}

public func msgG2(f: GlobalFunctionInfo, targs: Array<TypeInfo>, args: Array<Any>): String {
    try {
        let r = f.apply(targs, args)
        return "OK:${anyShow(r)}"
    } catch (e: Exception) {
        return e.message
    }
}

// ── get/查询轴消息 oracle ──

public func msgTypeGet(name: String): String {
    try {
        let t = ClassTypeInfo.get(name)
        return "OK:${t.name}"
    } catch (e: Exception) {
        return e.message
    }
}

public func msgConstruct(t: TypeInfo, args: Array<Any>): String {
    try {
        let ct = (t as ClassTypeInfo).getOrThrow()
        let r = ct.construct(args)
        return "OK:${anyShow(r)}"
    } catch (e: Exception) {
        return e.message
    }
}

public func msgCtorGet(t: TypeInfo, paramTypes: Array<TypeInfo>): String {
    try {
        let ct = (t as ClassTypeInfo).getOrThrow()
        let c = ct.getConstructor(paramTypes)
        return "OK:${c.toString()}"
    } catch (e: Exception) {
        return e.message
    }
}

public func msgGFuncGet(pkg: PackageInfo, name: String, paramTypes: Array<TypeInfo>): String {
    try {
        let f = pkg.getFunction(name, paramTypes)
        return "OK:${f.name}"
    } catch (e: Exception) {
        return e.message
    }
}

public func msgInstFuncGet(t: TypeInfo, name: String, paramTypes: Array<TypeInfo>): String {
    try {
        let ct = (t as ClassTypeInfo).getOrThrow()
        let f = ct.getInstanceFunction(name, paramTypes)
        return "OK:${f.name}"
    } catch (e: Exception) {
        return e.message
    }
}

// ── stdlib 自反射枚举 helper（std.core 无取柄 helper，经 functions 集合过滤）──

public func funcCount(pkg: PackageInfo, name: String): Int64 {
    pkg.functions.toArray().filter {f: GlobalFunctionInfo => f.name == name}.size
}

public func firstFuncToString(pkg: PackageInfo, name: String): String {
    let ms = pkg.functions.toArray().filter {f: GlobalFunctionInfo => f.name == name}
    if (ms.size > 0) {
        return ms[0].toString()
    }
    return "<none>"
}

public func firstFuncOwnParamCount(pkg: PackageInfo, name: String): Int64 {
    let ms = pkg.functions.toArray().filter {f: GlobalFunctionInfo => f.name == name}
    if (ms.size > 0) {
        return ms[0].genericParams.size
    }
    return -1
}

// ═════════════════════════════════════════════════════════════════
// 1008 缺口补平 oracle（13 缺口探锚 tmp/fill_probe_1008，cjc 1.3.0-alpha.02）
// 组合块形态：一次调用完成"取柄→读→写→再读"并返回管道拼接串，
// TC 侧对整串做恰一条 @Expect 断言。
// ═════════════════════════════════════════════════════════════════

// A-G1: 泛型 class 实例成员变量/属性 roundtrip（先读后写，ip 读 iv 故读序固定）
public func clsInstMemberRoundtrip(inst: Any): String {
    try {
        let gc = ClassTypeInfo.get("upstream.GM<Int64>")
        let iv = gc.getInstanceVariable("iv")
        let ip = gc.getInstanceProperty("ip")
        let v0 = "${(iv.getValue(inst) as Int64).getOrThrow()}"
        let p0 = "${(ip.getValue(inst) as Int64).getOrThrow()}"
        iv.setValue(inst, 666)
        let v1 = "${(iv.getValue(inst) as Int64).getOrThrow()}"
        ip.setValue(inst, 666)
        let p1 = "${(ip.getValue(inst) as Int64).getOrThrow()}"
        return "OK:${v0}->${v1}|${p0}->${p1}"
    } catch (e: Exception) {
        return e.message
    }
}

// A-G1: 泛型 class 静态成员变量/属性 roundtrip（静态存储在类型侧）
public func clsStaticMemberRoundtrip(): String {
    try {
        let gc = ClassTypeInfo.get("upstream.GM<Int64>")
        let sv = gc.getStaticVariable("sv")
        let sp = gc.getStaticProperty("sp")
        let a = "${(sv.getValue() as Int64).getOrThrow()}"
        let b = "${(sp.getValue() as Int64).getOrThrow()}"
        sv.setValue(666)
        let a1 = "${(sv.getValue() as Int64).getOrThrow()}"
        sp.setValue(2333)
        let b1 = "${(sp.getValue() as Int64).getOrThrow()}"
        return "OK:${a}->${a1}|${b}->${b1}"
    } catch (e: Exception) {
        return e.message
    }
}

// A-G1: 泛型 struct 静态成员 roundtrip（静态存储不随值语义拷贝）
public func structStaticMemberRoundtrip(): String {
    try {
        let gs = StructTypeInfo.get("upstream.GS<Int64>")
        let ssv = gs.getStaticVariable("ssv")
        let ssp = gs.getStaticProperty("ssp")
        let a = "${(ssv.getValue() as Int64).getOrThrow()}"
        let b = "${(ssp.getValue() as Int64).getOrThrow()}"
        ssv.setValue(666)
        let a1 = "${(ssv.getValue() as Int64).getOrThrow()}"
        ssp.setValue(777)
        let b1 = "${(ssp.getValue() as Int64).getOrThrow()}"
        return "OK:${a}->${a1}|${b}->${b1}"
    } catch (e: Exception) {
        return e.message
    }
}

// B-6: abstract 类 construct / abstract 函数 apply 消息文本（M14/M15）
public func abstractMemberMessages(): String {
    var c = "?"
    try {
        ClassTypeInfo.get("upstream.AbsBase").construct(Array<Any>())
        c = "no-throw"
    } catch (e: Exception) {
        c = e.message
    }
    var f = "?"
    try {
        let der = ClassTypeInfo.get("upstream.AbsDer").construct(Array<Any>())
        let fn = ClassTypeInfo.get("upstream.AbsBase").getInstanceFunction("absf")
        fn.apply(der, Array<Any>())
        f = "no-throw"
    } catch (e: Exception) {
        f = e.message
    }
    return "OK:${c}|${f}"
}

// B-6: immutable 变量/属性 setValue + setValue 类型错 + 构造器实参数错（M16/M17/M18/M5）
public func immutableMemberSetMessages(inst: Any): String {
    let gc = ClassTypeInfo.get("upstream.GM<Int64>")
    var m1 = "?"
    try {
        gc.getInstanceVariable("ro").setValue(inst, 8)
        m1 = "no-throw"
    } catch (e: Exception) {
        m1 = e.message
    }
    var m2 = "?"
    try {
        gc.getInstanceProperty("rop").setValue(inst, 8)
        m2 = "no-throw"
    } catch (e: Exception) {
        m2 = e.message
    }
    var m3 = "?"
    try {
        gc.getInstanceVariable("iv").setValue(inst, "s")
        m3 = "no-throw"
    } catch (e: Exception) {
        m3 = e.message
    }
    var m4 = "?"
    try {
        gc.getConstructor([TypeInfo.of<Int64>()]).apply(Array<Any>())
        m4 = "no-throw"
    } catch (e: Exception) {
        m4 = e.message
    }
    return "OK:${m1}|${m2}|${m3}|${m4}"
}

// A-G2: 泛型 TypeInfo 名字三形态（toString/name/qualifiedName）+ struct 同构
public func genericNameBlock(): String {
    try {
        let gc = ClassTypeInfo.get("upstream.GM<Int64>")
        let gs = StructTypeInfo.get("upstream.GS<Int64>")
        return "OK:${gc.toString()}|${gc.name}|${gc.qualifiedName}|${gs.toString()}"
    } catch (e: Exception) {
        return e.message
    }
}

// A-G2: 多参泛型 get 两形态等价 + 渲染恒逗号+空格
public func twoParamSpaceForms(): String {
    try {
        let a = ClassTypeInfo.get("upstream.Two<Int64,String>")
        let b = ClassTypeInfo.get("upstream.Two<Int64, String>")
        return "OK:${a.toString()}|${b.toString()}|${a.name}"
    } catch (e: Exception) {
        return e.message
    }
}

// B-1: ParameterInfo 自描述（构造器/全局函数首参 index 与构造器参数名）
public func paramIndexBlock(inst: Any): String {
    try {
        let gc = ClassTypeInfo.get("upstream.GM<Int64>")
        let cp = gc.getConstructor([TypeInfo.of<Int64>()]).parameters[0]
        let upkg = PackageInfo.get("upstream")
        let fp = upkg.getFunction("pgf1", [TypeInfo.of<Int64>()]).parameters[0]
        return "OK:${cp.index}|${cp.name}|${fp.index}"
    } catch (e: Exception) {
        return e.message
    }
}

// B-4: 包面签名 toString 精确文本（函数 0/1 参 + 变量 + 类型）
public func sigToStringBlock(): String {
    try {
        let upkg = PackageInfo.get("upstream")
        let f0 = upkg.getFunction("pgf0").toString()
        let f1 = upkg.getFunction("pgf1", [TypeInfo.of<Int64>()]).toString()
        let v = upkg.getVariable("pgv").toString()
        let t = upkg.getTypeInfo("upstream.Bound").toString()
        return "OK:${f0}|${f1}|${v}|${t}"
    } catch (e: Exception) {
        return e.message
    }
}

// B-2: isSubtypeOf 真值矩阵八连（原始 2 + 类层级 6；接口经包面 getTypeInfo 取柄）
public func subtypeMatrix(): String {
    try {
        let p1 = TypeInfo.of<Int64>().isSubtypeOf(TypeInfo.of<Int64>())
        let p2 = TypeInfo.of<UInt32>().isSubtypeOf(TypeInfo.of<Int8>())
        let der = ClassTypeInfo.get("upstream.AbsDer")
        let base = ClassTypeInfo.get("upstream.AbsBase")
        let cder = ClassTypeInfo.get("upstream.CDer")
        let cbase = ClassTypeInfo.get("upstream.CBase")
        let upkg = PackageInfo.get("upstream")
        let ia = upkg.getTypeInfo("upstream.IA")
        let ib = upkg.getTypeInfo("upstream.IB")
        let c1 = der.isSubtypeOf(base)
        let c2 = cder.isSubtypeOf(cbase)
        let c3 = cder.isSubtypeOf(ia)
        let c4 = cder.isSubtypeOf(ib)
        let c5 = ib.isSubtypeOf(ia)
        let c6 = ia.isSubtypeOf(ib)
        return "OK:${p1}|${p2}|${c1}|${c2}|${c3}|${c4}|${c5}|${c6}"
    } catch (e: Exception) {
        return e.message
    }
}

// B-3: sealedSubclasses 内容契约（sealed 闭包含自身/叶子空/非 sealed 空）
public func sealedSubclassesBlock(): String {
    try {
        let base = ClassTypeInfo.get("upstream.SealBase")
        let sub1 = ClassTypeInfo.get("upstream.SealSub1")
        let bound = ClassTypeInfo.get("upstream.Bound")
        let arr = ArrayList<String>()
        for (t in base.sealedSubclasses) {
            arr.add(t.qualifiedName)
        }
        arr.sort()
        let a1 = arr.toString()
        let arr2 = ArrayList<String>()
        for (t in sub1.sealedSubclasses) {
            arr2.add(t.qualifiedName)
        }
        let a2 = arr2.toString()
        let arr3 = ArrayList<String>()
        for (t in bound.sealedSubclasses) {
            arr3.add(t.qualifiedName)
        }
        let a3 = arr3.toString()
        return "OK:${a1}|${a2}|${a3}"
    } catch (e: Exception) {
        return e.message
    }
}

// B-7: modifiers 排序并列表六形矩阵
public func typeModifiers(ti: TypeInfo): String {
    let arr = ArrayList<String>()
    for (m in ti.modifiers) {
        arr.add(m.toString())
    }
    arr.sort()
    return arr.toString()
}

public func modifiersMatrix(): String {
    try {
        let p = PackageInfo.get("upstream")
        let a = typeModifiers(p.getTypeInfo("upstream.IfaceOpen"))
        let b = typeModifiers(p.getTypeInfo("upstream.IfaceSealed"))
        let c = typeModifiers(p.getTypeInfo("upstream.ClsPlain"))
        let d = typeModifiers(p.getTypeInfo("upstream.ClsOpen"))
        let e = typeModifiers(p.getTypeInfo("upstream.ClsAbs"))
        let f = typeModifiers(p.getTypeInfo("upstream.ClsAbsSealed"))
        return "OK:${a}|${b}|${c}|${d}|${e}|${f}"
    } catch (e: Exception) {
        return e.message
    }
}

// B-8: 嵌套 std 类型 qualifiedName（只嵌最外层包前缀）
public func nestedStdQualifiedName(): String {
    try {
        let a = TypeInfo.of<ArrayList<String>>().qualifiedName
        let b = TypeInfo.of<Box<String>>().qualifiedName
        let c = TypeInfo.of<Array<Array<String>>>().qualifiedName
        let d = TypeInfo.of<Option<Option<Box<String>>>>().qualifiedName
        return "OK:${a}|${b}|${c}|${d}"
    } catch (e: Exception) {
        return e.message
    }
}

// A-G4: getStaticFunction 单数取柄（按名+参数类型命中）
public func staticFuncSingularGet(): String {
    try {
        let f = ClassTypeInfo.get("upstream.GM<Int64>")
            .getStaticFunction("sf", [TypeInfo.of<Int64>()])
        return "OK:${f.name}"
    } catch (e: Exception) {
        return e.message
    }
}

// B-5: org:: 前缀声明包（organizationName + 限定名 get 命中）
public func orgNameBlock(): String {
    try {
        let p = PackageInfo.get("org::models")
        let cls = ClassTypeInfo.get("org::models.OrgCls")
        let en = EnumTypeInfo.get("org::models.OrgEnum")
        return "OK:${p.name}|${p.organizationName}|${cls.qualifiedName}|${en.qualifiedName}"
    } catch (e: Exception) {
        return e.message
    }
}

// A-G5: std.core print 双参重载族全量（升级哨兵，恰 15 个）
public func stdPrintTwoParamBlock(): String {
    try {
        let arr = ArrayList<String>()
        for (f in PackageInfo.get("std.core").functions) {
            if (f.name == "print" && f.parameters.size == 2) {
                arr.add(f.toString())
            }
        }
        arr.sort()
        return "OK:${arr.toString()}"
    } catch (e: Exception) {
        return e.message
    }
}

// A-G5: std.math abs 重载族全量（恰 7 个）
public func stdAbsOverloadBlock(): String {
    try {
        let arr = ArrayList<String>()
        for (f in PackageInfo.get("std.math").functions) {
            if (f.name == "abs") {
                arr.add(f.toString())
            }
        }
        arr.sort()
        return "OK:${arr.toString()}"
    } catch (e: Exception) {
        return e.message
    }
}

// A-G5: std 类型 TypeInfo.toString 九形（裸名/跨包限定/函数类型）
public func stdTypeToStrings(): String {
    try {
        let a = TypeInfo.of<Box<String>>().toString()
        let b = TypeInfo.of<Array<String>>().toString()
        let c = TypeInfo.of<Option<Option<Box<String>>>>().toString()
        let d = TypeInfo.of<ArrayList<String>>().toString()
        let e = TypeInfo.of<HashMap<String, Int64>>().toString()
        let f = TypeInfo.of<DateTime>().toString()
        let g = TypeInfo.of<Directory>().toString()
        let h = TypeInfo.of<ToString>().toString()
        let i = TypeInfo.of<(Int64) -> Unit>().toString()
        return "OK:${a}|${b}|${c}|${d}|${e}|${f}|${g}|${h}|${i}"
    } catch (e: Exception) {
        return e.message
    }
}

// A-G5: std 反射可见面负契约（std.env 不可见/copy/max 不在面/非限定 getTypeInfo 未命中）
public func stdVisibilityBlock(): String {
    var a = "?"
    try {
        let p = PackageInfo.get("std.env")
        a = p.name
    } catch (e: Exception) {
        a = e.message
    }
    var b = "?"
    try {
        let f = PackageInfo.get("std.core").getFunction("copy")
        b = f.name
    } catch (e: Exception) {
        b = e.message
    }
    var c = "?"
    try {
        let f = PackageInfo.get("std.math").getFunction("max")
        c = f.name
    } catch (e: Exception) {
        c = e.message
    }
    var d = "?"
    try {
        let t = PackageInfo.get("std.core").getTypeInfo("Box")
        d = t.name
    } catch (e: Exception) {
        d = e.message
    }
    return "OK:${a}|${b}|${c}|${d}"
}
