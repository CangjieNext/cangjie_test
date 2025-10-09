/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!
package test_stable_abi

@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}


public interface I1 {
     public static func typename(): String {
        "interface I1"
    }
   
    @Deprecated["this function is deprecated", strict: true]
    public mut prop a: String {
         get() {
           "interface testThree"
        }
        set(value) {
            "interface testThree"
        }
    }

    @Deprecated["this function is deprecated", strict: false]
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

    @Frozen
    public mut prop d: String {
         get() {
           "interface testThree"
        }
        set(value) {
            "interface testThree"
        }
    }


}


