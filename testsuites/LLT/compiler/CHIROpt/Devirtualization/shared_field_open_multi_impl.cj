// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: open Handler.dispatch holds open Plugin; multiple Plugin subclasses with
// only some overriding fire — field Invoke must not become Apply to a concrete Plugin.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default7Handler8dispatchHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7default6PluginE&->@_CN7default6Plugin4fireHv
// ASSERT: scan-not Apply(Class-_CN7default6LoudPE&->@_CN7default6LoudP4fireHv
// ASSERT: scan-not Apply(Class-_CN7default5MutePE&->@_CN7default5MuteP4fireHv

open class Plugin {
    public open func fire(): Int64 {
        1
    }
}

class QuietP <: Plugin {}

class LoudP <: Plugin {
    public override func fire(): Int64 {
        2
    }
}

class MuteP <: Plugin {
    public override func fire(): Int64 {
        3
    }
}

open class Handler {
    private var p: Plugin

    public init(p: Plugin) {
        this.p = p
    }

    public open func dispatch(): Int64 {
        p.fire()
    }
}

func pick(n: Int64): Plugin {
    if (n == 0) {
        return QuietP()
    } else if (n == 1) {
        return LoudP()
    }
    return MuteP()
}

main(): Int64 {
    Handler(pick(1)).dispatch() - 2
}
