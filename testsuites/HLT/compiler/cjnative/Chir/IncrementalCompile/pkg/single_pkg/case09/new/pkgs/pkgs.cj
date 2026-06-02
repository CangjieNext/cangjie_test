/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgs

public class classImport01 <: B & A {
    public func test(): Int64 {
        1
    }

    public func testB(): Int64 {
        1
    }
}

public interface A {
    func test(): Int64

    func testA(): Int64 {
        return 1
    }
}

public interface B {
    func testB(): Int64
}
