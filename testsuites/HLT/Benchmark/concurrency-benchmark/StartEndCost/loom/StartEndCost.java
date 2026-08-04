/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import java.util.concurrent.*;

public class StartEndCost {

    public static void create(int depth, CompletableFuture<Long> finisher) {
        Thread.startVirtualThread(() -> {
            if (depth == 0) {
                long end = System.currentTimeMillis();
                finisher.complete(end);
            } else {
                create(depth - 1, finisher);
            }
        });
    }

    static long measure(int depth) throws InterruptedException, ExecutionException {
        CompletableFuture<Long> finisher = new CompletableFuture<>();	

        long start = System.currentTimeMillis();
        create(depth, finisher);
        long end = finisher.get();

        return end - start;
    }

    static void print(String pref, int depth) throws InterruptedException, ExecutionException {
        long res = measure(depth);
        System.out.println(pref + " " + res); 
    }

    public static void main(String[] args) throws InterruptedException, ExecutionException {
        int depth = Integer.parseInt(args[0]);

	      for (int i = 0; i < 1; ++i) {
                  print("warmup " + i, depth);
	      }

        Thread.sleep(10);

        print("result", depth);
    }
}
