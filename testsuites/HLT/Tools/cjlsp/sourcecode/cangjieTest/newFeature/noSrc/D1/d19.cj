/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@When[os == "linux"]
func fh1(){
}
@When[os == "windows"]
func fh1(){}

func test40(){
    fh1()
}
