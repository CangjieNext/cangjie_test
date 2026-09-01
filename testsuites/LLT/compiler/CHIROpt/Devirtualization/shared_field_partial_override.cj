// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: Holder.sink typed as Stream; Good overrides, Bad inherits base write,
// Other overrides — shared field call must stay Invoke, not rewrite to Other/Good.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6Holder4sinkHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7default6StreamE&->@_CN7default6Stream5writeHv
// ASSERT: scan-not Apply(Class-_CN7default5OtherE&->@_CN7default5Other5writeHv
// ASSERT: scan-not Apply(Class-_CN7default4GoodE&->@_CN7default4Good5writeHv

interface Tag {
    func id(): Int64
}

class TagA <: Tag {
    public func id(): Int64 {
        1
    }
}

class TagB <: Tag {
    public func id(): Int64 {
        2
    }
}

class TagC <: Tag {
    public func id(): Int64 {
        3
    }
}

abstract class Stream {
    public open func write(): Int64 {
        0
    }
}

abstract class Base<T> <: Stream where T <: Tag {
    protected var tag: T = unsafe { zeroValue<T>() }

    public open func write(): Int64 {
        tag.id()
    }
}

class Good <: Base<TagA> {
    public init() {
        this.tag = TagA()
    }

    public override func write(): Int64 {
        10 + super.write()
    }
}

class Bad <: Base<TagB> {
    public init() {
        this.tag = TagB()
    }
}

class Other <: Base<TagC> {
    public init() {
        this.tag = TagC()
    }

    public override func write(): Int64 {
        30 + super.write()
    }
}

class Holder {
    private var s: Stream

    public init(s: Stream) {
        this.s = s
    }

    public func sink(): Int64 {
        s.write()
    }
}

func make(kind: Int64): Stream {
    if (kind == 0) {
        return Bad()
    } else if (kind == 1) {
        return Other()
    }
    return Good()
}

main(): Int64 {
    Holder(make(2)).sink() - 11
}
