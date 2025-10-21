/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

@Deprecated
public var test_02:Int64 = 1

@Deprecated
public func test02() :Unit{

}


func testcase_02() {
    //联想补全功能正常
    let test_02_c = test_02
    let test_02_b = test02()
}
