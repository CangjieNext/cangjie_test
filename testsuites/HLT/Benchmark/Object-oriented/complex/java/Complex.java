/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


class Complex {
    public static boolean shouldLog = false;
    public static long blackHole = 0;

    public static void main(String[] args) {
        if (args.length != 3) {
            System.out.println("Usage: program <iterations> <repeats> <mode>");
            System.out.println("   where mode == 0 means use ComplexObject");
            System.out.println("   where mode == 1 means use ComplexStruct");
            return;
        }

        final long N = Long.parseLong(args[0]);
        final long R = Long.parseLong(args[1]);
        final long mode = Long.parseLong(args[2]);

        shouldLog = true;
        for (int i = 0; i < R; i++) {
            if (mode == 0) {
                measureObject(N);
            } else if (mode == 1) {
                System.out.printf("Unexpected mode: %d. Struct-alike stuff in not available in Java 8. Refer to https://openjdk.org/projects/valhalla/\n", mode);
                return;
            } else {
                System.out.println("Unexpected mode: " + mode);
                return;
            }
        }
    }

    public static void measureObject(long N) {
        final long start = System.nanoTime();
        blackHole = measureBodyObject(N);
        final long end = System.nanoTime();

        if (shouldLog) {
            System.out.printf("ComplexObject with %d problem size took %.0f ms. Computation result: %s\n",
                    N, (end - start) / 1000000.0, blackHole);
        }
    }

    public static long measureBodyObject(long N) {
        ComplexObject a = null;
        long sum = 0;
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                if ((i + j) > (N / 2)) {
                    a = new ComplexObject(i, j);
                } else {
                    a = new ComplexObject(j, i);
                }

                sum += a.modulus2();
            }
        }
        return sum;
    }

    static class ComplexObject {
        final long re;
        final long im;

        ComplexObject(long re_, long im_) {
            re = re_;
            im = im_;
        }

        public long modulus2() {
            return re * re + im * im;
        }
    }
}
