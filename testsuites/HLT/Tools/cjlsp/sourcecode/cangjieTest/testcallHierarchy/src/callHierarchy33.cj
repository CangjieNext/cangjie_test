/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

func tast5(){
    print("aa")
    print("bb")
    print("cc")
}
func tast6(){
    tast5()
}
func test7(){
    tast6
}
func test8(){
    test7()
}
func test9(){
    test8()
}
