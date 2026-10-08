// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [S8_host_kinds] 宿主结构矩阵: 七类声明/表达式容器内死代码
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: 语言规格宿主结构补盲（§4 lambda/S4 未覆盖的带值 return 形态 + init/setter(mut prop)/enum 成员函数/catch 块体/try 表达式块/spawn 闭包——七类容器跨函数各报 1 条; init/setter/spawn 内裸 return 必须带分号, 无分号换行续行合并为 parse_nl_warning 不产生 unreachable; 1.3.0-alpha 探针 L6/L17/L28/L38/L47/L54/L65 七根实测, 运行期死语句均不执行）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-7 "DiagKind": "chir_dce_unreachable_expression_hint"

import std.sync.*

func lambdaHost(): Int64 {
    let g = { =>
        return 5
        println("dead in lambda")
        6
    }
    return g()
}

class InitHost {
    var x: Int64 = 0
    init() {
        x = 1
        return;
        x = 2
    }
}

class SetterHost {
    var y: Int64 = 0
    public mut prop p: Int64 {
        get() { y }
        set(v) {
            y = v
            return;
            y = 99
        }
    }
}

enum Color {
    Red | Green

    func name(): String {
        return "c"
        "dead"
    }
}

func catchHost() {
    try {
        throw Exception("x")
    } catch (e: Exception) {
        return;
        println("dead catch body")
    }
}

func tryHost(): Int64 {
    let v = try {
        return 1
        0
    } catch (e: Exception) {
        0
    }
    return v
}

func spawnHost() {
    let fut = spawn {
        println("in spawn")
        return;
        println("dead spawn")
    }
    fut.get()
}

main() {
    println(lambdaHost())
    let a = InitHost()
    println(a.x)
    let c = SetterHost()
    c.p = 1
    println(c.p)
    println(Color.Red.name())
    catchHost()
    println(tryHost())
    spawnHost()
}
