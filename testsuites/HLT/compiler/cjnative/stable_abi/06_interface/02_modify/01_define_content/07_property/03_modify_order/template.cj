/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!
package test_stable_abi



public interface I1 {
     public static func typename(): String {
        "interface I1"
    }
   
    public mut prop a: String {
         get() {
           "interface testThree"
        }
        set(value) {
            "interface testThree"
        }
    }

     public mut prop b: String {
         get() {
           "interface testThree"
        }
        set(value) {
            "interface testThree"
        }
    }

    public mut prop c: String {
         get() {
           "interface testThree"
        }
        set(value) {
            "interface testThree"
        }
    }


}


