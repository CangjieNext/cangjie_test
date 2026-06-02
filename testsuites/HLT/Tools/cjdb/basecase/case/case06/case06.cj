/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main(){
        var number = 2
        var unit_005 = while(number>0) { number-- }
        let unit_006 = do { number++ } while (number<5)
        let unit_012 = { => }()
        var unit_011 = { a:Int64 => print("${a}") }(1)
        return 0
}
