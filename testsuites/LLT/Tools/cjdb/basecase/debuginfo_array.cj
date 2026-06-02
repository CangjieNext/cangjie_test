// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func foo() {
    return 500
}

func goo() {
    return 600
}


main(){
    var aaa = 999
    var bbb = [
                [555, 666],
                [777, 888, aaa]
            ]
    var ccc = [
                foo(),
                goo()]
    var ddd = [
                [
                    [111, 222], 
                    [333, 444]
                ],
                [
                    [555, 666],
                    [777, 888, 999]
                ]
            ]
	return 0
}