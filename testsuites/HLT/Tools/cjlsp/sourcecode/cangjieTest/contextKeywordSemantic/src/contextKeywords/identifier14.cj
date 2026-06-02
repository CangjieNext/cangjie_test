/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.contextKeywords

class override<override> {
    var dd:override
    init(a:override){
        this.dd = a
    }
}

func test14(){
    var c1 = override<Int64>(1).dd

}
