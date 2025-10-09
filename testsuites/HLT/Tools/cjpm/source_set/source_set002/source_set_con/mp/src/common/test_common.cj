/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

@When[cjc_version >= "0.60.4"]
public common func f1(): Int64

public common func f2(): Int64

public func test_com(): Int64 {
    f1() + f2()
}
