/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.*;
import java.util.function.BiFunction;
import java.util.function.Function;

class LuaJSFight {

    public static final int LOOP_NUMBER = 40000;
    public static final int TIMES_KILO_MILLISECONDS = 1000;
    public static final int BENCHMARK_COUNT = 120;
    public static final int NUM_1 = 1;
    public static final int NUM_2 = 2;
    public static final int NUM_3 = 3;
    public static final int NUM_4 = 4;
    public static final int NUM_5 = 5;
    public static final int NUM_6 = 6;
    public static final int NUM_7 = 7;
    
    public void deBugLog(String str){
        System.out.println(str);
    }
    
    public void run(){
        // System.out.println("Hello world");

        final int m = LOOP_NUMBER;
        List<String> strItems = new ArrayList<String>();
        Runnable addStrElement = ()->{
            int j = 0;
            while (j < m) {
                strItems.add("digit" + j);
                j = j + 1;
            }
            // System.out.println(strItems.get(0) + "\n" + strItems.get(m/2) + "\n" + strItems.get(m - 1));
        };
        addStrElement.run();

        final int n = LOOP_NUMBER;
        List<Integer> items = new ArrayList<>();
        Runnable addElement = ()->{
            int i = 0;
            while (i < n) {
                items.add(i);
                i += 1;
            }
            // System.out.println(items.get(0) + "\n" + items.get(n/2) + "\n" + items.get(n - 1));
        };
        addElement.run();

        BiFunction<int[], Function<Integer, Boolean>, Integer> firstWhere = (list, fn)->{
            for (int x : list) {
                if (fn.apply(x)) {
                    return x;
                }
            }
            return 0;
        };

        int[] nums = {NUM_1,NUM_2,NUM_3,NUM_4,NUM_5,NUM_6,NUM_7};
        Function<Integer, Boolean> isEven = (Integer x) -> {
            return (x & 1) == 0;
        };
        int firstEven = firstWhere.apply(nums,isEven);
        // System.out.println("First even:" + firstEven);
    }
    public static void main(String[] args) {
        LuaJSFight benchmark = new LuaJSFight();
        benchmark.runIteration();
    }

    /*
   * @LuaJSFight
   */
    public void runIteration(){
        LuaJSFight lua = new LuaJSFight();
        long before = System.nanoTime();
        for (int i = 0; i < BENCHMARK_COUNT; i++) {
            lua.run();
        }
        long after = System.nanoTime();
        System.out.println("LuaJSFight: ms = " + (double)(after - before)/1000000);    
    }
}