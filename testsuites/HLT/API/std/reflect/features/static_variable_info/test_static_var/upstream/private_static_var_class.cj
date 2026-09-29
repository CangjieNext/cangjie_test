/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


package upstream

public class PrivateStaticVarClass {
    public static var visible: Int64 = 7

    private static var hidden: Int64 = 8

    public static let fixedLet: Bool = true
}
