/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

func testcase10(@Deprecated first_num!:Int64=1,second_num!:Int64=1): Int64{
    return second_num + first_num // testcase
}

func test_10(){
    testcase10(first_num:1,second_num:1)
}

