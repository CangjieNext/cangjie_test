/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




package pkgs1.pkgs101.pkgs102.pkgs103.pkgs104.pkgs105

public func fun105(a: Int32): Int32 {
     if (a == 0) {
         return 0
     } else {
         return a + fun105(a-1)
     }
 }







