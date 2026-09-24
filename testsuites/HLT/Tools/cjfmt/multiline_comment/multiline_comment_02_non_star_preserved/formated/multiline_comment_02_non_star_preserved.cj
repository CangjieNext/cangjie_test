/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class P {
    /*
           deep indented comment no star
      another line no star
     */

    /*
       mixed starless
     * star line here
       starless again
     */
    public func v(): Int64 {
        /*
                only starless
          indented body
         */
        return 1
    }
}

main() {
    println("${P().v()}")
}
