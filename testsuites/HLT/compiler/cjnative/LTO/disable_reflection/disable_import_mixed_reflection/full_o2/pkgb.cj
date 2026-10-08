// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgb

public struct Frame<T> {
    public var w: T
    public var h: T
    public var label: String
    public init(w: T, h: T) {
        this.w = w
        this.h = h
        this.label = "frame"
    }
    public func area(): T {
        return w
    }
    public func labelOf(): String {
        return label
    }
}

public interface Glow {
    func glow(): Bool
}

public class Lamp <: Glow {
    public var on: Bool
    public init() {
        this.on = false
    }
    public func glow(): Bool {
        return on
    }
    public func toggle(): Unit {
        on = !on
    }
}

// 关联值枚举
public enum Slot {
    | Empty
    | Full(Int64)
}

public func slotValue(s: Slot): Int64 {
    return match (s) {
        case Empty => 0
        case Full(v) => v
    }
}
