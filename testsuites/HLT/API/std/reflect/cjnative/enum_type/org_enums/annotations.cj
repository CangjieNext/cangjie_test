/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package org::enums

@Annotation
public class MyAnnotation <: Equatable<MyAnnotation> & ToString {
    public const MyAnnotation(public let data: String) {}
    public const init() {
        this.data = "default"
    }
    public operator func ==(another: MyAnnotation): Bool {
        this.data == another.data
    }
    public operator func !=(another: MyAnnotation): Bool {
        !(this == another)
    }
    public func toString(): String {
        "MyAnnotation"
    }
}

public class CCCC <: Equatable<CCCC> & ToString {
    public CCCC(public let xxxx: Int64) {}
    public operator func ==(another: CCCC): Bool {
        this.xxxx == another.xxxx
    }
    public operator func !=(another: CCCC): Bool {
        !(this == another)
    }
    public func toString(): String {
        "CCCC(${this.xxxx})"
    }
}
