/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class CodeFirstLoad {
    public final static int NUM_10000 = 10000;
    public final static int NUM_2 = 2;
    public final static int NUM_3 = 3;
    public final static int NUM_4 = 4;
    public final static int NUM_121 = 121;
    public final static int NUM_501 = 501;
    public final static int NUM_120 = 120;
    public final static int NUM_500 = 500;

    public static class Test {
        public int[] arr = new int[NUM_10000];

        public Test(int num1, int num2) {
            for (int i = 0; i < NUM_10000; i++) {
                switch (i % NUM_4) {
                    case 0:
                        this.arr[i] = this.add(num1, num2);
                        break;
                    case 1:
                        this.arr[i] = this.subtract(num1, num2);
                        break;
                    case NUM_2:
                        this.arr[i] = this.multiply(num1, num2);
                        break;
                    case NUM_3:
                        this.arr[i] = this.divide(num1, num2);
                        break;
                    default:
                        break;
                }
            }
        }
        public int add(int num1, int num2) {
            return num1 + num2;
        }
        public int subtract(int num1, int num2) {
            return num1 - num2;
        }
        public int multiply(int num1, int num2) {
            return num1 * num2;
        }
        public int divide(int num1, int num2) {
            return num1 / num2;
        }
    }	
}

/*
 * @State
 * @Tags Jetstream2
 */
class CodeFirstLoad1 {
    public CodeFirstLoad.Test test;
    /*
     * @CodeFirstLoad1
     */
    public void runIteration() {
        double startTime = Time.getTime();
        for (int i = 1; i < CodeFirstLoad.NUM_121; i++) {
            for (int j = 1; j < CodeFirstLoad.NUM_501; j++) {
                CodeFirstLoad.Test test = new CodeFirstLoad.Test(i, j);
                if (i == CodeFirstLoad.NUM_120 && j == CodeFirstLoad.NUM_500) {
                    this.test = test;
                }
            }
        }
        double endTime = Time.getTime();
        System.out.println("CodeFirstLoad1: ms = " + (endTime - startTime) / 1_000_000.0);

        this.test.arr[0] = 0;
    }
    public static void main(String[] args) {
        new CodeFirstLoad1().runIteration();
    }
}

class Time {
    public static double getTime() {
        return System.nanoTime();
    }
}
