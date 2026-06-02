// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj %f.expect
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt  %f --debug-macro -o %output
// EXEC: %diff %f.macrocall %f.expect

import define.*

@Operator
public class Pet {
    private var name: String = "A pet"
    public init() {
    }

    public init(name: String) {
        this.name = name
    }

    public func getName(): String {
        return this.name
    }

    public func setName(name: String) {
        this.name = name
    }

    public func toString(): String {
        return "(Pet: ${name})"
    }

    public operator func >=(rhs: Pet): Bool {
        return this.getName() >= rhs.getName()
    }

    public operator func ==(rhs: Pet): Bool {
        return this.getName() == rhs.getName()
    }

    public operator func !=(rhs: Pet): Bool {
        return !(this == rhs)
    }
}

main() {
    return 0
}
