// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A <: Resource {
    public func isClosed() {
        false
    }
    public func close() {
        print("close!")
    }
}

main() {
    try (a = A()) {
        print("try!\n")
    } finally {}
    print("success!\n")
    return 0
}
