/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

 package dlutils

import std.reflect.*

public func dlLoadMeta(path: String): String {
    try {
        let m = PackageInfo.load(path)
        return "OK:${m.name}|${m.qualifiedName}|${m.version}"
    } catch (e: Exception) {
        return e.message
    }
}

public func dlLoadTwo(p1: String, p2: String): String {
    try {
        let m1 = PackageInfo.load(p1)
        let m2 = PackageInfo.load(p2)
        return "OK:${m1.qualifiedName}|${m2.qualifiedName}"
    } catch (e: Exception) {
        return e.message
    }
}

public func dlPkgTypeGet(path: String, qual: String): String {
    try {
        let m = PackageInfo.load(path)
        let t = m.getTypeInfo(qual)
        return "OK:${t.name}|${t.qualifiedName}"
    } catch (e: Exception) {
        return e.message
    }
}

public func dlPkgVarGet(path: String, name: String): String {
    try {
        let m = PackageInfo.load(path)
        let v = m.getVariable(name)
        return "OK:${v.name}"
    } catch (e: Exception) {
        return e.message
    }
}

public func dlVarMissMsg(path: String, name: String): String {
    try {
        let m = PackageInfo.load(path)
        let v = m.getVariable(name)
        return "OK:${v.name}"
    } catch (e: Exception) {
        return e.message
    }
}

public func dlPkgFuncGet(path: String, name: String): String {
    try {
        let m = PackageInfo.load(path)
        let f = m.getFunction(name)
        return "OK:${f.name}"
    } catch (e: Exception) {
        return e.message
    }
}

public func dlPkgCounts(path: String): String {
    try {
        let m = PackageInfo.load(path)
        return "OK:${m.typeInfos.size}|${m.variables.size}|${m.functions.size}"
    } catch (e: Exception) {
        return e.message
    }
}

public func dlPkgConstruct(path: String, qual: String): String {
    try {
        let m = PackageInfo.load(path)
        let ct = (m.getTypeInfo(qual) as ClassTypeInfo).getOrThrow()
        let inst = ct.construct([])
        return "OK:${TypeInfo.of(inst).name}"
    } catch (e: Exception) {
        return e.message
    }
}

public func dlLoadMsg(path: String): String {
    try {
        let m = PackageInfo.load(path)
        return "OK:${m.qualifiedName}"
    } catch (e: Exception) {
        return e.message
    }
}

public func dlLoadTwice(path: String): String {
    try {
        let m = PackageInfo.load(path)
        try {
            let m2 = PackageInfo.load(path)
            return "OK:${m2.qualifiedName}"
        } catch (e2: Exception) {
            return e2.message
        }
    } catch (e: Exception) {
        return "first-load:${e.message}"
    }
}

// ── 1008 缺口补平（C-G2）：loaded 包变量值读取与改写 roundtrip ──

// 非 public 包级变量可见性钉面（1008 G4 实测定谳）：variables 枚举
// 不含非 public 成员 → 找不到目标时返回 "OK:absent"（缺席即事实，
// 不虚构取柄路径）。public 变量命中时才走到 getValue()（Int64 存储）
public func dlPkgVarValue(path: String, name: String): String {
    try {
        let m = PackageInfo.load(path)
        var found = "absent"
        for (v in m.variables) {
            if (v.name == name) {
                found = "${(v.getValue() as Int64).getOrThrow()}"
            }
        }
        return "OK:${found}"
    } catch (e: Exception) {
        return e.message
    }
}

// public 包级 Int8 变量 getValue→setValue→getValue 持久（探针 C-G2 同语义）
// 形参 Int64（1008 G4 实证：IntegerLiteral 渲染为 -12i64，cjc 拒 Int64 字面量
// 直配 Int8 形参），箱内 Int8(nv) 显式转换
public func dlInt8VarRoundtrip(path: String, name: String, nv: Int64): String {
    try {
        let m = PackageInfo.load(path)
        var r = "??"
        for (v in m.variables) {
            if (v.name == name) {
                let v0 = "${(v.getValue() as Int8).getOrThrow()}"
                v.setValue(Int8(nv))
                r = "${v0}->${(v.getValue() as Int8).getOrThrow()}"
            }
        }
        return "OK:${r}"
    } catch (e: Exception) {
        return e.message
    }
}
