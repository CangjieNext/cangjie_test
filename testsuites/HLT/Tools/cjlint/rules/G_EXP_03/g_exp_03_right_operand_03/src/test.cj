/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func fun1(){
    true
}

func test(){
    var a = Option<()->Bool>.Some(fun1) ?? fun1
}

main(){

}



