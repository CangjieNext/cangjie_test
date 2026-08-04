/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import java.util.ArrayList;
import java.util.Arrays;
import java.util.regex.Pattern;

class StringValidateInput {
    public static final String[] letters = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
    public static String endResult = "";
    public static final int TOBASE_NUMBER_4000 = 4000;
    public static final int TOBASE_NUMBER_6 = 6;
    public static final int TOBASE_NUMBER_2 = 2;
    public static final int TOBASE_NUMBER_4 = 4;
    public static final int TOBASE_NUMBER_5 = 5;
    public static final int TOBASE_NUMBER_26 = 26;
    public static final int TOBASE_NUMBER_9 = 9;
    public static final int TOBASE_NUMBER_1000 = 1000;

    public static void doTest() {
        endResult = "";

        // make up email address
        for (int k = 0; k < TOBASE_NUMBER_4000; k++) {
            String username = makeName(TOBASE_NUMBER_6);
            String email;
            email = (k % TOBASE_NUMBER_2) == 1 ? username + "@mac.com" : username + "(at)mac.com";

            // validate the email address
            Pattern pattern = Pattern.compile("^[a-zA-Z0-9-._]+@[a-zA-Z0-9-_]+(.?[a-zA-Z0-9-_]*).[a-zA-Z]{2,3}$");

            if (pattern.matcher(email).matches()) {
                String r = email + " appears to be a valid email address.";
                addResult(r);
            } else {
                String r = email + " does NOT appear to be a valid email address.";
                addResult(r);
            }
        }

        // make up ZIP codes
        for (int s = 0; s < TOBASE_NUMBER_4000; s++) {
            boolean zipGood = true;
            String zip = makeNumber(TOBASE_NUMBER_4);
            zip = (s % TOBASE_NUMBER_2 == 1) ? zip + "xyz" : zip.concat("7");
            // validate the zip code
            for (int i = 0; i < zip.length(); i++) {
                String ch = zip.substring(i, i + 1);
                ArrayList<String> cArr = new ArrayList<>(Arrays.asList("0", "1", "2", "3", "4", "5", "6", "7", "8", "9"));
                if (!cArr.contains(ch)) {
                    zipGood = false;
                    String r = zip + " contains letters.";
                    addResult(r);
                }
            }

            if (zipGood && zip.length() > TOBASE_NUMBER_5) {
                zipGood = false;
                String r = zip + " is longer than five characters.";
                addResult(r);
            }

            if (zipGood) {
                String r = zip + " appears to be a valid ZIP code.";
                addResult(r);
            }
        }
//        System.out.println(endResult);
    }

    public static String makeName(int n) {
        String tmp = "";
        for (int i = 0; i < n; i++) {
            int l = (int) Math.floor(TOBASE_NUMBER_26 * Math.random());
            tmp += letters[l];
        }
        return tmp;
    }

    public static String makeNumber(int n) {
        String tmp = "";
        for (int i = 0; i < n; i++) {
            int l = (int) Math.floor(TOBASE_NUMBER_9 * Math.random());
            tmp += String.format("%d", l);
        }
        return tmp;
    }


    public static void addResult(String n) {
        endResult += "\n" + n;
    }

}
/*
 *  @State
 *  @Tags Jetstream2
 */
class StringValidateInput1 {
    /*
     *  @Benchmark
     */
    public static void main(String[] args) {
        double start = (double) System.nanoTime() / 1_000_000;
        runIteration();
        double end = (double) System.nanoTime() / 1_000_000;
        System.out.println("StringValidateInput1: ms = " +(end - start));
    }
    public static void runIteration() {
        StringValidateInput.doTest();
    }
}
