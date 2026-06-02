// Copyright (c) Huawei Technologies Co., Ltd. 2025-2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class foo {
    var aaa = 123 

}
struct thisisstruct {
    var b = 321 
    var c = foo()
    var d = foo()
}

main() {
    var thisisinstance = thisisstruct()
    var thisisarray: Array<thisisstruct> = [thisisinstance, thisisinstance, thisisinstance]
    var thisisclass: Array<foo> = [foo(), foo(), foo()]
    while(true) {}
}