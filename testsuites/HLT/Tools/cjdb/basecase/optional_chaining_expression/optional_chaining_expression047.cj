/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct ABC {
    var a = 1
}

func func3(a:(ABC)->ABC){
    a
}

main() {
    var f1 = Some(func3)
    var a1 = f1?({i=>ABC()})
    0
}
