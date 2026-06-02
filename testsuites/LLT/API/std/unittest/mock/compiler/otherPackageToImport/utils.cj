/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package otherPackageToImport

public class PassedBar <: ToString {
    public override func toString() {
        "This is Bar"
    }
}

public class PassedAnotherBar <: ToString {
    public override func toString() {
        "This is AnotherBar"
    }
}

public class ReturnedBar <: ToString {
    private let x: String
    public init(x: String) {
        this.x = x
    }
    public override func toString() {
        "This is ReturnedBar (${x})"
    }
}
