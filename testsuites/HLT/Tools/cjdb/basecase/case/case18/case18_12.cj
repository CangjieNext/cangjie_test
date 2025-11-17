/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class AA {
    public static prop y: Int64 {
        get() {
            321
        }
    }
}

struct S {
    public mut static prop y: Int64 {
        get() {
            321
        }
        set(v) {
            v
        }
    }
}

interface NamedType {
    static func typename(): String {
        "A"
    }
}

class AB <: NamedType {}

public open class AC {}

extend AC {
    public func f1() {}
    protected func f2() {}
    private func f3() {}
    static func f4() {}
}

main(): Int64 {
    var b = AA.y
    var a = S.y
    var c = AB.typename()
    var d = AC.f4()
    return 0
}
