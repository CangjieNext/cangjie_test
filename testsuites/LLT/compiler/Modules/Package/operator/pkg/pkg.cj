// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public class ClassA {
    public operator func +(inputB: ClassA): Int64 {
        return 0
    }
}

public struct RecordB {
    public operator func +(inputB: RecordB): Int64 {
        return 0
    }
}

public interface InterfaceC {
    operator func +(inputB: InterfaceC): Int64 {
        return 0
    }
}

public class ClassD <: InterfaceC {}
