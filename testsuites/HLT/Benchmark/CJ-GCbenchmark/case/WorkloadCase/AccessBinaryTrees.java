/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


/*
 *@State
 */
class AccessBinaryTrees {

    public static final int COMMON_NUMBER_TWO = 2;
    public static final int CURRENT_LOOP_COUNT_NUMBER_TWO = 7;
    public static final int  MAX_LOOP_COUNT = 1000;
    public static final int  MS_CONVERSION_RATIO = 1000;

    public AccessBinaryTrees left;
    public AccessBinaryTrees right;
    public double item;

    AccessBinaryTrees(AccessBinaryTrees left, AccessBinaryTrees right, double item) {
        this.left = left;
        this.right = right;
        this.item = item;
    }

    public double itemCheck() {
        if (left == null) {
            return item;
        } else {
            return item + (left != null ? left.itemCheck() : 0.0) - (right != null ? right.itemCheck() : 0.0);
        }
    }
    public static AccessBinaryTrees bottomUpTree(double item, int depth) {
        if (depth > 0) {
            return new AccessBinaryTrees(bottomUpTree(COMMON_NUMBER_TWO * item - 1, depth - 1), bottomUpTree(COMMON_NUMBER_TWO * item, depth - 1), item);
        } else {
            return new AccessBinaryTrees(null, null, item);
        }
    }

    
    public static void run() {
         double ret = 0.0;
//         System.out.println("Before the for loop, ret's value is -->" + (int)ret);
         for (int n = 4; n <=  CURRENT_LOOP_COUNT_NUMBER_TWO; n++) {
             int minDepth = 4;
             int maxDepth = Math.max(minDepth + COMMON_NUMBER_TWO, n);
             int stretchDepth = maxDepth + 1;

             double check = AccessBinaryTrees.bottomUpTree(0, stretchDepth).itemCheck();

             AccessBinaryTrees longLivedTree =  AccessBinaryTrees.bottomUpTree(0, maxDepth);
             for (int depth = minDepth; depth < maxDepth; depth += COMMON_NUMBER_TWO) {
                 int iterations = 1 << (maxDepth - depth + minDepth);

                 check = 0;
                 for (int i = 1; i <= iterations; i++) {
                     check +=  AccessBinaryTrees.bottomUpTree(i, depth).itemCheck();
                     check +=  AccessBinaryTrees.bottomUpTree(-i, depth).itemCheck();
                 }
             }
             ret += longLivedTree.itemCheck();
//             System.out.println("method level 1 for loop i's value is -->" + n + ",ret's value is -->" + (int)ret);
         }
//         System.out.println("After the for loop, ret's value is -->" + (int)ret);

         int expected = -4;
         if (ret != expected) {
             System.out.println("ERROR: bad result: expected " + expected + " but got " + ret);
         }
     }

    /*
     * @AccessBinaryTrees
     */
    public static void runIterationTime() {
        double start = (double) System.nanoTime() / 1_000_000;
        for (int i = 0; i < MAX_LOOP_COUNT; i++) {
            run();
        }
        double end = (double) System.nanoTime() / 1_000_000;
        double duration = (end - start);
        System.out.println("AccessBinaryTrees: ms = " + duration);
    }

    public static void main(String[] args) {
        runIterationTime();
    }
}