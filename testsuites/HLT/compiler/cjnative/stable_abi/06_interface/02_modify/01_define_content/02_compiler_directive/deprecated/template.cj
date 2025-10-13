/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test interface: @Deprecated

public interface I1 {
    public static func typename(): String {
        "interface I1"
    }
}

public interface G1<T> {
    public static func typename(): String {
        "interface G1<T>"
    }
}

@Deprecated["This API will be deprecated soon"]
public interface I2 {
    public static func typename(): String {
        "interface I2"
    }
}

@Deprecated["This API will be deprecated soon"]
public interface G2<T> {
    public static func typename(): String {
        "interface G2<T>"
    }
}

@Deprecated["This API is deprecated", strict: true]
public interface I3 {
    public static func typename(): String {
        "interface I3"
    }
}

@Deprecated["This API is deprecated", strict: true]
public interface G3<T> {
    public static func typename(): String {
        "interface G3<T>"
    }
}
