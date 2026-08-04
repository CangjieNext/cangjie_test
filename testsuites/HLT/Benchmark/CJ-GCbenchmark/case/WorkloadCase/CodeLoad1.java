/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
class CodeLoadConfig {
    public static final int loop_num = 1200;
    public static final int times = 1000;

    public static String loadString = "";
}

/**
 * @State
 * @Tags Jetstream2
 */
class CodeLoad1 {
    /**
     * @CodeLoad1
     */
    public static void run() {
        String content = "let _____top_level_____ = " + Math.random() + ";" + CodeLoadConfig.loadString;
        //CodeLoad.debugLog("inspectorText test:" + content);
        long startTime = System.nanoTime();
        for (int i = 0; i < CodeLoadConfig.loop_num; i++) {
            CodeLoad test = new CodeLoad(content);
        }
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        long endTime = System.nanoTime();
        System.out.println("CodeLoad1: ms = " + (endTime - startTime) / 1_000_000.0);
    }
    public static void main(String[] args) {
        run();
    }
}

class CodeLoad {
    public String text = "";
    public int index = 0;

    CodeLoad(String content) {
        prepareForNextIteration(content);
    }
    
    public void prepareForNextIteration(String content) {
        this.text = "function test" + this.index + "() " + "{ " + content + " }";
        if (!this.text.startsWith("f")) {
            System.out.println("Error - f");
        } else if (!this.text.endsWith("}")) {
            System.out.println("Error - }");
        } else {
            this.index += 1;
        }
    // debugLog("text:" + this.text);
    }


    public static boolean isDebug  = false;
    public static void debugLog(String msg) {
        if (isDebug) {
            System.out.println(msg);
        }
    }

}