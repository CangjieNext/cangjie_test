/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms
import std.collection.*
import std.random.*
import std.regex.*
import std.time.*

let random = Random()
func computeInvariants(str:String, n: Int64): ArrayList<String> {
    var variants = ArrayList<String>([str])
    for (_ in 1..n) {
        let pos = random.nextInt64(str.size)
        let chr = "${Int64(str.get(pos) ?? 0) + Int64(random.nextUInt8(129))}"
        var cpStr = str
        cpStr = str[0..pos] + chr + str[(pos + 1)..str.size]
        variants.add(cpStr)
    }
    return variants
}
/*
 * @State
 * @Tags Jetstream2
 */
class RegExpBenchmark {
      /*
   * @Benchmark
   */
    func run() {
        let startTime = Timer().getTime()
        for (_ in 0..5) {
          var sum = 0;
            sum += runBlock0();
            sum += runBlock1();
            sum += runBlock2();
            sum += runBlock3();
            sum += runBlock4();
            sum += runBlock5();
            sum += runBlock6();
            sum += runBlock7();
            sum += runBlock8();
            sum += runBlock9();
            sum += runBlock10();
            sum += runBlock11();
        }
        let endTime = Timer().getTime()
        println("regexp: ms = ${Float64((endTime - startTime).toNanoseconds())/1000000.0}")
      }
    
    func Exec(re: Regex, string: String): Int64 {
        let regex = re.matcher(string)
        return regex.allCount()
    }

    public static let re0 = Regex("^ba")
    public static let re1 = Regex("(((\\w+):\\/\\/)([^\\/:]*)(:(\\d+))?)?([^#?]*)(\\?([^#]*))?(#(.*))?")
    public static let re2 = Regex("^\\s*|\\s*$")
    public static let re3 = Regex("\\bQBZPbageby_cynprubyqre\\b")
    public static let re4 = Regex(",")
    public static let re5 = Regex("\\bQBZPbageby_cynprubyqre\\b")
    public static let re6 = Regex("^[\\s\\xa0]+|[\\s\\xa0]+$")
    public static let re7 = Regex("(\\d*)(\\D*)")
    public static let re8 = Regex("=")
    public static let re9 = Regex("(^|\\s)lhv\\-h(\\s|$)")
    public static let str0 = "Zbmvyyn/5.0 (Jvaqbjf\" H\" Jvaqbjf AG 5.1\" ra-HF) NccyrJroXvg/528.9 (XUGZY, yvxr Trpxb) Puebzr/ Fnsnev/528.9"
    public static let re10 = Regex("\\#")
    public static let re11 = Regex("\\.")
    public static let re12 = Regex("'")
    public static let re13 = Regex("\\?[\\w\\W]*(sevraqvq|punaaryvq|tebhcvq)=([^\\&\\?#]*)/i")
    public static let str1 = "'Fubpxjnir Synfu 9.0  e115'"
    public static let re14 = Regex("\\s+")
    public static let re15 = Regex("^\\s*(\\S*(\\s+\\S+)*)\\s*$")
    public static let re16 = Regex("(-[a-z])")

    let s0 = computeInvariants("pyvpx", 6511)
    let s1 = computeInvariants("uggc://jjj.snprobbx.pbz/ybtva.cuc", 1844)
    let s2 = computeInvariants("QBZPbageby_cynprubyqre", 739)
    let s3 = computeInvariants("uggc://jjj.snprobbx.pbz/", 598)
    let s4 = computeInvariants("uggc://jjj.snprobbx.pbz/fepu.cuc", 454)
    let s5 = computeInvariants("qqqq, ZZZ q, llll", 352)
    let s6 = computeInvariants("vachggrkg QBZPbageby_cynprubyqre", 312)
    let s7 = computeInvariants("/ZlFcnprUbzrcntr/Vaqrk-FvgrUbzr,10000000", 282)
    let s8 = computeInvariants("vachggrkg", 177)
    let s9 = computeInvariants("528.9", 170)
    let s10 = computeInvariants("528", 170)
    let s11 = computeInvariants("VCPhygher=ra-HF", 156)
    let s12 = computeInvariants("CersreerqPhygher=ra-HF", 156)
    let s13 = computeInvariants("xrlcerff", 144)
    let s14 = computeInvariants("521", 139)
    let s15 = computeInvariants(str0, 139)
    let s16 = computeInvariants("qvi .so_zrah", 137)
    let s17 = computeInvariants("qvi.so_zrah", 137)
    let s18 = computeInvariants("uvqqra_ryrz", 117)
    let s19 = computeInvariants("sevraqfgre_naba=nvq%3Qn6ss9p85n868ro9s059pn854735956o3%26ers%3Q%26df%3Q%26vpgl%3QHF", 95)
    let s20 = computeInvariants("uggc://ubzr.zlfcnpr.pbz/vaqrk.psz", 93)
    let s21 = computeInvariants(str1, 92)
    let s22 = computeInvariants("svefg", 85)
    let s23 = computeInvariants("uggc://cebsvyr.zlfcnpr.pbz/vaqrk.psz", 85)
    let s24 = computeInvariants("ynfg", 85)
    let s25 = computeInvariants("qvfcynl", 85)
    
    func runBlock0(): Int64 {
        var sum = 0;
        for  (i in 0..525) {
            sum += Exec(re0, s0[i]);
        }
        for  (i in 0..1844) {
          sum += Exec(re0,s0[i + 525]);
          sum += Exec(re1,s1[i]);
        }
        for  (i in 0..739) {
          sum += Exec(re0,s0[i + 2369]);
          sum += re2.matcher(s2[i]).replaceAll("").size
        }
        for  (i in 0..598) {
          sum += Exec(re0,s0[i + 3108]);
          sum += Exec(re1,s3[i]);
        }
        for  (i in 0..454) {
          sum += Exec(re0,s0[i + 3706]);
          sum += Exec(re1,s4[i]);
        }
        for  (i in 0..352) {
          sum += Exec(re0,s0[i + 4160]);
          sum += Exec(Regex("qqqq|qqq|qq|q|ZZZZ|ZZZ|ZZ|Z|llll|ll|l|uu|u|UU|U|zz|z|ff|f|gg|g|sss|ss|s|mmm|mm|m"),s5[i]);
        }
        for  (i in 0..312) {
          sum += Exec(re0,s0[i + 4512]);
          sum += Exec(re3,s6[i]);
        }
        for  (i in 0..282) {
          sum += Exec(re0,s0[i + 4824]);
          sum += Exec(re4,s7[i]);
        }
        for  (i in 0..177) {
          sum += Exec(re0,s0[i + 5106]);
            sum += re5.matcher(s8[i]).replaceAll("").size
        }
        for  (i in 0..170) {
          sum += Exec(re0,s0[i + 5283]);
            sum += re6.matcher(s9[i]).replaceAll("").size 
          sum += Exec(re7,s10[i]);
        }
        for  (i in 0..156) {
          sum += Exec(re0,s0[i + 5453]);
          sum += Exec(re8,s11[i]);
          sum += Exec(re8,s12[i]);
        }
        for  (i in 0..144) {
          sum += Exec(re0,s0[i + 5609]);
          sum += Exec(re0,s13[i]);
        }
        for  (i in 0..139) {
          sum += Exec(re0,s0[i + 5753]);
            sum += re6.matcher(s14[i]).replaceAll("").size
          sum += Exec(re7,s14[i]);
          sum += Exec(re9,"");
          sum += Exec(Regex("JroXvg\\/(\\S+)"),s15[i]);
        }
        for  (i in 0..137) {
            sum += Exec(re0,s0[i + 5892]);
            sum += re10.matcher(s16[i]).replaceAll("").size
            sum += Regex("\\[").matcher(s16[i]).replaceAll("").size
            sum += re11.matcher(s17[i]).replaceAll("").size
        }
        for  (i in 0..117) {
            sum += Exec(re0,s0[i + 6029]);
            sum += re2.matcher(s18[i]).replaceAll("").size
        }
        for  (i in 0..95) {
          sum += Exec(re0,s0[i + 6146]);
          sum += Exec(Regex("(?:^|;)\\s*sevraqfgre_ynat=([^;]*)"),s19[i]);
        }
        for  (i in 0..93) {
          sum += Exec(re0,s0[i + 6241]);
          sum += re12.matcher(s20[i]).replaceAll("").size
          sum += Exec(re13,s20[i]);
        }
        for  (i in 0..92) {
          sum += Exec(re0,s0[i + 6334]);
            sum += Regex("([a-zA-Z]|\\s)+").matcher(s21[i]).replaceAll("").size
        }
        for  (i in 0..85) {
          sum += Exec(re0,s0[i + 6426]);
            sum += re14.matcher(s22[i]).replaceAll("").size
            sum += re15.matcher(s22[i]).replaceAll("").size
            sum += re12.matcher(s23[i]).replaceAll("").size
            sum += re14.matcher(s24[i]).replaceAll("").size
            sum += re15.matcher(s24[i]).replaceAll("").size
          sum += Exec(re16,s25[i]);
          sum += Exec(re13,s23[i]);
        }
        return sum;
      }

    public static let str2 = "{\"anzr\":\"\",\"ahzoreSbezng\":{\"PheeraplQrpvznyQvtvgf\":2,\"PheeraplQrpvznyFrcnengbe\":\".\",\"VfErnqBayl\":gehr,\"PheeraplTebhcFvmrf\":[3],\"AhzoreTebhcFvmrf\":[3],\"CrepragTebhcFvmrf\":[3],\"PheeraplTebhcFrcnengbe\":\",\",\"PheeraplFlzoby\":\"\\xa4\",\"AnAFlzoby\":\"AnA\",\"PheeraplArtngvirCnggrea\":0,\"AhzoreArtngvirCnggrea\":1,\"CrepragCbfvgvirCnggrea\":0,\"CrepragArtngvirCnggrea\":0,\"ArtngvirVasvavglFlzoby\":\"-Vasvavgl\",\"ArtngvirFvta\":\"-\",\"AhzoreQrpvznyQvtvgf\":2,\"AhzoreQrpvznyFrcnengbe\":\".\",\"AhzoreTebhcFrcnengbe\":\",\",\"PheeraplCbfvgvirCnggrea\":0,\"CbfvgvirVasvavglFlzoby\":\"Vasvavgl\",\"CbfvgvirFvta\":\"+\",\"CrepragQrpvznyQvtvgf\":2,\"CrepragQrpvznyFrcnengbe\":\".\",\"CrepragTebhcFrcnengbe\":\",\",\"CrepragFlzoby\":\"%\",\"CreZvyyrFlzoby\":\"\u{0020}\",\"AngvirQvtvgf\":[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],\"QvtvgFhofgvghgvba\":1},\"qngrGvzrSbezng\":{\"NZQrfvtangbe\":\"NZ\",\"Pnyraqne\":{\"ZvaFhccbegrqQngrGvzr\":\"@-62135568000000@\",\"ZnkFhccbegrqQngrGvzr\":\"@253402300799999@\",\"NytbevguzGlcr\":1,\"PnyraqneGlcr\":1,\"Renf\":[1],\"GjbQvtvgLrneZnk\":2029,\"VfErnqBayl\":gehr},\"QngrFrcnengbe\":\"/\",\"SvefgQnlBsJrrx\":0,\"PnyraqneJrrxEhyr\":0,\"ShyyQngrGvzrCnggrea\":\"qqqq, qq ZZZZ llll UU:zz:ff\",\"YbatQngrCnggrea\":\"qqqq, qq ZZZZ llll\",\"YbatGvzrCnggrea\":\"UU:zz:ff\",\"ZbaguQnlCnggrea\":\"ZZZZ qq\",\"CZQrfvtangbe\":\"CZ\",\"ESP1123Cnggrea\":\"qqq, qq ZZZ llll UU\':\'zz\':\'ff \'TZG\'\",\"FubegQngrCnggrea\":\"ZZ/qq/llll\",\"FubegGvzrCnggrea\":\"UU:zz\",\"FbegnoyrQngrGvzrCnggrea\":\"llll\'-\'ZZ\'-\'qq\'G\'UU\':\'zz\':\'ff\",\"GvzrFrcnengbe\":\":\",\"HavirefnyFbegnoyrQngrGvzrCnggrea\":\"llll\'-\'ZZ\'-\'qq UU\':\'zz\':\'ff\'M\'\",\"LrneZbaguCnggrea\":\"llll ZZZZ\",\"NooerivngrqQnlAnzrf\":[\"Fha\",\"Zba\",\"Ghr\",\"Jrq\",\"Guh\",\"Sev\",\"Fng\"],\"FubegrfgQnlAnzrf\":[\"Fh\",\"Zb\",\"Gh\",\"Jr\",\"Gu\",\"Se\",\"Fn\"],\"QnlAnzrf\":[\"Fhaqnl\",\"Zbaqnl\",\"Ghrfqnl\",\"Jrqarfqnl\",\"Guhefqnl\",\"Sevqnl\",\"Fngheqnl\"],\"NooerivngrqZbaguAnzrf\":[\"Wna\",\"Sro\",\"Zne\",\"Nce\",\"Znl\",\"Wha\",\"Why\",\"Nht\",\"Frc\",\"Bpg\",\"Abi\",\"Qrp\",\"\"],\"ZbaguAnzrf\":[\"Wnahnel\",\"Sroehnel\",\"Znepu\",\"Ncevy\",\"Znl\",\"Whar\",\"Whyl\",\"Nhthfg\",\"Frcgrzore\",\"Bpgbore\",\"Abirzore\",\"Qrprzore\",\"\"],\"VfErnqBayl\":gehr,\"AngvirPnyraqneAnzr\":\"Tertbevna Pnyraqne\",\"NooerivngrqZbaguTravgvirAnzrf\":[\"Wna\",\"Sro\",\"Zne\",\"Nce\",\"Znl\",\"Wha\",\"Why\",\"Nht\",\"Frc\",\"Bpg\",\"Abi\",\"Qrp\",\"\"],\"ZbaguTravgvirAnzrf\":[\"Wnahnel\",\"Sroehnel\",\"Znepu\",\"Ncevy\",\"Znl\",\"Whar\",\"Whyl\",\"Nhthfg\",\"Frcgrzore\",\"Bpgbore\",\"Abirzore\",\"Qrprzore\",\"\"]}}"
    public static let str3 = "{\"anzr\":\"ra-HF\",\"ahzoreSbezng\":{\"PheeraplQrpvznyQvtvgf\":2,\"PheeraplQrpvznyFrcnengbe\":\".\",\"VfErnqBayl\":snyfr,\"PheeraplTebhcFvmrf\":[3],\"AhzoreTebhcFvmrf\":[3],\"CrepragTebhcFvmrf\":[3],\"PheeraplTebhcFrcnengbe\":\",\",\"PheeraplFlzoby\":\"$\",\"AnAFlzoby\":\"AnA\",\"PheeraplArtngvirCnggrea\":0,\"AhzoreArtngvirCnggrea\":1,\"CrepragCbfvgvirCnggrea\":0,\"CrepragArtngvirCnggrea\":0,\"ArtngvirVasvavglFlzoby\":\"-Vasvavgl\",\"ArtngvirFvta\":\"-\",\"AhzoreQrpvznyQvtvgf\":2,\"AhzoreQrpvznyFrcnengbe\":\".\",\"AhzoreTebhcFrcnengbe\":\",\",\"PheeraplCbfvgvirCnggrea\":0,\"CbfvgvirVasvavglFlzoby\":\"Vasvavgl\",\"CbfvgvirFvta\":\"+\",\"CrepragQrpvznyQvtvgf\":2,\"CrepragQrpvznyFrcnengbe\":\".\",\"CrepragTebhcFrcnengbe\":\",\",\"CrepragFlzoby\":\"%\",\"CreZvyyrFlzoby\":\"\u{0020}\",\"AngvirQvtvgf\":[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\"],\"QvtvgFhofgvghgvba\":1},\"qngrGvzrSbezng\":{\"NZQrfvtangbe\":\"NZ\",\"Pnyraqne\":{\"ZvaFhccbegrqQngrGvzr\":\"@-62135568000000@\",\"ZnkFhccbegrqQngrGvzr\":\"@253402300799999@\",\"NytbevguzGlcr\":1,\"PnyraqneGlcr\":1,\"Renf\":[1],\"GjbQvtvgLrneZnk\":2029,\"VfErnqBayl\":snyfr},\"QngrFrcnengbe\":\"/\",\"SvefgQnlBsJrrx\":0,\"PnyraqneJrrxEhyr\":0,\"ShyyQngrGvzrCnggrea\":\"qqqq, ZZZZ qq, llll u:zz:ff gg\",\"YbatQngrCnggrea\":\"qqqq, ZZZZ qq, llll\",\"YbatGvzrCnggrea\":\"u:zz:ff gg\",\"ZbaguQnlCnggrea\":\"ZZZZ qq\",\"CZQrfvtangbe\":\"CZ\",\"ESP1123Cnggrea\":\"qqq, qq ZZZ llll UU\':\'zz\':\'ff \'TZG\'\",\"FubegQngrCnggrea\":\"Z/q/llll\",\"FubegGvzrCnggrea\":\"u:zz gg\",\"FbegnoyrQngrGvzrCnggrea\":\"llll\'-\'ZZ\'-\'qq\'G\'UU\':\'zz\':\'ff\",\"GvzrFrcnengbe\":\":\",\"HavirefnyFbegnoyrQngrGvzrCnggrea\":\"llll\'-\'ZZ\'-\'qq UU\':\'zz\':\'ff\'M\'\",\"LrneZbaguCnggrea\":\"ZZZZ, llll\",\"NooerivngrqQnlAnzrf\":[\"Fha\",\"Zba\",\"Ghr\",\"Jrq\",\"Guh\",\"Sev\",\"Fng\"],\"FubegrfgQnlAnzrf\":[\"Fh\",\"Zb\",\"Gh\",\"Jr\",\"Gu\",\"Se\",\"Fn\"],\"QnlAnzrf\":[\"Fhaqnl\",\"Zbaqnl\",\"Ghrfqnl\",\"Jrqarfqnl\",\"Guhefqnl\",\"Sevqnl\",\"Fngheqnl\"],\"NooerivngrqZbaguAnzrf\":[\"Wna\",\"Sro\",\"Zne\",\"Nce\",\"Znl\",\"Wha\",\"Why\",\"Nht\",\"Frc\",\"Bpg\",\"Abi\",\"Qrp\",\"\"],\"ZbaguAnzrf\":[\"Wnahnel\",\"Sroehnel\",\"Znepu\",\"Ncevy\",\"Znl\",\"Whar\",\"Whyl\",\"Nhthfg\",\"Frcgrzore\",\"Bpgbore\",\"Abirzore\",\"Qrprzore\",\"\"],\"VfErnqBayl\":snyfr,\"AngvirPnyraqneAnzr\":\"Tertbevna Pnyraqne\",\"NooerivngrqZbaguTravgvirAnzrf\":[\"Wna\",\"Sro\",\"Zne\",\"Nce\",\"Znl\",\"Wha\",\"Why\",\"Nht\",\"Frc\",\"Bpg\",\"Abi\",\"Qrp\",\"\"],\"ZbaguTravgvirAnzrf\":[\"Wnahnel\",\"Sroehnel\",\"Znepu\",\"Ncevy\",\"Znl\",\"Whar\",\"Whyl\",\"Nhthfg\",\"Frcgrzore\",\"Bpgbore\",\"Abirzore\",\"Qrprzore\",\"\"]}}"
    public static let str4 = "HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str5 = "HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R="

    public static let re17 = Regex("(^|[^\\\\])\"\\\\\\/Qngr\\((-?[0-9]+)\\)\\\\\\/\"")
    public static let re18 = Regex("^\\s+|\\s+$")
    public static let str6 = "uggc://jjj.snprobbx.pbz/vaqrk.cuc"
    public static let re19 = Regex("(?:^|\\s+)ba(?:\\s+|$)")
    public static let re20 = Regex("[+, ]")
    public static let re21 = Regex("ybnqrq|pbzcyrgr")
    public static let str7 = ";;jvaqbj.IjPurpxZbhfrCbfvgvbaNQ_VQ=shapgvba(r){vs(!r)ine r=jvaqbj.rirag;ine c=-1;vs(d1)c=d1.EbyybssCnary;ine bo=IjTrgBow(\"IjCnayNQ_VQ_\"+c);vs(bo&&bo.fglyr.ivfvovyvgl==\"ivfvoyr\"){ine fns=IjFns?8:0;ine pheK=r.pyvragK+IjBOFpe(\"U\")+fns,pheL=r.pyvragL+IjBOFpe(\"I\")+fns;ine y=IjBOEC(NQ_VQ,bo,\"Y\"),g=IjBOEC(NQ_VQ,bo,\"G\");ine e=y+d1.Cnaryf[c].Jvqgu,o=g+d1.Cnaryf[c].Urvtug;vs((pheK<y)||(pheK>e)||(pheL<g)||(pheL>o)){vs(jvaqbj.IjBaEbyybssNQ_VQ)IjBaEbyybssNQ_VQ(c);ryfr IjPybfrNq(NQ_VQ,c,gehr,\"\");}ryfr erghea;}IjPnapryZbhfrYvfgrareNQ_VQ();};;jvaqbj.IjFrgEbyybssCnaryNQ_VQ=shapgvba(c){ine z=\"zbhfrzbir\",q=qbphzrag,s=IjPurpxZbhfrCbfvgvbaNQ_VQ;c=IjTc(NQ_VQ,c);vs(d1&&d1.EbyybssCnary>-1)IjPnapryZbhfrYvfgrareNQ_VQ();vs(d1)d1.EbyybssCnary=c;gel{vs(q.nqqRiragYvfgrare)q.nqqRiragYvfgrare(z,s,snyfr);ryfr vs(q.nggnpuRirag)q.nggnpuRirag(\"ba\"+z,s);}pngpu(r){}};;jvaqbj.IjPnapryZbhfrYvfgrareNQ_VQ=shapgvba(){ine z=\"zbhfrzbir\",q=qbphzrag,s=IjPurpxZbhfrCbfvgvbaNQ_VQ;vs(d1)d1.EbyybssCnary=-1;gel{vs(q.erzbirRiragYvfgrare)q.erzbirRiragYvfgrare(z,s,snyfr);ryfr vs(q.qrgnpuRirag)q.qrgnpuRirag(\"ba\"+z,s);}pngpu(r){}};;d1.IjTc=d2(n,c){ine nq=d1;vs(vfAnA(c)){sbe(ine v=0;v<nq.Cnaryf.yratgu;v++)vs(nq.Cnaryf[v].Anzr==c)erghea v;erghea 0;}erghea c;};;d1.IjTpy=d2(n,c,p){ine cn=d1.Cnaryf[IjTc(n,c)];vs(!cn)erghea 0;vs(vfAnA(p)){sbe(ine v=0;v<cn.Pyvpxguehf.yratgu;v++)vs(cn.Pyvpxguehf[v].Anzr==p)erghea v;erghea 0;}erghea p;};;d1.IjGenpr=d2(n,f){gel{vs(jvaqbj[\"Ij\"+\"QtQ\"])jvaqbj[\"Ij\"+\"QtQ\"](n,1,f);}pngpu(r){}};;d1.IjYvzvg1=d2(n,f){ine nq=d1,vh=f.fcyvg(\"/\");sbe(ine v=0,p=0;v<vh.yratgu;v++){vs(vh[v].yratgu>0){vs(nq.FzV.yratgu>0)nq.FzV+=\"/\";nq.FzV+=vh[v];nq.FtZ[nq.FtZ.yratgu]=snyfr;}}};;d1.IjYvzvg0=d2(n,f){ine nq=d1,vh=f.fcyvg(\"/\");sbe(ine v=0;v<vh.yratgu;v++){vs(vh[v].yratgu>0){vs(nq.OvC.yratgu>0)nq.OvC+=\"/\";nq.OvC+=vh[v];}}};;d1.IjRVST=d2(n,c){jvaqbj[\"IjCnayNQ_VQ_\"+c+\"_Bow\"]=IjTrgBow(\"IjCnayNQ_VQ_\"+c+\"_Bow\");vs(jvaqbj[\"IjCnayNQ_VQ_\"+c+\"_Bow\"]==ahyy)frgGvzrbhg(\"IjRVST(NQ_VQ,\"+c+\")\",d1.rvsg);};;d1.IjNavzSHC=d2(n,c){ine nq=d1;vs(c>nq.Cnaryf.yratgu)erghea;ine cna=nq.Cnaryf[c],nn=gehr,on=gehr,yn=gehr,en=gehr,cn=nq.Cnaryf[0],sf=nq.ShF,j=cn.Jvqgu,u=cn.Urvtug;vs(j==\"100%\"){j=sf;en=snyfr;yn=snyfr;}vs(u==\"100%\"){u=sf;nn=snyfr;on=snyfr;}vs(cn.YnY==\"Y\")yn=snyfr;vs(cn.YnY==\"E\")en=snyfr;vs(cn.GnY==\"G\")nn=snyfr;vs(cn.GnY==\"O\")on=snyfr;ine k=0,l=0;fjvgpu(nq.NshP%8){pnfr 0:oernx;pnfr 1:vs(nn)l=-sf;oernx;pnfr 2:k=j-sf;oernx;pnfr 3:vs(en)k=j;oernx;pnfr 4:k=j-sf;l=u-sf;oernx;pnfr 5:k=j-sf;vs(on)l=u;oernx;pnfr 6:l=u-sf;oernx;pnfr 7:vs(yn)k=-sf;l=u-sf;oernx;}vs(nq.NshP++ <nq.NshG)frgGvzrbhg((\"IjNavzSHC(NQ_VQ,\"+c+\")\"),nq.NshC);ryfr{k=-1000;l=k;}cna.YrsgBssfrg=k;cna.GbcBssfrg=l;IjNhErcb(n,c);};;d1.IjTrgErnyCbfvgvba=d2(n,b,j){erghea IjBOEC.nccyl(guvf,nethzragf);};;d1.IjPnapryGvzrbhg=d2(n,c){c=IjTc(n,c);ine cay=d1.Cnaryf[c];vs(cay&&cay.UgU!=\"\"){pyrneGvzrbhg(cay.UgU);}};;d1.IjPnapryNyyGvzrbhgf=d2(n){vs(d1.YbpxGvzrbhgPunatrf)erghea;sbe(ine c=0;c<d1.bac;c++)IjPnapryGvzrbhg(n,c);};;d1.IjFgnegGvzrbhg=d2(n,c,bG){c=IjTc(n,c);ine cay=d1.Cnaryf[c];vs(cay&&((cay.UvqrGvzrbhgInyhr>0)||(nethzragf.yratgu==3&&bG>0))){pyrneGvzrbhg(cay.UgU);cay.UgU=frgGvzrbhg(cay.UvqrNpgvba,(nethzragf.yratgu==3?bG:cay.UvqrGvzrbhgInyhr));}};;d1.IjErfrgGvzrbhg=d2(n,c,bG){c=IjTc(n,c);IjPnapryGvzrbhg(n,c);riny(\"IjFgnegGvzrbhg(NQ_VQ,c\"+(nethzragf.yratgu==3?\",bG\":\"\")+\")\");};;d1.IjErfrgNyyGvzrbhgf=d2(n){sbe(ine c=0;c<d1.bac;c++)IjErfrgGvzrbhg(n,c);};;d1.IjQrgnpure=d2(n,rig,sap){gel{vs(IjQVR5)riny(\"jvaqbj.qrgnpuRirag(\'ba\"+rig+\"\',\"+sap+\"NQ_VQ)\");ryfr vs(!IjQVRZnp)riny(\"jvaqbj.erzbirRiragYvfgrare(\'\"+rig+\"\',\"+sap+\"NQ_VQ,snyfr)\");}pngpu(r){}};;d1.IjPyrnaHc=d2(n){IjCvat(n,\"G\");ine nq=d1;sbe(ine v=0;v<nq.Cnaryf.yratgu;v++){IjUvqrCnary(n,v,gehr);}gel{IjTrgBow(nq.gya).vaareUGZY=\"\";}pngpu(r){}vs(nq.gya!=nq.gya2)gel{IjTrgBow(nq.gya2).vaareUGZY=\"\";}pngpu(r){}gel{d1=ahyy;}pngpu(r){}gel{IjQrgnpure(n,\"haybnq\",\"IjHayNQ_VQ\");}pngpu(r){}gel{jvaqbj.IjHayNQ_VQ=ahyy;}pngpu(r){}gel{IjQrgnpure(n,\"fpebyy\",\"IjFeNQ_VQ\");}pngpu(r){}gel{jvaqbj.IjFeNQ_VQ=ahyy;}pngpu(r){}gel{IjQrgnpure(n,\"erfvmr\",\"IjEmNQ_VQ\");}pngpu(r){}gel{jvaqbj.IjEmNQ_VQ=ahyy;}pngpu(r){}gel{IjQrgnpure(n"
    public static let str8 = ";;jvaqbj.IjPurpxZbhfrCbfvgvbaNQ_VQ=shapgvba(r){vs(!r)ine r=jvaqbj.rirag;ine c=-1;vs(jvaqbj.IjNqNQ_VQ)c=jvaqbj.IjNqNQ_VQ.EbyybssCnary;ine bo=IjTrgBow(\"IjCnayNQ_VQ_\"+c);vs(bo&&bo.fglyr.ivfvovyvgl==\"ivfvoyr\"){ine fns=IjFns?8:0;ine pheK=r.pyvragK+IjBOFpe(\"U\")+fns,pheL=r.pyvragL+IjBOFpe(\"I\")+fns;ine y=IjBOEC(NQ_VQ,bo,\"Y\"),g=IjBOEC(NQ_VQ,bo,\"G\");ine e=y+jvaqbj.IjNqNQ_VQ.Cnaryf[c].Jvqgu,o=g+jvaqbj.IjNqNQ_VQ.Cnaryf[c].Urvtug;vs((pheK<y)||(pheK>e)||(pheL<g)||(pheL>o)){vs(jvaqbj.IjBaEbyybssNQ_VQ)IjBaEbyybssNQ_VQ(c);ryfr IjPybfrNq(NQ_VQ,c,gehr,\"\");}ryfr erghea;}IjPnapryZbhfrYvfgrareNQ_VQ();};;jvaqbj.IjFrgEbyybssCnaryNQ_VQ=shapgvba(c){ine z=\"zbhfrzbir\",q=qbphzrag,s=IjPurpxZbhfrCbfvgvbaNQ_VQ;c=IjTc(NQ_VQ,c);vs(jvaqbj.IjNqNQ_VQ&&jvaqbj.IjNqNQ_VQ.EbyybssCnary>-1)IjPnapryZbhfrYvfgrareNQ_VQ();vs(jvaqbj.IjNqNQ_VQ)jvaqbj.IjNqNQ_VQ.EbyybssCnary=c;gel{vs(q.nqqRiragYvfgrare)q.nqqRiragYvfgrare(z,s,snyfr);ryfr vs(q.nggnpuRirag)q.nggnpuRirag(\"ba\"+z,s);}pngpu(r){}};;jvaqbj.IjPnapryZbhfrYvfgrareNQ_VQ=shapgvba(){ine z=\"zbhfrzbir\",q=qbphzrag,s=IjPurpxZbhfrCbfvgvbaNQ_VQ;vs(jvaqbj.IjNqNQ_VQ)jvaqbj.IjNqNQ_VQ.EbyybssCnary=-1;gel{vs(q.erzbirRiragYvfgrare)q.erzbirRiragYvfgrare(z,s,snyfr);ryfr vs(q.qrgnpuRirag)q.qrgnpuRirag(\"ba\"+z,s);}pngpu(r){}};;jvaqbj.IjNqNQ_VQ.IjTc=shapgvba(n,c){ine nq=jvaqbj.IjNqNQ_VQ;vs(vfAnA(c)){sbe(ine v=0;v<nq.Cnaryf.yratgu;v++)vs(nq.Cnaryf[v].Anzr==c)erghea v;erghea 0;}erghea c;};;jvaqbj.IjNqNQ_VQ.IjTpy=shapgvba(n,c,p){ine cn=jvaqbj.IjNqNQ_VQ.Cnaryf[IjTc(n,c)];vs(!cn)erghea 0;vs(vfAnA(p)){sbe(ine v=0;v<cn.Pyvpxguehf.yratgu;v++)vs(cn.Pyvpxguehf[v].Anzr==p)erghea v;erghea 0;}erghea p;};;jvaqbj.IjNqNQ_VQ.IjGenpr=shapgvba(n,f){gel{vs(jvaqbj[\"Ij\"+\"QtQ\"])jvaqbj[\"Ij\"+\"QtQ\"](n,1,f);}pngpu(r){}};;jvaqbj.IjNqNQ_VQ.IjYvzvg1=shapgvba(n,f){ine nq=jvaqbj.IjNqNQ_VQ,vh=f.fcyvg(\"/\");sbe(ine v=0,p=0;v<vh.yratgu;v++){vs(vh[v].yratgu>0){vs(nq.FzV.yratgu>0)nq.FzV+=\"/\";nq.FzV+=vh[v];nq.FtZ[nq.FtZ.yratgu]=snyfr;}}};;jvaqbj.IjNqNQ_VQ.IjYvzvg0=shapgvba(n,f){ine nq=jvaqbj.IjNqNQ_VQ,vh=f.fcyvg(\"/\");sbe(ine v=0;v<vh.yratgu;v++){vs(vh[v].yratgu>0){vs(nq.OvC.yratgu>0)nq.OvC+=\"/\";nq.OvC+=vh[v];}}};;jvaqbj.IjNqNQ_VQ.IjRVST=shapgvba(n,c){jvaqbj[\"IjCnayNQ_VQ_\"+c+\"_Bow\"]=IjTrgBow(\"IjCnayNQ_VQ_\"+c+\"_Bow\");vs(jvaqbj[\"IjCnayNQ_VQ_\"+c+\"_Bow\"]==ahyy)frgGvzrbhg(\"IjRVST(NQ_VQ,\"+c+\")\",jvaqbj.IjNqNQ_VQ.rvsg);};;jvaqbj.IjNqNQ_VQ.IjNavzSHC=shapgvba(n,c){ine nq=jvaqbj.IjNqNQ_VQ;vs(c>nq.Cnaryf.yratgu)erghea;ine cna=nq.Cnaryf[c],nn=gehr,on=gehr,yn=gehr,en=gehr,cn=nq.Cnaryf[0],sf=nq.ShF,j=cn.Jvqgu,u=cn.Urvtug;vs(j==\"100%\"){j=sf;en=snyfr;yn=snyfr;}vs(u==\"100%\"){u=sf;nn=snyfr;on=snyfr;}vs(cn.YnY==\"Y\")yn=snyfr;vs(cn.YnY==\"E\")en=snyfr;vs(cn.GnY==\"G\")nn=snyfr;vs(cn.GnY==\"O\")on=snyfr;ine k=0,l=0;fjvgpu(nq.NshP%8){pnfr 0:oernx;pnfr 1:vs(nn)l=-sf;oernx;pnfr 2:k=j-sf;oernx;pnfr 3:vs(en)k=j;oernx;pnfr 4:k=j-sf;l=u-sf;oernx;pnfr 5:k=j-sf;vs(on)l=u;oernx;pnfr 6:l=u-sf;oernx;pnfr 7:vs(yn)k=-sf;l=u-sf;oernx;}vs(nq.NshP++ <nq.NshG)frgGvzrbhg((\"IjNavzSHC(NQ_VQ,\"+c+\")\"),nq.NshC);ryfr{k=-1000;l=k;}cna.YrsgBssfrg=k;cna.GbcBssfrg=l;IjNhErcb(n,c);};;jvaqbj.IjNqNQ_VQ.IjTrgErnyCbfvgvba=shapgvba(n,b,j){erghea IjBOEC.nccyl(guvf,nethzragf);};;jvaqbj.IjNqNQ_VQ.IjPnapryGvzrbhg=shapgvba(n,c){c=IjTc(n,c);ine cay=jvaqbj.IjNqNQ_VQ.Cnaryf[c];vs(cay&&cay.UgU!=\"\"){pyrneGvzrbhg(cay.UgU);}};;jvaqbj.IjNqNQ_VQ.IjPnapryNyyGvzrbhgf=shapgvba(n){vs(jvaqbj.IjNqNQ_VQ.YbpxGvzrbhgPunatrf)erghea;sbe(ine c=0;c<jvaqbj.IjNqNQ_VQ.bac;c++)IjPnapryGvzrbhg(n,c);};;jvaqbj.IjNqNQ_VQ.IjFgnegGvzrbhg=shapgvba(n,c,bG){c=IjTc(n,c);ine cay=jvaqbj.IjNqNQ_VQ.Cnaryf[c];vs(cay&&((cay.UvqrGvzrbhgInyhr>0)||(nethzragf.yratgu==3&&bG>0))){pyrneGvzrbhg(cay.UgU);cay.UgU=frgGvzrbhg(cay.UvqrNpgvba,(nethzragf.yratgu==3?bG:cay.UvqrGvzrbhgInyhr));}};;jvaqbj.IjNqNQ_VQ.IjErfrgGvzrbhg=shapgvba(n,c,bG){c=IjTc(n,c);IjPnapryGvzrbhg(n,c);riny(\"IjFgnegGvzrbhg(NQ_VQ,c\"+(nethzragf.yratgu==3?\",bG\":\"\")+\")\");};;jvaqbj.IjNqNQ_VQ.IjErfrgNyyGvzrbhgf=shapgvba(n){sbe(ine c=0;c<jvaqbj.IjNqNQ_VQ.bac;c++)IjErfrgGvzrbhg(n,c);};;jvaqbj.IjNqNQ_VQ.IjQrgnpure=shapgvba(n,rig,sap){gel{vs(IjQVR5)riny(\"jvaqbj.qrgnpuRirag(\'ba\"+rig+\"\',\"+sap+\"NQ_VQ)\");ryfr vs(!IjQVRZnp)riny(\"jvaqbj.erzbir"
    public static let str9 = ";;jvaqbj.IjPurpxZbhfrCbfvgvbaNQ_VQ=shapgvba(r){vs(!r)ine r=jvaqbj.rirag;ine c=-1;vs(jvaqbj.IjNqNQ_VQ)c=jvaqbj.IjNqNQ_VQ.EbyybssCnary;ine bo=IjTrgBow(\"IjCnayNQ_VQ_\"+c);vs(bo&&bo.fglyr.ivfvovyvgl==\"ivfvoyr\"){ine fns=IjFns?8:0;ine pheK=r.pyvragK+IjBOFpe(\"U\")+fns,pheL=r.pyvragL+IjBOFpe(\"I\")+fns;ine y=IjBOEC(NQ_VQ,bo,\"Y\"),g=IjBOEC(NQ_VQ,bo,\"G\");ine e=y+jvaqbj.IjNqNQ_VQ.Cnaryf[c].Jvqgu,o=g+jvaqbj.IjNqNQ_VQ.Cnaryf[c].Urvtug;vs((pheK<y)||(pheK>e)||(pheL<g)||(pheL>o)){vs(jvaqbj.IjBaEbyybssNQ_VQ)IjBaEbyybssNQ_VQ(c);ryfr IjPybfrNq(NQ_VQ,c,gehr,\"\");}ryfr erghea;}IjPnapryZbhfrYvfgrareNQ_VQ();};;jvaqbj.IjFrgEbyybssCnaryNQ_VQ=shapgvba(c){ine z=\"zbhfrzbir\",q=qbphzrag,s=IjPurpxZbhfrCbfvgvbaNQ_VQ;c=IjTc(NQ_VQ,c);vs(jvaqbj.IjNqNQ_VQ&&jvaqbj.IjNqNQ_VQ.EbyybssCnary>-1)IjPnapryZbhfrYvfgrareNQ_VQ();vs(jvaqbj.IjNqNQ_VQ)jvaqbj.IjNqNQ_VQ.EbyybssCnary=c;gel{vs(q.nqqRiragYvfgrare)q.nqqRiragYvfgrare(z,s,snyfr);ryfr vs(q.nggnpuRirag)q.nggnpuRirag(\"ba\"+z,s);}pngpu(r){}};;jvaqbj.IjPnapryZbhfrYvfgrareNQ_VQ=shapgvba(){ine z=\"zbhfrzbir\",q=qbphzrag,s=IjPurpxZbhfrCbfvgvbaNQ_VQ;vs(jvaqbj.IjNqNQ_VQ)jvaqbj.IjNqNQ_VQ.EbyybssCnary=-1;gel{vs(q.erzbirRiragYvfgrare)q.erzbirRiragYvfgrare(z,s,snyfr);ryfr vs(q.qrgnpuRirag)q.qrgnpuRirag(\"ba\"+z,s);}pngpu(r){}};;jvaqbj.IjNqNQ_VQ.IjTc=d2(n,c){ine nq=jvaqbj.IjNqNQ_VQ;vs(vfAnA(c)){sbe(ine v=0;v<nq.Cnaryf.yratgu;v++)vs(nq.Cnaryf[v].Anzr==c)erghea v;erghea 0;}erghea c;};;jvaqbj.IjNqNQ_VQ.IjTpy=d2(n,c,p){ine cn=jvaqbj.IjNqNQ_VQ.Cnaryf[IjTc(n,c)];vs(!cn)erghea 0;vs(vfAnA(p)){sbe(ine v=0;v<cn.Pyvpxguehf.yratgu;v++)vs(cn.Pyvpxguehf[v].Anzr==p)erghea v;erghea 0;}erghea p;};;jvaqbj.IjNqNQ_VQ.IjGenpr=d2(n,f){gel{vs(jvaqbj[\"Ij\"+\"QtQ\"])jvaqbj[\"Ij\"+\"QtQ\"](n,1,f);}pngpu(r){}};;jvaqbj.IjNqNQ_VQ.IjYvzvg1=d2(n,f){ine nq=jvaqbj.IjNqNQ_VQ,vh=f.fcyvg(\"/\");sbe(ine v=0,p=0;v<vh.yratgu;v++){vs(vh[v].yratgu>0){vs(nq.FzV.yratgu>0)nq.FzV+=\"/\";nq.FzV+=vh[v];nq.FtZ[nq.FtZ.yratgu]=snyfr;}}};;jvaqbj.IjNqNQ_VQ.IjYvzvg0=d2(n,f){ine nq=jvaqbj.IjNqNQ_VQ,vh=f.fcyvg(\"/\");sbe(ine v=0;v<vh.yratgu;v++){vs(vh[v].yratgu>0){vs(nq.OvC.yratgu>0)nq.OvC+=\"/\";nq.OvC+=vh[v];}}};;jvaqbj.IjNqNQ_VQ.IjRVST=d2(n,c){jvaqbj[\"IjCnayNQ_VQ_\"+c+\"_Bow\"]=IjTrgBow(\"IjCnayNQ_VQ_\"+c+\"_Bow\");vs(jvaqbj[\"IjCnayNQ_VQ_\"+c+\"_Bow\"]==ahyy)frgGvzrbhg(\"IjRVST(NQ_VQ,\"+c+\")\",jvaqbj.IjNqNQ_VQ.rvsg);};;jvaqbj.IjNqNQ_VQ.IjNavzSHC=d2(n,c){ine nq=jvaqbj.IjNqNQ_VQ;vs(c>nq.Cnaryf.yratgu)erghea;ine cna=nq.Cnaryf[c],nn=gehr,on=gehr,yn=gehr,en=gehr,cn=nq.Cnaryf[0],sf=nq.ShF,j=cn.Jvqgu,u=cn.Urvtug;vs(j==\"100%\"){j=sf;en=snyfr;yn=snyfr;}vs(u==\"100%\"){u=sf;nn=snyfr;on=snyfr;}vs(cn.YnY==\"Y\")yn=snyfr;vs(cn.YnY==\"E\")en=snyfr;vs(cn.GnY==\"G\")nn=snyfr;vs(cn.GnY==\"O\")on=snyfr;ine k=0,l=0;fjvgpu(nq.NshP%8){pnfr 0:oernx;pnfr 1:vs(nn)l=-sf;oernx;pnfr 2:k=j-sf;oernx;pnfr 3:vs(en)k=j;oernx;pnfr 4:k=j-sf;l=u-sf;oernx;pnfr 5:k=j-sf;vs(on)l=u;oernx;pnfr 6:l=u-sf;oernx;pnfr 7:vs(yn)k=-sf;l=u-sf;oernx;}vs(nq.NshP++ <nq.NshG)frgGvzrbhg((\"IjNavzSHC(NQ_VQ,\"+c+\")\"),nq.NshC);ryfr{k=-1000;l=k;}cna.YrsgBssfrg=k;cna.GbcBssfrg=l;IjNhErcb(n,c);};;jvaqbj.IjNqNQ_VQ.IjTrgErnyCbfvgvba=d2(n,b,j){erghea IjBOEC.nccyl(guvf,nethzragf);};;jvaqbj.IjNqNQ_VQ.IjPnapryGvzrbhg=d2(n,c){c=IjTc(n,c);ine cay=jvaqbj.IjNqNQ_VQ.Cnaryf[c];vs(cay&&cay.UgU!=\"\"){pyrneGvzrbhg(cay.UgU);}};;jvaqbj.IjNqNQ_VQ.IjPnapryNyyGvzrbhgf=d2(n){vs(jvaqbj.IjNqNQ_VQ.YbpxGvzrbhgPunatrf)erghea;sbe(ine c=0;c<jvaqbj.IjNqNQ_VQ.bac;c++)IjPnapryGvzrbhg(n,c);};;jvaqbj.IjNqNQ_VQ.IjFgnegGvzrbhg=d2(n,c,bG){c=IjTc(n,c);ine cay=jvaqbj.IjNqNQ_VQ.Cnaryf[c];vs(cay&&((cay.UvqrGvzrbhgInyhr>0)||(nethzragf.yratgu==3&&bG>0))){pyrneGvzrbhg(cay.UgU);cay.UgU=frgGvzrbhg(cay.UvqrNpgvba,(nethzragf.yratgu==3?bG:cay.UvqrGvzrbhgInyhr));}};;jvaqbj.IjNqNQ_VQ.IjErfrgGvzrbhg=d2(n,c,bG){c=IjTc(n,c);IjPnapryGvzrbhg(n,c);riny(\"IjFgnegGvzrbhg(NQ_VQ,c\"+(nethzragf.yratgu==3?\",bG\":\"\")+\")\");};;jvaqbj.IjNqNQ_VQ.IjErfrgNyyGvzrbhgf=d2(n){sbe(ine c=0;c<jvaqbj.IjNqNQ_VQ.bac;c++)IjErfrgGvzrbhg(n,c);};;jvaqbj.IjNqNQ_VQ.IjQrgnpure=d2(n,rig,sap){gel{vs(IjQVR5)riny(\"jvaqbj.qrgnpuRirag(\'ba\"+rig+\"\',\"+sap+\"NQ_VQ)\");ryfr vs(!IjQVRZnp)riny(\"jvaqbj.erzbirRiragYvfgrare(\'\"+rig+\"\',\"+sap+\"NQ_VQ,snyfr)\");}pngpu(r){}};;jvaqbj.IjNqNQ_VQ.IjPyrna"

    let s26 = computeInvariants("VC=", 81);
    let s27 = computeInvariants("9.0  e115", 78);
    let s28 = computeInvariants("k", 78);
    let s29 = computeInvariants(str2, 81);
    let s30 = computeInvariants(str3, 81);
    let s31 = computeInvariants("144631658", 78);
    let s32 = computeInvariants("Pbhagel=IIZ%3Q", 78);
    let s33 = computeInvariants("Pbhagel=IIZ=", 78);
    let s34 = computeInvariants("CersreerqPhygherCraqvat=", 78);
    let s35 = computeInvariants(str4, 78);
    let s36 = computeInvariants(str5, 78);
    let s37 = computeInvariants("__hgzp=144631658", 78);
    let s38 = computeInvariants("gvzrMbar=-8", 78);
    let s39 = computeInvariants("gvzrMbar=0", 78);
    //var s40 = computeInvariants(s15, 78);
    let s41 = computeInvariants("vachggrkg  QBZPbageby_cynprubyqre", 78);
    let s42 = computeInvariants("xrlqbja", 78);
    let s43 = computeInvariants("xrlhc", 78);
    let s44 = computeInvariants("uggc://zrffntvat.zlfcnpr.pbz/vaqrk.psz", 77);
    let s45 = computeInvariants("FrffvbaFgbentr=%7O%22GnoThvq%22%3N%7O%22thvq%22%3N1231367125017%7Q%7Q", 73);
    let s46 = computeInvariants(str6, 72);
    let s47 = computeInvariants("xyz", 70);
    let s48 = computeInvariants(str7, 70);
    let s49 = computeInvariants(str8, 70);
    let s50 = computeInvariants(str9, 70);
    let s51 = computeInvariants("NI%3Q1_CI%3Q1_PI%3Q1_EI%3Q1_HI%3Q1_HP%3Q1_IC%3Q0.0.0.0_IH%3Q0", 70);
    let s52 = computeInvariants("svz_zlfcnpr_ubzrcntr_abgybttrqva,svz_zlfcnpr_aba_HTP,svz_zlfcnpr_havgrq-fgngrf", 70);
    let s53 = computeInvariants("ybnqvat", 70);
    let s54 = computeInvariants("#", 68);
    let s55 = computeInvariants("ybnqrq", 68);
    let s56 = computeInvariants("pbybe", 49);
    let s57 = computeInvariants("uggc://sevraqf.zlfcnpr.pbz/vaqrk.psz", 44);

    func runBlock1(): Int64 {
      var sum = 0;
      for (i in 0..78) {
        sum += Exec(re8,s26[i]);
        sum += Regex("(\\s)+e").matcher(s27[i]).replaceAll("").size
        sum += Regex(".").matcher(s28[i]).replaceAll("").size
        sum += re17.matcher(s29[i]).replaceAll("").size
        sum += re17.matcher(s30[i]).replaceAll("").size

        sum += Exec(re8,s31[i]);
        sum += Exec(re8,s32[i]);
        sum += Exec(re8,s33[i]);
        sum += Exec(re8,s34[i]);
        sum += Exec(re8,s35[i]);
        sum += Exec(re8,s36[i]);
        sum += Exec(re8,s37[i]);
        sum += Exec(re8,s38[i]);
        sum += Exec(re8,s39[i]);
        sum += Exec(Regex("Fnsnev\\/(\\d+\\.\\d+)"),s15[i]);
        sum += Exec(re3,s41[i]);
        sum += Exec(re0,s42[i]);
        sum += Exec(re0,s43[i]);
      }
       for  (i in 0..77) {
        sum += re12.matcher(s44[i]).replaceAll("").size
        sum += Exec(re13,s44[i]);
      }
       for  (i in 0..72) {
        sum += re18.matcher(s45[i]).replaceAll("").size
        sum += Exec(re1,s46[i]);
      }
       for  (i in 0..70) {
        sum += Exec(re19,"");
        sum += re11.matcher(s47[i]).replaceAll("").size
            sum += Regex("d1").matcher(s48[i]).replaceAll("").size
            sum += Regex("NQ_VQ").matcher(s49[i]).replaceAll("").size
            sum += Regex("d2").matcher(s50[i]).replaceAll("").size
            sum += Regex("_").matcher(s51[i]).replaceAll("").size
        sum += s52[i].split(re20.string()).size
        sum += Exec(re21,s53[i]);
      }
       for  (i in 0..68) {
        sum += Exec(re1,s54[i]);
        sum += Exec(Regex("/(?:ZFVR.(\\d+\\.\\d+))|(?:(?:Sversbk|TenaCnenqvfb|Vprjrnfry).(\\d+\\.\\d+))|(?:Bcren.(\\d+\\.\\d+))|(?:NccyrJroXvg.(\\d+(?:\\.\\d+)?))"),s15[i])
        sum += Exec(Regex("(Znp BF K)|(Jvaqbjf;)"),s15[i])
        sum += Exec(Regex("Trpxb\\/([0-9]+)"),s15[i])
        sum += Exec(re21,s55[i])
      }
       for  (i in 0..44) {
        sum += Exec(re16,s56[i]);
           sum += re12.matcher(s57[i]).replaceAll("").size
        sum += Exec(re13,s57[i]);
      }
      return sum;
    }

    public static let re22 = Regex("\\bso_zrah\\b")
    public static let re23 = Regex("^(([^:\\/?#]+):)?(\\/\\/([^\\/?#]*))?([^?#]*)(\\?([^#]*))?(#(.*))?")
    public static let re24 = Regex("uggcf?:\\/\\/([^\\/]+\\.)?snprobbx\\.pbz\\/")
    public static let re25 = Regex("\"")
    public static let re26 = Regex("^([^?#]+)(?:\\?([^#]*))?(#.*)?")

    let s57a = computeInvariants("fryrpgrq", 40);
    let s58 = computeInvariants("vachggrkg uvqqra_ryrz", 40);
    let s59 = computeInvariants("vachggrkg ", 40);
    let s60 = computeInvariants("vachggrkg", 40);
    let s61 = computeInvariants("uggc://jjj.snprobbx.pbz/", 40);
    let s62 = computeInvariants("uggc://jjj.snprobbx.pbz/ybtva.cuc", 40);
    let s63 = computeInvariants("Funer guvf tnqtrg", 40);
    let s64 = computeInvariants("uggc://jjj.tbbtyr.pbz/vt/qverpgbel", 40);
    let s65 = computeInvariants("419", 40);
    let s66 = computeInvariants("gvzrfgnzc", 40);

    func runBlock2(): Int64 {
      var sum = 0;
      for (i in 0..40) {
          sum += re14.matcher(s57a[i]).replaceAll("").size
          sum += re15.matcher(s57a[i]).replaceAll("").size
      }
      for (i in 0..39) {
          sum += Regex("\\buvqqra_ryrz\\b").matcher(s58[i]).replaceAll("").size
            sum += Exec(re3,s59[i]);
            sum += Exec(re3,s60[i]);
            sum += Exec(re22,"HVYvaxOhggba");
            sum += Exec(re22,"HVYvaxOhggba_E");
            sum += Exec(re22,"HVYvaxOhggba_EJ");
            sum += Exec(re22,"zrah_ybtva_pbagnvare");
            sum += Exec(Regex("\\buvqqra_ryrz\\b"),"vachgcnffjbeq");
      }
      for (_ in 0..37) {
        sum += Exec(re8,"111soqs57qo8o8480qo18sor2011r3n591q7s6s37r120904");
        sum += Exec(re8,"SbeprqRkcvengvba=633669315660164980");
        sum += Exec(re8,"FrffvbaQQS2=111soqs57qo8o8480qo18sor2011r3n591q7s6s37r120904");
      }
      for (_ in 0..35) {

          sum += re14.matcher("puvyq p1 svefg").replaceAll("").size
          sum += re15.matcher("puvyq p1 svefg").replaceAll("").size
          sum += re14.matcher("sylbhg pybfrq").replaceAll("").size
          sum += re15.matcher("sylbhg pybfrq").replaceAll("").size

      }
      for (_ in 0..34) {
        sum += Exec(re19,"gno2");
        sum += Exec(re19,"gno3");
        sum += Exec(re8,"44132r503660");
        sum += Exec(re8,"SbeprqRkcvengvba=633669316860113296");
        sum += Exec(re8,"AFP_zp_dfctwzs-aowb_80=44132r503660");
        sum += Exec(re8,"FrffvbaQQS2=s6r4579npn4rn2135s904r0s75pp1o5334p6s6pospo12696");
        sum += Exec(re8,"s6r4579npn4rn2135s904r0s75pp1o5334p6s6pospo12696");
      }
      for (i in 0..31) {
        sum += Exec(Regex("puebzr"),s15[i]);
          sum += re23.matcher(s61[i]).replaceAll("").size

        sum += Exec(re8,"SbeprqRkcvengvba=633669358527244818");
        sum += Exec(re8,"VC=xyz");
        sum += Exec(re8,"FrffvbaQQS2=s15q53p9n372sn76npr13o271n4s3p5r29p235746p908p58");
        sum += Exec(re8,"s15q53p9n372sn76npr13o271n4s3p5r29p235746p908p58");
        sum += Exec(re24,s61[i]);
      }
      for (i in 0..30) {
          sum += re26.matcher(s65[i]).replaceAll("").size
        sum += Exec(Regex("(?:^|\\s+)gvzrfgnzc(?:\\s+|$)"),s66[i]);
        sum += Exec(re7,s65[i]);
      }
      for (i in 0..28) {
          sum += re23.matcher(s62[i]).replaceAll("").size
          sum += re25.matcher(s63[i]).replaceAll("").size
          sum += re12.matcher(s63[i]).replaceAll("").size
        sum += Exec(re26,s64[i]);
      }
      return sum;
    }

    public static let re27 = Regex("-\\D")
    public static let re28 = Regex("\\bnpgvingr\\b")
    public static let re29 = Regex("%2R")
    public static let re30 = Regex("%2S")
    public static let re31 = Regex("^(mu-(PA|GJ)|wn|xb)$")
    public static let re32 = Regex("\\s?;\\s?")
    public static let re33 = Regex("%\\w?$")
    public static let re34 = Regex("TNQP=([^;]*)/i")

    public static let str10 = "FrffvbaQQS2=111soqs57qo8o8480qo18sor2011r3n591q7s6s37r120904; ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669315660164980&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R="
    public static let str11 = "FrffvbaQQS2=111soqs57qo8o8480qo18sor2011r3n591q7s6s37r120904; __hgzm=144631658.1231363570.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar); __hgzn=144631658.3426875219718084000.1231363570.1231363570.1231363570.1; __hgzo=144631658.0.10.1231363570; __hgzp=144631658; ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669315660164980&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str12 = "uggc://tbbtyrnqf.t.qbhoyrpyvpx.arg/cntrnq/nqf?pyvrag=pn-svz_zlfcnpr_zlfcnpr-ubzrcntr_wf&qg=1231363514065&uy=ra&nqfnsr=uvtu&br=hgs8&ahz_nqf=4&bhgchg=wf&nqgrfg=bss&pbeeryngbe=1231363514065&punaary=svz_zlfcnpr_ubzrcntr_abgybttrqva%2Psvz_zlfcnpr_aba_HTP%2Psvz_zlfcnpr_havgrq-fgngrf&hey=uggc%3N%2S%2Subzr.zlfcnpr.pbz%2Svaqrk.psz&nq_glcr=grkg&rvq=6083027&rn=0&sez=0&tn_ivq=1326469221.1231363557&tn_fvq=1231363557&tn_uvq=1114636509&synfu=9.0.115&h_u=768&h_j=1024&h_nu=738&h_nj=1024&h_pq=24&h_gm=-480&h_uvf=2&h_wnin=gehr&h_acyht=7&h_azvzr=22"
    public static let str13 = "ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669315660164980&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str14 = "ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669315660164980&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R="
    public static let re35 = Regex("[<>]")
    public static let str15 = "FrffvbaQQS2=s6r4579npn4rn2135s904r0s75pp1o5334p6s6pospo12696; ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669316860113296&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R=; AFP_zp_dfctwzs-aowb_80=44132r503660"
    public static let str16 = "FrffvbaQQS2=s6r4579npn4rn2135s904r0s75pp1o5334p6s6pospo12696; AFP_zp_dfctwzs-aowb_80=44132r503660; __hgzm=144631658.1231363638.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar); __hgzn=144631658.965867047679498800.1231363638.1231363638.1231363638.1; __hgzo=144631658.0.10.1231363638; __hgzp=144631658; ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669316860113296&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str17 = "uggc://tbbtyrnqf.t.qbhoyrpyvpx.arg/cntrnq/nqf?pyvrag=pn-svz_zlfcnpr_zlfcnpr-ubzrcntr_wf&qg=1231363621014&uy=ra&nqfnsr=uvtu&br=hgs8&ahz_nqf=4&bhgchg=wf&nqgrfg=bss&pbeeryngbe=1231363621014&punaary=svz_zlfcnpr_ubzrcntr_abgybttrqva%2Psvz_zlfcnpr_aba_HTP%2Psvz_zlfcnpr_havgrq-fgngrf&hey=uggc%3N%2S%2Scebsvyr.zlfcnpr.pbz%2Svaqrk.psz&nq_glcr=grkg&rvq=6083027&rn=0&sez=0&tn_ivq=348699119.1231363624&tn_fvq=1231363624&tn_uvq=895511034&synfu=9.0.115&h_u=768&h_j=1024&h_nu=738&h_nj=1024&h_pq=24&h_gm=-480&h_uvf=2&h_wnin=gehr&h_acyht=7&h_azvzr=22"
    public static let str18 = "uggc://jjj.yrobapbva.se/yv"
    public static let str19 = "ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669316860113296&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str20 = "ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669316860113296&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R="

    let s67 = computeInvariants("e115", 27);
    let s68 = computeInvariants("qvfcynl", 27);
    let s69 = computeInvariants("cbfvgvba", 27);
    let s70 = computeInvariants("uggc://jjj.zlfcnpr.pbz/", 27);
    let s71 = computeInvariants("cntrivrj", 27);
    let s72 = computeInvariants("VC=", 27);
    let s73 = computeInvariants("ra", 27);
    let s74 = computeInvariants(str10, 27);
    let s75 = computeInvariants(str11, 27);
    let s76 = computeInvariants(str12, 27);
    let s77 = computeInvariants(str17, 27);
    let s78 = computeInvariants(str18, 27);

    func runBlock3(): Int64 {
      var sum = 0;
      for (i in 0..23) {
          sum += Regex("[A-Za-z]").matcher(s67[i]).replaceAll("").size
          sum += re27.matcher(s68[i]).replaceAll("").size
          sum += re27.matcher(s69[i]).replaceAll("").size

      }
      for (_ in 0..22) {
          sum += re14.matcher("unaqyr").replaceAll("").size
          sum += re15.matcher("unaqyr").replaceAll("").size
          sum += re14.matcher("yvar").replaceAll("").size
          sum += re15.matcher("yvar").replaceAll("").size
          sum += re14.matcher("cnerag puebzr6 fvatyr1 gno").replaceAll("").size
          sum += re15.matcher("cnerag puebzr6 fvatyr1 gno").replaceAll("").size
          sum += re14.matcher("fyvqre").replaceAll("").size
          sum += re15.matcher("fyvqre").replaceAll("").size
          sum += Exec(re28,"")
      }
      for (i in 0..21) {
          sum += re12.matcher(s70[i]).replaceAll("").size
        sum += Exec(re13,s70[i])
      }
      for (i in 0..20) {
          sum += re29.matcher(s71[i]).replaceAll("").size
          sum += re30.matcher(s71[i]).replaceAll("").size

        sum += Exec(re19,"ynfg")
        sum += Exec(re19,"ba svefg")
        sum += Exec(re8,s72[i])
      }
      for (i in 0..18) {
        sum += Exec(re31,s73[i])
        sum += s74[i].split(re32.string()).size
        sum += s75[i].split(re32.string()).size
          sum += re33.matcher(s76[i]).replaceAll("").size

        sum += Exec(re8,"144631658.0.10.1231363570")
        sum += Exec(re8,"144631658.1231363570.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
        sum += Exec(re8,"144631658.3426875219718084000.1231363570.1231363570.1231363570.1")
          sum += Exec(re8,str13)
          sum += Exec(re8,str14)
        sum += Exec(re8,"__hgzn=144631658.3426875219718084000.1231363570.1231363570.1231363570.1")
        sum += Exec(re8,"__hgzo=144631658.0.10.1231363570")
        sum += Exec(re8,"__hgzm=144631658.1231363570.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
        sum += Exec(re34,s74[i])
        sum += Exec(re34,s75[i])
      }
      for (i in 0..17) {
        Regex("/zfvr").matcher(s15[i]).fullMatch()
        Regex("/bcren").matcher(s15[i]).fullMatch()
          sum += str15.split(re32.string()).size;
          sum += str16.split(re32.string()).size;

          sum += re14.matcher("ohggba").replaceAll("").size
          sum += re15.matcher("ohggba").replaceAll("").size
          sum += re14.matcher("puvyq p1 svefg sylbhg pybfrq").replaceAll("").size
          sum += re15.matcher("puvyq p1 svefg sylbhg pybfrq").replaceAll("").size
          sum += re14.matcher("pvgvrf").replaceAll("").size
          sum += re15.matcher("pvgvrf").replaceAll("").size
          sum += re14.matcher("pybfrq").replaceAll("").size
          sum += re15.matcher("pybfrq").replaceAll("").size
          sum += re14.matcher("qry").replaceAll("").size
          sum += re15.matcher("qry").replaceAll("").size
          sum += re14.matcher("uqy_zba").replaceAll("").size
          sum += re15.matcher("uqy_zba").replaceAll("").size
          sum += re33.matcher(s77[i]).replaceAll("").size
          sum += Regex("/%3P/").matcher(s78[i]).replaceAll("").size
          sum += Regex("/%3R/").matcher(s78[i]).replaceAll("").size
          sum += Regex("/%3R/").matcher(s78[i]).replaceAll("").size
          sum += re35.matcher(s78[i]).replaceAll("").size
          sum += re14.matcher("yvaxyvfg16").replaceAll("").size
          sum += re15.matcher("yvaxyvfg16").replaceAll("").size
          sum += re14.matcher("zvahf").replaceAll("").size
          sum += re15.matcher("zvahf").replaceAll("").size
          sum += re14.matcher("bcra").replaceAll("").size
          sum += re15.matcher("bcra").replaceAll("").size
          sum += re14.matcher("cnerag puebzr5 fvatyr1 ps NU").replaceAll("").size
          sum += re15.matcher("cnerag puebzr5 fvatyr1 ps NU").replaceAll("").size
          sum += re14.matcher("cynlre").replaceAll("").size
          sum += re15.matcher("cynlre").replaceAll("").size
          sum += re14.matcher("cyhf").replaceAll("").size
          sum += re15.matcher("cyhf").replaceAll("").size
          sum += re14.matcher("cb_uqy").replaceAll("").size
          sum += re15.matcher("cb_uqy").replaceAll("").size
          sum += re14.matcher("hyJVzt").replaceAll("").size
          sum += re15.matcher("hyJVzt").replaceAll("").size

        sum += Exec(re8,"144631658.0.10.1231363638")
        sum += Exec(re8,"144631658.1231363638.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
        sum += Exec(re8,"144631658.965867047679498800.1231363638.1231363638.1231363638.1")
        sum += Exec(re8,"4413268q3660")
        sum += Exec(re8,"4ss747o77904333q374or84qrr1s9r0nprp8r5q81534o94n")
        sum += Exec(re8,"SbeprqRkcvengvba=633669321699093060")
        sum += Exec(re8,"VC=")
        sum += Exec(re8,str19)
          sum += Exec(re8,str20)
        sum += Exec(re8,"AFP_zp_tfwsbrg-aowb_80=4413268q3660")
        sum += Exec(re8,"FrffvbaQQS2=4ss747o77904333q374or84qrr1s9r0nprp8r5q81534o94n")
        sum += Exec(re8,"__hgzn=144631658.965867047679498800.1231363638.1231363638.1231363638.1")
        sum += Exec(re8,"__hgzo=144631658.0.10.1231363638")
        sum += Exec(re8,"__hgzm=144631658.1231363638.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
        sum += Exec(re34,str15)
        sum += Exec(re34,str16)
      }
      return sum;
    }

    public static let re36 = Regex("uers|fep|fryrpgrq")
    public static let re37 = Regex("\\s*([+>~\\s])\\s*([a-zA-Z#.*:\\[])")
    public static let re38 = Regex("^(\\w+|\\*)$")

    public static let str21 = "FrffvbaQQS2=s15q53p9n372sn76npr13o271n4s3p5r29p235746p908p58; ZFPhygher=VC=xyz&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669358527244818&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R="
    public static let str22 = "FrffvbaQQS2=s15q53p9n372sn76npr13o271n4s3p5r29p235746p908p58; __hgzm=144631658.1231367822.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar); __hgzn=144631658.4127520630321984500.1231367822.1231367822.1231367822.1; __hgzo=144631658.0.10.1231367822; __hgzp=144631658; ZFPhygher=VC=xyz&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669358527244818&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str23 = "uggc://tbbtyrnqf.t.qbhoyrpyvpx.arg/cntrnq/nqf?pyvrag=pn-svz_zlfcnpr_zlfcnpr-ubzrcntr_wf&qg=1231367803797&uy=ra&nqfnsr=uvtu&br=hgs8&ahz_nqf=4&bhgchg=wf&nqgrfg=bss&pbeeryngbe=1231367803797&punaary=svz_zlfcnpr_ubzrcntr_abgybttrqva%2Psvz_zlfcnpr_aba_HTP%2Psvz_zlfcnpr_havgrq-fgngrf&hey=uggc%3N%2S%2Szrffntvat.zlfcnpr.pbz%2Svaqrk.psz&nq_glcr=grkg&rvq=6083027&rn=0&sez=0&tn_ivq=1192552091.1231367807&tn_fvq=1231367807&tn_uvq=1155446857&synfu=9.0.115&h_u=768&h_j=1024&h_nu=738&h_nj=1024&h_pq=24&h_gm=-480&h_uvf=2&h_wnin=gehr&h_acyht=7&h_azvzr=22"
    public static let str24 = "ZFPhygher=VC=xyz&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669358527244818&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str25 = "ZFPhygher=VC=xyz&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669358527244818&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R="
    public static let str26 = "hy.ynat-fryrpgbe"
    public static let re39 = Regex("/\\/")
    public static let re40 = Regex(" ")
    public static let re41 = Regex("\\/\\xc4\\/t")
    public static let re42 = Regex("\\/\\xd6\\/t")
    public static let re43 = Regex("\\/\\xdc\\/t")
    public static let re44 = Regex("\\/\\xdf\\/t")
    public static let re45 = Regex("\\/\\xe4\\/t")
    public static let re46 = Regex("\\/\\xf6\\/t")
    public static let re47 = Regex("\\/\\xfc\\/t")
    public static let re48 = Regex("\\W")
    public static let re49 = Regex("uers|fep|fglyr")

    let s79 = computeInvariants(str21, 16);
    let s80 = computeInvariants(str22, 16);
    let s81 = computeInvariants(str23, 16);
    let s82 = computeInvariants(str26, 16);

    func runBlock4(): Int64 {
      var sum = 0;
      for (i in 0..16) {
          sum += Regex("\\*").matcher("").replaceAll("").size

        sum += Exec(Regex("\\bnpgvir\\b"),"npgvir")
        sum += Exec(Regex("sversbk/i"),s15[i])
        sum += Exec(re36,"glcr")
        sum += Exec(Regex("zfvr/i"),s15[i])
        sum += Exec(Regex("bcren/i"),s15[i])
      }
      for (i in 0..15) {
        sum += s79[i].split(re32.string()).size;
        sum += s80[i].split(re32.string()).size;
          sum += re12.matcher("uggc://ohyyrgvaf.zlfcnpr.pbz/vaqrk.psz").replaceAll("").size
          sum += re33.matcher(s81[i]).replaceAll("").size
          sum += re37.matcher("yv").replaceAll("").size
        sum += re18.matcher("yv").replaceAll("").size

        sum += Exec(re8,"144631658.0.10.1231367822")
        sum += Exec(re8,"144631658.1231367822.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
        sum += Exec(re8,"144631658.4127520630321984500.1231367822.1231367822.1231367822.1")
        sum += Exec(re8,str24)
        sum += Exec(re8,str25)
        sum += Exec(re8,"__hgzn=144631658.4127520630321984500.1231367822.1231367822.1231367822.1")
        sum += Exec(re8,"__hgzo=144631658.0.10.1231367822")
        sum += Exec(re8,"__hgzm=144631658.1231367822.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
        sum += Exec(re34,s79[i])
        sum += Exec(re34,s80[i])
        sum += Exec(Regex("\\.([\\w-]+)|\\[(\\w+)(?:([!*^$~|]?=)[\"']?((.*)?)[\"']?)?\\]|:([\\w-]+)(?:\\([\"']?((.*)?)?[\"']?\\)|$)"),s82[i])
        sum += Exec(re13,"uggc://ohyyrgvaf.zlfcnpr.pbz/vaqrk.psz")
        sum += Exec(re38,"yv")
      }
        for (_ in 0..14) {
        sum += re18.matcher("").replaceAll("").size
        sum += Regex("(\\s+e|\\s+o[0-9]+)").matcher("9.0  e115").replaceAll("").size
        sum += Regex("<").matcher("Funer guvf tnqtrg").replaceAll("").size
        sum += Regex(">").matcher("Funer guvf tnqtrg").replaceAll("").size
        sum += re39.matcher("Funer guvf tnqtrg").replaceAll("").size
        sum += re12.matcher("uggc://cebsvyrrqvg.zlfcnpr.pbz/vaqrk.psz").replaceAll("").size

          sum += re40.matcher("grnfre").replaceAll("").size
          sum += re41.matcher("grnfre").replaceAll("").size
          sum += re42.matcher("grnfre").replaceAll("").size
          sum += re43.matcher("grnfre").replaceAll("").size
          sum += re44.matcher("grnfre").replaceAll("").size
          sum += re45.matcher("grnfre").replaceAll("").size
          sum += re46.matcher("grnfre").replaceAll("").size
          sum += re47.matcher("grnfre").replaceAll("").size
          sum += re48.matcher("grnfre").replaceAll("").size

        sum += Exec(re16,"znetva-gbc")
        sum += Exec(re16,"cbfvgvba")
        sum += Exec(re19,"gno1")
        sum += Exec(re9,"qz")
        sum += Exec(re9,"qg")
        sum += Exec(re9,"zbqobk")
        sum += Exec(re9,"zbqobkva")
        sum += Exec(re9,"zbqgvgyr")
        sum += Exec(re13,"uggc://cebsvyrrqvg.zlfcnpr.pbz/vaqrk.psz")
        sum += Exec(re26,"/vt/znvytnqtrg")
        sum += Exec(re49,"glcr")
      }
      return sum;
    }

    public static let re50 = Regex("(?:^|\\s+)fryrpgrq(?:\\s+|$)")
    public static let re51 = Regex("\\&")
    public static let re52 = Regex("\\+")
    public static let re53 = Regex("\\?")
    public static let re54 = Regex("\\t")
    public static let re55 = Regex("(\\$\\{nqiHey\\})|(\\$nqiHey\\b)")
    public static let re56 = Regex("(\\$\\{cngu\\})|(\\$cngu\\b)")

    func runBlock5(): Int64 {
      var sum = 0;
      for (i in 0..13) {
        sum += re14.matcher("purpx").replaceAll("").size
        sum += re15.matcher("purpx").replaceAll("").size
        sum += re14.matcher("pvgl").replaceAll("").size
        sum += re15.matcher("pvgl").replaceAll("").size
        sum += re14.matcher("qrpe fyvqrgrkg").replaceAll("").size
        sum += re15.matcher("qrpe fyvqrgrkg").replaceAll("").size
        sum += re14.matcher("svefg fryrpgrq").replaceAll("").size
        sum += re15.matcher("svefg fryrpgrq").replaceAll("").size
        sum += re14.matcher("uqy_rag").replaceAll("").size
        sum += re15.matcher("uqy_rag").replaceAll("").size
        sum += re14.matcher("vape fyvqrgrkg").replaceAll("").size
        sum += re15.matcher("vape fyvqrgrkg").replaceAll("").size
        sum += re5.matcher("vachggrkg QBZPbageby_cynprubyqre").replaceAll("").size
        sum += re14.matcher("cnerag puebzr6 fvatyr1 gno fryrpgrq").replaceAll("").size
        sum += re15.matcher("cnerag puebzr6 fvatyr1 gno fryrpgrq").replaceAll("").size
        sum += re14.matcher("cb_guz").replaceAll("").size
        sum += re15.matcher("cb_guz").replaceAll("").size
        sum += re14.matcher("fhozvg").replaceAll("").size
        sum += re15.matcher("fhozvg").replaceAll("").size
        sum += Exec(re50,"")
        sum += Exec(Regex("NccyrJroXvg\\/([^\\s]*)"),s15[i])
        sum += Exec(Regex("XUGZY"),s15[i])
      }
      for (i in 0..12) {
        sum += Regex(##"(\\$\\{cebg\\})|(\\$cebg\\b)"##).matcher(##"${cebg}://${ubfg}${cngu}/${dz}"##).replaceAll("").size
        sum += re40.matcher("1").replaceAll("").size
        sum += re10.matcher("1").replaceAll("").size
        sum += re51.matcher("1").replaceAll("").size
        sum += re52.matcher("1").replaceAll("").size
        sum += re53.matcher("1").replaceAll("").size
        sum += re39.matcher("1").replaceAll("").size

        sum += re54.matcher("1").replaceAll("").size
        sum += Regex("^(.*)\\..*$").matcher("9.0  e115").replaceAll("").size
        sum += Regex("^.*e(.*)$").matcher("9.0  e115").replaceAll("").size
        sum += re55.matcher(##"<!-- ${nqiHey} -->"##).replaceAll("").size
        sum += re55.matcher(##"<fpevcg glcr=\"grkg/wninfpevcg\" fep=\"${nqiHey}\"></fpevcg>"##).replaceAll("").size
        sum += Regex("^.*\\s+(\\S+\\s+\\S+$)").matcher(s21[i]).replaceAll("").size
        sum += re30.matcher("tzk%2Subzrcntr%2Sfgneg%2Sqr%2S").replaceAll("").size
        sum += re30.matcher("tzk").replaceAll("").size
        sum += Regex(##"(\\$\\{ubfg\\})|(\\$ubfg\\b)"##).matcher(##"uggc://${ubfg}${cngu}/${dz}"##).replaceAll("").size
        sum += re56.matcher(##"uggc://nqpyvrag.hvzfrei.arg${cngu}/${dz}"##).replaceAll("").size
        sum += Regex("(\\$\\{dz\\})|(\\$dz\\b)").matcher(##"uggc://nqpyvrag.hvzfrei.arg/wf.at/${dz}"##).replaceAll("").size
        sum += re29.matcher("frpgvba").replaceAll("").size
        sum += re30.matcher("frpgvba").replaceAll("").size
        sum += re29.matcher("fvgr").replaceAll("").size
        sum += re30.matcher("fvgr").replaceAll("").size
        sum += re29.matcher("fcrpvny").replaceAll("").size
        sum += re30.matcher("fcrpvny").replaceAll("").size
        sum += Exec(re36,"anzr")
        sum += Exec(Regex("e"),"9.0  e115")
      }
      return sum;
    }

    public static let re57 = Regex("##yv4##/")
    public static let re58 = Regex("##yv16##/")
    public static let re59 = Regex("##yv19##/")
    public static let str27 = "<hy pynff=\"nqi\">##yv4##Cbjreshy Zvpebfbsg grpuabybtl urycf svtug fcnz naq vzcebir frphevgl.##yv19##Trg zber qbar gunaxf gb terngre rnfr naq fcrrq.##yv16##Ybgf bs fgbentr &#40;5 TO&#41; - zber pbby fghss ba gur jnl.##OE## ##OE## ##N##Yrnea zber##/N##</hy>"
    public static let str28 = "<hy pynff=\"nqi\"><yv vq=\"YvOYG4\" fglyr=\"onpxtebhaq-vzntr:hey(uggc://vzt.jykef.pbz/~Yvir.FvgrPbagrag.VQ/~14.2.1230/~/~/~/oyg4.cat)\">Cbjreshy Zvpebfbsg grpuabybtl urycf svtug fcnz naq vzcebir frphevgl.##yv19##Trg zber qbar gunaxf gb terngre rnfr naq fcrrq.##yv16##Ybgf bs fgbentr &#40;5 TO&#41; - zber pbby fghss ba gur jnl.##OE## ##OE## ##N##Yrnea zber##/N##</hy>"
    public static let str29 = "<hy pynff=\"nqi\"><yv vq=\"YvOYG4\" fglyr=\"onpxtebhaq-vzntr:hey(uggc://vzt.jykef.pbz/~Yvir.FvgrPbagrag.VQ/~14.2.1230/~/~/~/oyg4.cat)\">Cbjreshy Zvpebfbsg grpuabybtl urycf svtug fcnz naq vzcebir frphevgl.##yv19##Trg zber qbar gunaxf gb terngre rnfr naq fcrrq.<yv vq=\"YvOYG16\" fglyr=\"onpxtebhaq-vzntr:hey(uggc://vzt.jykef.pbz/~Yvir.FvgrPbagrag.VQ/~14.2.1230/~/~/~/oyg16.cat)\">Ybgf bs fgbentr &#40;5 TO&#41; - zber pbby fghss ba gur jnl.##OE## ##OE## ##N##Yrnea zber##/N##</hy>"
    public static let str30 = "<hy pynff=\"nqi\"><yv vq=\"YvOYG4\" fglyr=\"onpxtebhaq-vzntr:hey(uggc://vzt.jykef.pbz/~Yvir.FvgrPbagrag.VQ/~14.2.1230/~/~/~/oyg4.cat)\">Cbjreshy Zvpebfbsg grpuabybtl urycf svtug fcnz naq vzcebir frphevgl.<yv vq=\"YvOYG19\" fglyr=\"onpxtebhaq-vzntr:hey(uggc://vzt.jykef.pbz/~Yvir.FvgrPbagrag.VQ/~14.2.1230/~/~/~/oyg19.cat)\">Trg zber qbar gunaxf gb terngre rnfr naq fcrrq.<yv vq=\"YvOYG16\" fglyr=\"onpxtebhaq-vzntr:hey(uggc://vzt.jykef.pbz/~Yvir.FvgrPbagrag.VQ/~14.2.1230/~/~/~/oyg16.cat)\">Ybgf bs fgbentr &#40;5 TO&#41; - zber pbby fghss ba gur jnl.##OE## ##OE## ##N##Yrnea zber##/N##</hy>"
    public static let str31 = "<hy pynff=\"nqi\"><yv vq=\"YvOYG4\" fglyr=\"onpxtebhaq-vzntr:hey(uggc://vzt.jykef.pbz/~Yvir.FvgrPbagrag.VQ/~14.2.1230/~/~/~/oyg4.cat)\">Cbjreshy Zvpebfbsg grpuabybtl urycf svtug fcnz naq vzcebir frphevgl.<yv vq=\"YvOYG19\" fglyr=\"onpxtebhaq-vzntr:hey(uggc://vzt.jykef.pbz/~Yvir.FvgrPbagrag.VQ/~14.2.1230/~/~/~/oyg19.cat)\">Trg zber qbar gunaxf gb terngre rnfr naq fcrrq.<yv vq=\"YvOYG16\" fglyr=\"onpxtebhaq-vzntr:hey(uggc://vzt.jykef.pbz/~Yvir.FvgrPbagrag.VQ/~14.2.1230/~/~/~/oyg16.cat)\">Ybgf bs fgbentr &#40;5 TO&#41; - zber pbby fghss ba gur jnl.<oe> <oe> ##N##Yrnea zber##/N##</hy>"
    public static let str32 = "<hy pynff=\"nqi\"><yv vq=\"YvOYG4\" fglyr=\"onpxtebhaq-vzntr:hey(uggc://vzt.jykef.pbz/~Yvir.FvgrPbagrag.VQ/~14.2.1230/~/~/~/oyg4.cat)\">Cbjreshy Zvpebfbsg grpuabybtl urycf svtug fcnz naq vzcebir frphevgl.<yv vq=\"YvOYG19\" fglyr=\"onpxtebhaq-vzntr:hey(uggc://vzt.jykef.pbz/~Yvir.FvgrPbagrag.VQ/~14.2.1230/~/~/~/oyg19.cat)\">Trg zber qbar gunaxf gb terngre rnfr naq fcrrq.<yv vq=\"YvOYG16\" fglyr=\"onpxtebhaq-vzntr:hey(uggc://vzt.jykef.pbz/~Yvir.FvgrPbagrag.VQ/~14.2.1230/~/~/~/oyg16.cat)\">Ybgf bs fgbentr &#40;5 TO&#41; - zber pbby fghss ba gur jnl.<oe> <oe> <n uers=\"uggc://znvy.yvir.pbz/znvy/nobhg.nfck\" gnetrg=\"_oynax\">Yrnea zber##/N##</hy>"
    public static let str33 = "Bar Jvaqbjf Yvir VQ trgf lbh vagb <o>Ubgznvy</o>, <o>Zrffratre</o>, <o>Kobk YVIR</o> \u{0020} naq bgure cynprf lbh frr #~#argjbexybtb#~#"
    public static let re60 = Regex("(?:^|\\s+)bss(?:\\s+|$)")
    public static let re61 = Regex("^(([^:\\/?#]+):)?(\\/\\/([^\\/?#]*))?([^?#]*)(\\?([^#]*))?(#(.*))?$")
    public static let re62 = Regex("^[^<]*(<(.|\\s)+>)[^>]*$|^#(\\w+)$")
    public static let str34 = "${1}://${2}${3}${4}${5}"
    public static let str35 = " O=6gnyg0g4znrrn&o=3&f=gc; Q=_lyu=K3bQZGSxnT4lZzD3OS9GNmV3ZGLkAQxRpTyxNmRlZmRmAmNkAQLRqTImqNZjOUEgpTjQnJ5xMKtgoN--; SCF=qy"

    let s83 = computeInvariants(str27, 11);
    let s84 = computeInvariants(str28, 11);
    let s85 = computeInvariants(str29, 11);
    let s86 = computeInvariants(str30, 11);
    let s87 = computeInvariants(str31, 11);
    let s88 = computeInvariants(str32, 11);
    let s89 = computeInvariants(str33, 11);
    let s90 = computeInvariants(str34, 11);

    func runBlock6(): Int64 {
      var sum = 0;
      for (i in 0..11) {
        sum += Regex("##yv0##/").matcher(s83[i]).replaceAll("").size
        sum += re57.matcher(s83[i]).replaceAll("").size
        sum += re58.matcher(s84[i]).replaceAll("").size
        sum += re59.matcher(s85[i]).replaceAll("").size
        sum += Regex("##\\/o##/").matcher(s86[i]).replaceAll("").size
        sum += Regex("##\\/v##/").matcher(s86[i]).replaceAll("").size
        sum += Regex("##\\/h##/").matcher(s86[i]).replaceAll("").size
        sum += Regex("##o##/").matcher(s86[i]).replaceAll("").size
        sum += Regex("##oe##/").matcher(s86[i]).replaceAll("").size
        sum += Regex("##v##/").matcher(s86[i]).replaceAll("").size
        sum += Regex("##h##/").matcher(s86[i]).replaceAll("").size
        sum += Regex("##n##/").matcher(s87[i]).replaceAll("").size
        sum += Regex("##\\/n##/").matcher(s88[i]).replaceAll("").size
        sum += Regex("#~#argjbexybtb#~#").matcher(s89[i]).replaceAll("").size
        sum += Exec(Regex("/ Zbovyr\\//"),s15[i])

        sum += Exec(Regex("##yv1##/"),s83[i])
        sum += Exec(Regex("##yv10##/"),s84[i])
        sum += Exec(Regex("##yv11##/"),s84[i])
        sum += Exec(Regex("##yv12##/"),s84[i])
        sum += Exec(Regex("##yv13##/"),s84[i])
        sum += Exec(Regex("##yv14##/"),s84[i])
        sum += Exec(Regex("##yv15##/"),s84[i])
        sum += Exec(re58,s84[i])
        sum += Exec(Regex("##yv17##/"),s85[i])
        sum += Exec(Regex("##yv18##/"),s85[i])
        sum += Exec(re59,s85[i])
        sum += Exec(Regex("##yv2##/"),s83[i])
        sum += Exec(Regex("##yv20##/"),s86[i])
        sum += Exec(Regex("##yv21##/"),s86[i])
        sum += Exec(Regex("##yv22##/"),s86[i])
        sum += Exec(Regex("##yv23##/"),s86[i])
        sum += Exec(Regex("##yv3##/"),s83[i])
        sum += Exec(re57,s83[i])
        sum += Exec(Regex("##yv5##/"),s84[i])
        sum += Exec(Regex("##yv6##/"),s84[i])
        sum += Exec(Regex("##yv7##/"),s84[i])
        sum += Exec(Regex("##yv8##/"),s84[i])
        sum += Exec(Regex("##yv9##/"),s84[i])
        sum += Exec(re8,"473qq1rs0n2r70q9qo1pq48n021s9468ron90nps048p4p29")
        sum += Exec(re8,"SbeprqRkcvengvba=633669325184628362")
        sum += Exec(re8,"FrffvbaQQS2=473qq1rs0n2r70q9qo1pq48n021s9468ron90nps048p4p29")
        sum += Exec(Regex("AbxvnA[^\\/]*"),s15[i])
      }
      for (i in 0..10) {
        sum += Regex("(?:^|\\s+)bss(?:\\s+|$)").matcher(" bss").replaceAll("").size
        sum += Regex("(\\$\\{0\\})|(\\$0\\b)").matcher(s90[i]).replaceAll("").size
        sum += Regex("(\\$\\{1\\})|(\\$1\\b)").matcher(s90[i]).replaceAll("").size
        sum += Regex("(\\$\\{pbzcyrgr\\})|(\\$pbzcyrgr\\b)").matcher(s90[i]).replaceAll("").size
        sum += Regex("(\\$\\{sentzrag\\})|(\\$sentzrag\\b)").matcher(s90[i]).replaceAll("").size
        sum += Regex("(\\$\\{ubfgcbeg\\})|(\\$ubfgcbeg\\b)").matcher(s90[i]).replaceAll("").size
        sum += re56.matcher(s90[i]).replaceAll("").size
        sum += Regex("(\\$\\{cebgbpby\\})|(\\$cebgbpby\\b)").matcher(s90[i]).replaceAll("").size
        sum += Regex("(\\$\\{dhrel\\})|(\\$dhrel\\b)").matcher(s90[i]).replaceAll("").size
        sum += re29.matcher("nqfvmr").replaceAll("").size
        sum += re30.matcher("nqfvmr").replaceAll("").size
        sum += Regex("(\\$\\{2\\})|(\\$2\\b)").matcher("uggc://${2}${3}${4}${5}").replaceAll("").size
        sum += Regex("(\\$\\{3\\})|(\\$3\\b)").matcher("uggc://wf.hv-cbegny.qr${3}${4}${5}").replaceAll("").size
        sum += re40.matcher("arjf").replaceAll("").size
        sum += re41.matcher("arjf").replaceAll("").size
        sum += re42.matcher("arjf").replaceAll("").size
        sum += re43.matcher("arjf").replaceAll("").size
        sum += re44.matcher("arjf").replaceAll("").size
        sum += re45.matcher("arjf").replaceAll("").size
        sum += re46.matcher("arjf").replaceAll("").size
        sum += re47.matcher("arjf").replaceAll("").size
        sum += re48.matcher("arjf").replaceAll("").size
        sum += Exec(Regex(" PC=i=(\\d+)&oe=(.)"),str35)
        sum += Exec(re60," ")
        sum += Exec(re60," bss")
        sum += Exec(re60,"")
        sum += Exec(re19," ")
        sum += Exec(re19,"svefg ba")
        sum += Exec(re19,"ynfg vtaber")
        sum += Exec(re19,"ba")
        sum += Exec(re9,"scnq so ")
        sum += Exec(re9,"zrqvgobk")
        sum += Exec(re9,"hsgy")
        sum += Exec(re9,"lhv-h")
        sum += Exec(Regex("Fnsnev|Xbadhrebe|XUGZY/"),s15[i])
        sum += Exec(re61,"uggc://wf.hv-cbegny.qr/tzk/ubzr/wf/20080602/onfr.wf")
        sum += Exec(re62,"#Ybtva_rznvy")
      }
      return sum;
    }

    public static let re63 = Regex("\\{0\\}")
    public static let str36 = "FrffvbaQQS2=4ss747o77904333q374or84qrr1s9r0nprp8r5q81534o94n; ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669321699093060&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R=; AFP_zp_tfwsbrg-aowb_80=4413268q3660"
    public static let str37 = "FrffvbaQQS2=4ss747o77904333q374or84qrr1s9r0nprp8r5q81534o94n; AFP_zp_tfwsbrg-aowb_80=4413268q3660; __hgzm=144631658.1231364074.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar); __hgzn=144631658.2294274870215848400.1231364074.1231364074.1231364074.1; __hgzo=144631658.0.10.1231364074; __hgzp=144631658; ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669321699093060&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str38 = "uggc://tbbtyrnqf.t.qbhoyrpyvpx.arg/cntrnq/nqf?pyvrag=pn-svz_zlfcnpr_zlfcnpr-ubzrcntr_wf&qg=1231364057761&uy=ra&nqfnsr=uvtu&br=hgs8&ahz_nqf=4&bhgchg=wf&nqgrfg=bss&pbeeryngbe=1231364057761&punaary=svz_zlfcnpr_ubzrcntr_abgybttrqva%2Psvz_zlfcnpr_aba_HTP%2Psvz_zlfcnpr_havgrq-fgngrf&hey=uggc%3N%2S%2Ssevraqf.zlfcnpr.pbz%2Svaqrk.psz&nq_glcr=grkg&rvq=6083027&rn=0&sez=0&tn_ivq=1667363813.1231364061&tn_fvq=1231364061&tn_uvq=1917563877&synfu=9.0.115&h_u=768&h_j=1024&h_nu=738&h_nj=1024&h_pq=24&h_gm=-480&h_uvf=2&h_wnin=gehr&h_acyht=7&h_azvzr=22"
    public static let str39 = "ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669321699093060&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str40 = "ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669321699093060&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R="

    let s91 = computeInvariants(str36, 9);
    let s92 = computeInvariants(str37, 9);
    let s93 = computeInvariants(str38, 9);

    func runBlock7(): Int64 {
      var sum = 0;
      for (_ in 0..9) {
        sum += re40.matcher("0").replaceAll("").size
        sum += re10.matcher("0").replaceAll("").size
        sum += re51.matcher("0").replaceAll("").size
        sum += re52.matcher("0").replaceAll("").size
        sum += re53.matcher("0").replaceAll("").size
        sum += re39.matcher("0").replaceAll("").size
        sum += re39.matcher("0").replaceAll("").size
        sum += re54.matcher("0").replaceAll("").size
        sum += re40.matcher("Lrf").replaceAll("").size
        sum += re10.matcher("Lrf").replaceAll("").size
        sum += re51.matcher("Lrf").replaceAll("").size
        sum += re52.matcher("Lrf").replaceAll("").size
        sum += re53.matcher("Lrf").replaceAll("").size
        sum += re39.matcher("Lrf").replaceAll("").size
        sum += re39.matcher("Lrf").replaceAll("").size
        sum += re54.matcher("Lrf").replaceAll("").size
      }
      for (i in 0..8) {
        sum += re63.matcher("Pybfr {0}").replaceAll("").size
        sum += re63.matcher("Bcra {0}").replaceAll("").size
        sum += s91[i].split(re32.string()).size
        sum += s92[i].split(re32.string()).size
        sum += re14.matcher("puvyq p1 svefg gnournqref").replaceAll("").size
        sum += re15.matcher("puvyq p1 svefg gnournqref").replaceAll("").size
        sum += re14.matcher("uqy_fcb").replaceAll("").size
        sum += re15.matcher("uqy_fcb").replaceAll("").size
        sum += re14.matcher("uvag").replaceAll("").size
        sum += re15.matcher("uvag").replaceAll("").size
        sum += re33.matcher(s93[i]).replaceAll("").size
        sum += re14.matcher("yvfg").replaceAll("").size
        sum += re15.matcher("yvfg").replaceAll("").size
        sum += re30.matcher("at_bhgre").replaceAll("").size
        sum += re14.matcher("cnerag puebzr5 qbhoyr2 NU").replaceAll("").size
        sum += re15.matcher("cnerag puebzr5 qbhoyr2 NU").replaceAll("").size
        sum += re14.matcher("cnerag puebzr5 dhnq5 ps NU osyvax zbarl").replaceAll("").size
        sum += re15.matcher("cnerag puebzr5 dhnq5 ps NU osyvax zbarl").replaceAll("").size
        sum += re14.matcher("cnerag puebzr6 fvatyr1").replaceAll("").size
        sum += re15.matcher("cnerag puebzr6 fvatyr1").replaceAll("").size
        sum += re14.matcher("cb_qrs").replaceAll("").size
        sum += re15.matcher("cb_qrs").replaceAll("").size
        sum += re14.matcher("gnopbagrag").replaceAll("").size
        sum += re15.matcher("gnopbagrag").replaceAll("").size
        sum += re30.matcher("iv_svefg_gvzr").replaceAll("").size
        sum += Exec(Regex("(^|.)(ronl|qri-ehf3.wbg)(fgberf|zbgbef|yvirnhpgvbaf|jvxv|rkcerff|punggre)?.(pbz(.nh|.pa|.ux|.zl|.ft|.oe|.zk)?|pb(.hx|.xe|.am)|pn|qr|se|vg|ay|or|ng|pu|vr|va|rf|cy|cu|fr)$/i"),"cntrf.ronl.pbz")
        sum += Exec(re8,"144631658.0.10.1231364074")
        sum += Exec(re8,"144631658.1231364074.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
        sum += Exec(re8,"144631658.2294274870215848400.1231364074.1231364074.1231364074.1")
        sum += Exec(re8,"4413241q3660")
        sum += Exec(re8,"SbeprqRkcvengvba=633669357391353591")
        sum += Exec(re8,str39)
        sum += Exec(re8,str40)
        sum += Exec(re8,"AFP_zp_kkk-gdzogv_80=4413241q3660")
        sum += Exec(re8,"FrffvbaQQS2=p98s8o9q42nr21or1r61pqorn1n002nsss569635984s6qp7")
        sum += Exec(re8,"__hgzn=144631658.2294274870215848400.1231364074.1231364074.1231364074.1")
        sum += Exec(re8,"__hgzo=144631658.0.10.1231364074")
        sum += Exec(re8,"__hgzm=144631658.1231364074.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
        sum += Exec(re8,"p98s8o9q42nr21or1r61pqorn1n002nsss569635984s6qp7")
        sum += Exec(re34,s91[i])
        sum += Exec(re34,s92[i])
      }
      return sum;
    }

    public static let re64 = Regex("\\b[a-z]")
    public static let re65 = Regex("/^uggc:\\/\\//")
    public static let re66 = Regex("(?:^|\\s+)qvfnoyrq(?:\\s+|$)")
    public static let str41 = "uggc://cebsvyr.zlfcnpr.pbz/Zbqhyrf/Nccyvpngvbaf/Cntrf/Pnainf.nfck"

    func runBlock8(): Int64 {
      var sum = 0;
      for (i in 0..7) {
        Regex("\\d+").matcher(s15[i]).fullMatch()
        sum += re64.matcher("nsgre").replaceAll("").size
        sum += re64.matcher("orsber").replaceAll("").size
        sum += re64.matcher("obggbz").replaceAll("").size
        sum += re65.matcher("ohvygva_jrngure.kzy").replaceAll("").size
        sum += re37.matcher("ohggba").replaceAll("").size
        sum += re18.matcher("ohggba").replaceAll("").size
        sum += re65.matcher("qngrgvzr.kzy").replaceAll("").size
        sum += re65.matcher("uggc://eff.paa.pbz/eff/paa_gbcfgbevrf.eff").replaceAll("").size
        sum += re37.matcher("vachg").replaceAll("").size
        sum += re18.matcher("vachg").replaceAll("").size
        sum += re64.matcher("vafvqr").replaceAll("").size
        sum += re27.matcher("cbvagre").replaceAll("").size
        sum += Regex("[A-Z]").matcher("cbfvgvba").replaceAll("").size
        sum += re27.matcher("gbc").replaceAll("").size
        sum += re64.matcher("gbc").replaceAll("").size
        sum += re37.matcher("hy").replaceAll("").size
        sum += re18.matcher("hy").replaceAll("").size
          sum += re37.matcher(str26).replaceAll("").size
          sum += re18.matcher(str26).replaceAll("").size
          sum += re65.matcher("lbhghor_vtbbtyr/i2/lbhghor.kzy").replaceAll("").size
        sum += re27.matcher("m-vaqrk").replaceAll("").size
        sum += Exec(Regex("#([\\w-]+)"),str26)
        sum += Exec(re16,"urvtug")
        sum += Exec(re16,"znetvaGbc")
        sum += Exec(re16,"jvqgu")
        sum += Exec(re19,"gno0 svefg ba")
        sum += Exec(re19,"gno0 ba")
        sum += Exec(re19,"gno4 ynfg")
        sum += Exec(re19,"gno4")
        sum += Exec(re19,"gno5")
        sum += Exec(re19,"gno6")
        sum += Exec(re19,"gno7")
        sum += Exec(re19,"gno8")
        sum += Exec(Regex("NqborNVE\\/([^\\s]*)"),s15[i])
        sum += Exec(Regex("NccyrJroXvg\\/([^ ]*)"),s15[i])
        sum += Exec(Regex("XUGZY/"),s15[i])
        sum += Exec(Regex("^(?:obql|ugzy)$/i"),"YV")
        sum += Exec(re38,"ohggba")
        sum += Exec(re38,"vachg")
        sum += Exec(re38,"hy")
        sum += Exec(re38,str26)
        sum += Exec(Regex("^(\\w+|\\*)"),str26)
        sum += Exec(Regex("znp|jva|yvahk/i"),"Jva32")
        sum += Exec(Regex("eton?\\([\\d\\s,]+\\)"),"fgngvp")
      }
      for (i in 0..6) {
        sum += Regex("\\r").matcher("").replaceAll("").size
        sum += re40.matcher("/").replaceAll("").size
        sum += re10.matcher("/").replaceAll("").size
        sum += re51.matcher("/").replaceAll("").size
        sum += re52.matcher("/").replaceAll("").size
        sum += re53.matcher("/").replaceAll("").size
        sum += re39.matcher("/").replaceAll("").size
        sum += re54.matcher("/").replaceAll("").size
        sum += re63.matcher("uggc://zfacbegny.112.2b7.arg/o/ff/zfacbegnyubzr/1/U.7-cqi-2/{0}?[NDO]&{1}&{2}&[NDR]").replaceAll("").size
        sum += re12.matcher(str41).replaceAll("").size
        sum += re23.matcher("uggc://jjj.snprobbx.pbz/fepu.cuc").replaceAll("").size
        sum += re40.matcher("freivpr").replaceAll("").size
        sum += re41.matcher("freivpr").replaceAll("").size
        sum += re42.matcher("freivpr").replaceAll("").size
        sum += re43.matcher("freivpr").replaceAll("").size
        sum += re44.matcher("freivpr").replaceAll("").size
        sum += re45.matcher("freivpr").replaceAll("").size
        sum += re46.matcher("freivpr").replaceAll("").size
        sum += re47.matcher("freivpr").replaceAll("").size
        sum += re48.matcher("freivpr").replaceAll("").size
        sum += Exec(Regex("((ZFVR\\s+([6-9]|\\d\\d)\\.))"),s15[i])
        sum += Exec(re66,"")
        sum += Exec(re50,"fryrpgrq")
        sum += Exec(re8,"8sqq78r9n442851q565599o401385sp3s04r92rnn7o19ssn")
        sum += Exec(re8,"SbeprqRkcvengvba=633669340386893867")
        sum += Exec(re8,"VC=")
        sum += Exec(re8,"FrffvbaQQS2=8sqq78r9n442851q565599o401385sp3s04r92rnn7o19ssn")
        sum += Exec(Regex("Xbadhrebe|Fnsnev|XUGZY"),s15[i])
        sum += Exec(re13,str41)
        sum += Exec(re49,"unfsbphf")
      }
      return sum;
    }

    public static let re67 = Regex("zrah_byq")
    public static let str42 = "FrffvbaQQS2=473qq1rs0n2r70q9qo1pq48n021s9468ron90nps048p4p29; ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669325184628362&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R="
    public static let str43 = "FrffvbaQQS2=473qq1rs0n2r70q9qo1pq48n021s9468ron90nps048p4p29; __hgzm=144631658.1231364380.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar); __hgzn=144631658.3931862196947939300.1231364380.1231364380.1231364380.1; __hgzo=144631658.0.10.1231364380; __hgzp=144631658; ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669325184628362&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str44 = "uggc://tbbtyrnqf.t.qbhoyrpyvpx.arg/cntrnq/nqf?pyvrag=pn-svz_zlfcnpr_vzntrf_wf&qg=1231364373088&uy=ra&nqfnsr=uvtu&br=hgs8&ahz_nqf=4&bhgchg=wf&nqgrfg=bss&pbeeryngbe=1231364373088&punaary=svz_zlfcnpr_hfre-ivrj-pbzzragf%2Psvz_zlfcnpr_havgrq-fgngrf&hey=uggc%3N%2S%2Spbzzrag.zlfcnpr.pbz%2Svaqrk.psz&nq_glcr=grkg&rvq=6083027&rn=0&sez=0&tn_ivq=1158737789.1231364375&tn_fvq=1231364375&tn_uvq=415520832&synfu=9.0.115&h_u=768&h_j=1024&h_nu=738&h_nj=1024&h_pq=24&h_gm=-480&h_uvf=2&h_wnin=gehr&h_acyht=7&h_azvzr=22"
    public static let str45 = "ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669325184628362&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str46 = "ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669325184628362&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R="
    public static let re68 = Regex("^([#.]?)((?:[\\w\u{0128}-\u{ffff}*_-]|\\.)*)", Unicode)
    public static let re69 = Regex("\\{1\\}")
    public static let re70 = Regex("\\s+")
    public static let re71 = Regex("(\\$\\{4\\})|(\\$4\\b)")
    public static let re72 = Regex("(\\$\\{5\\})|(\\$5\\b)")
    public static let re73 = Regex("\\{2\\}")
    public static let re74 = Regex("[^+>] [^+>]")
    public static let re75 = Regex("\\bucpyv\\s*=\\s*([^;]*)/i")
    public static let re76 = Regex("\\bucuvqr\\s*=\\s*([^;]*)/i")
    public static let re77 = Regex("\\bucfie\\s*=\\s*([^;]*)/i")
    public static let re78 = Regex("\\bhfucjrn\\s*=\\s*([^;]*)/i")
    public static let re79 = Regex("\\bmvc\\s*=\\s*([^;]*)/i")
    public static let re80 = Regex("^((?:[\\w\u{0128}-\u{ffff}*_-]|\\.)+)(#)((?:[\\w\u{0128}-\u{ffff}*_-]|\\.)+)", Unicode)
    public static let re81 = Regex("^([>+~])\\s*(\\w*)/i")
    public static let re82 = Regex("^>\\s*((?:[\\w\u{0128}-\u{ffff}*_-]|\\.)+)", Unicode)
    public static let re83 = Regex("^[\\s]?shapgvba")
    public static let re84 = Regex("v\\/g.tvs#(.*)/i")
    public static let str47 = "#Zbq-Vasb-Vasb-WninFpevcgUvag"
    public static let str48 = ",n.svryqOgaPnapry"
    public static let str49 = "FrffvbaQQS2=p98s8o9q42nr21or1r61pqorn1n002nsss569635984s6qp7; ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669357391353591&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R=; AFP_zp_kkk-gdzogv_80=4413241q3660"
    public static let str50 = "FrffvbaQQS2=p98s8o9q42nr21or1r61pqorn1n002nsss569635984s6qp7; AFP_zp_kkk-gdzogv_80=4413241q3660; AFP_zp_kkk-aowb_80=4413235p3660; __hgzm=144631658.1231367708.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar); __hgzn=144631658.2770915348920628700.1231367708.1231367708.1231367708.1; __hgzo=144631658.0.10.1231367708; __hgzp=144631658; ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669357391353591&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str51 = "uggc://tbbtyrnqf.t.qbhoyrpyvpx.arg/cntrnq/nqf?pyvrag=pn-svz_zlfcnpr_zlfcnpr-ubzrcntr_wf&qg=1231367691141&uy=ra&nqfnsr=uvtu&br=hgs8&ahz_nqf=4&bhgchg=wf&nqgrfg=bss&pbeeryngbe=1231367691141&punaary=svz_zlfcnpr_ubzrcntr_abgybttrqva%2Psvz_zlfcnpr_aba_HTP%2Psvz_zlfcnpr_havgrq-fgngrf&hey=uggc%3N%2S%2Sjjj.zlfcnpr.pbz%2S&nq_glcr=grkg&rvq=6083027&rn=0&sez=0&tn_ivq=320757904.1231367694&tn_fvq=1231367694&tn_uvq=1758792003&synfu=9.0.115&h_u=768&h_j=1024&h_nu=738&h_nj=1024&h_pq=24&h_gm=-480&h_uvf=2&h_wnin=gehr&h_acyht=7&h_azvzr=22"
    public static let str52 = "uggc://zfacbegny.112.2b7.arg/o/ff/zfacbegnyubzr/1/U.7-cqi-2/f55332979829981?[NDO]&aqu=1&g=7%2S0%2S2009%2014%3N38%3N42%203%20480&af=zfacbegny&cntrAnzr=HF%20UCZFSGJ&t=uggc%3N%2S%2Sjjj.zfa.pbz%2S&f=1024k768&p=24&x=L&oj=994&ou=634&uc=A&{2}&[NDR]"
    public static let str53 = "cnerag puebzr6 fvatyr1 gno fryrpgrq ovaq qbhoyr2 ps"
    public static let str54 = "ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669357391353591&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str55 = "ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669357391353591&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R="
    public static let str56 = "ne;ng;nh;or;oe;pn;pu;py;pa;qr;qx;rf;sv;se;to;ux;vq;vr;va;vg;wc;xe;zk;zl;ay;ab;am;cu;cy;cg;eh;fr;ft;gu;ge;gj;mn;"
    public static let str57 = "ZP1=I=3&THVQ=6nnpr9q661804s33nnop45nosqp17q85; zu=ZFSG; PHYGHER=RA-HF; SyvtugTebhcVq=97; SyvtugVq=OnfrCntr; ucfie=Z:5|S:5|G:5|R:5|Q:oyh|J:S; ucpyv=J.U|Y.|F.|E.|H.Y|P.|U.; hfucjrn=jp:HFPN0746; ZHVQ=Q783SN9O14054831N4869R51P0SO8886&GHVQ=1"
    public static let str58 = "ZP1=I=3&THVQ=6nnpr9q661804s33nnop45nosqp17q85; zu=ZFSG; PHYGHER=RA-HF; SyvtugTebhcVq=97; SyvtugVq=OnfrCntr; ucfie=Z:5|S:5|G:5|R:5|Q:oyh|J:S; ucpyv=J.U|Y.|F.|E.|H.Y|P.|U.; hfucjrn=jp:HFPN0746; ZHVQ=Q783SN9O14054831N4869R51P0SO8886"
    public static let str59 = "ZP1=I=3&THVQ=6nnpr9q661804s33nnop45nosqp17q85; zu=ZFSG; PHYGHER=RA-HF; SyvtugTebhcVq=97; SyvtugVq=OnfrCntr; ucfie=Z:5|S:5|G:5|R:5|Q:oyh|J:S; ucpyv=J.U|Y.|F.|E.|H.Y|P.|U.; hfucjrn=jp:HFPN0746; ZHVQ=Q783SN9O14054831N4869R51P0SO8886; mvc=m:94043|yn:37.4154|yb:-122.0585|p:HF|ue:1"
    public static let str60 = "ZP1=I=3&THVQ=6nnpr9q661804s33nnop45nosqp17q85; zu=ZFSG; PHYGHER=RA-HF; SyvtugTebhcVq=97; SyvtugVq=OnfrCntr; ucfie=Z:5|S:5|G:5|R:5|Q:oyh|J:S; ucpyv=J.U|Y.|F.|E.|H.Y|P.|U.; hfucjrn=jp:HFPN0746; ZHVQ=Q783SN9O14054831N4869R51P0SO8886; mvc=m:94043|yn:37.4154|yb:-122.0585|p:HF"
    public static let str61 = "uggc://gx2.fgp.f-zfa.pbz/oe/uc/11/ra-hf/pff/v/g.tvs#uggc://gx2.fgo.f-zfa.pbz/v/29/4RQP4969777N048NPS4RRR3PO2S7S.wct"
    public static let str62 = "uggc://gx2.fgp.f-zfa.pbz/oe/uc/11/ra-hf/pff/v/g.tvs#uggc://gx2.fgo.f-zfa.pbz/v/OQ/63NP9O94NS5OQP1249Q9S1ROP7NS3.wct"
    public static let str63 = "zbmvyyn/5.0 (jvaqbjf; h; jvaqbjf ag 5.1; ra-hf) nccyrjroxvg/528.9 (xugzy, yvxr trpxb) puebzr/ fnsnev/528.9"

    let s94 = computeInvariants(str42, 5);
    let s95 = computeInvariants(str43, 5);
    let s96 = computeInvariants(str44, 5);
    let s97 = computeInvariants(str47, 5);
    let s98 = computeInvariants(str48, 5);
    let s99 = computeInvariants(str49, 5);
    let s100 = computeInvariants(str50, 5);
    let s101 = computeInvariants(str51, 5);
    let s102 = computeInvariants(str52, 5);
    let s103 = computeInvariants(str53, 5);

    func runBlock9(): Int64 {
      var sum = 0;
      for (i in 0..5) {
        sum += s94[i].split(re32.string()).size;
        sum += s95[i].split(re32.string()).size;
        
        sum += "svz_zlfcnpr_hfre-ivrj-pbzzragf,svz_zlfcnpr_havgrq-fgngrf".split(re20.string()).size;
        sum += re33.matcher(s96[i]).replaceAll("").size
        sum += re67.matcher("zrah_arj zrah_arj_gbttyr zrah_gbttyr").replaceAll("").size
        sum += re67.matcher("zrah_byq zrah_byq_gbttyr zrah_gbttyr").replaceAll("").size
        sum += Exec(re8,"102n9o0o9pq60132qn0337rr867p75953502q2s27s2s5r98")
        sum += Exec(re8,"144631658.0.10.1231364380")
        sum += Exec(re8,"144631658.1231364380.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
        sum += Exec(re8,"144631658.3931862196947939300.1231364380.1231364380.1231364380.1")
        sum += Exec(re8,"441326q33660")
        sum += Exec(re8,"SbeprqRkcvengvba=633669341278771470")
        sum += Exec(re8,str45)
        sum += Exec(re8,str46)
        sum += Exec(re8,"AFP_zp_dfctwzssrwh-aowb_80=441326q33660")
        sum += Exec(re8,"FrffvbaQQS2=102n9o0o9pq60132qn0337rr867p75953502q2s27s2s5r98")
        sum += Exec(re8,"__hgzn=144631658.3931862196947939300.1231364380.1231364380.1231364380.1")
        sum += Exec(re8,"__hgzo=144631658.0.10.1231364380")
        sum += Exec(re8,"__hgzm=144631658.1231364380.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
      }
      for (i in 0..4) {
        sum += re14.matcher(" yvfg1").replaceAll("").size
        sum += re15.matcher(" yvfg1").replaceAll("").size
        sum += re14.matcher(" yvfg2").replaceAll("").size
        sum += re15.matcher(" yvfg2").replaceAll("").size
        sum += re14.matcher(" frneputebhc1").replaceAll("").size
        sum += re15.matcher(" frneputebhc1").replaceAll("").size
        sum += re68.matcher(s97[i]).replaceAll("").size
        sum += re18.matcher(s97[i]).replaceAll("").size
        sum += Regex("&").matcher("").replaceAll("").size
        sum += re35.matcher("").replaceAll("").size
        sum += re63.matcher("(..-{0})(\\|(\\d+)|)").replaceAll("").size //
        sum += re18.matcher(s98[i]).replaceAll("").size
        sum += re56.matcher(##"//vzt.jro.qr/vij/FC/${cngu}/${anzr}/${inyhr}?gf=${abj}"##).replaceAll("").size
        sum += Regex("(\\$\\{anzr\\})|(\\$anzr\\b)").matcher(##"//vzt.jro.qr/vij/FC/tzk_uc/${anzr}/${inyhr}?gf=${abj}"##).replaceAll("").size
        sum += re69.matcher("<fcna pynff=\"urnq\"><o>Jvaqbjf Yvir Ubgznvy</o></fcna><fcna pynff=\"zft\">{1}</fcna>").replaceAll("").size
        sum += re63.matcher("<fcna pynff=\"urnq\"><o>{0}</o></fcna><fcna pynff=\"zft\">{1}</fcna>").replaceAll("").size
        sum += re69.matcher("<fcna pynff=\"fvtahc\"><n uers=uggc://jjj.ubgznvy.pbz><o>{1}</o></n></fcna>").replaceAll("").size
        sum += re63.matcher("<fcna pynff=\"fvtahc\"><n uers={0}><o>{1}</o></n></fcna>").replaceAll("").size
        sum += re15.matcher("Vzntrf").replaceAll("").size
        sum += re15.matcher("ZFA").replaceAll("").size
        sum += re15.matcher("Zncf").replaceAll("").size
        sum += re39.matcher("Zbq-Vasb-Vasb-WninFpevcgUvag").replaceAll("").size
        sum += re15.matcher("Arjf").replaceAll("").size
        sum += s99[i].split(re32.string()).size
        sum += s100[i].split(re32.string()).size
        sum += re15.matcher("Ivqrb").replaceAll("").size
        sum += re15.matcher("Jro").replaceAll("").size
        sum += re39.matcher("n").replaceAll("").size
        sum += "nwnkFgneg".split(re70.string()).size
        sum += "nwnkFgbc".split(re70.string()).size
        sum += re14.matcher("ovaq").replaceAll("").size
        sum += re15.matcher("ovaq").replaceAll("").size
        sum += re63.matcher("oevatf lbh zber. Zber fcnpr (5TO),zber frphevgl,fgvyy serr.").replaceAll("").size
        sum += re14.matcher("puvyq p1 svefg qrpx").replaceAll("").size
        sum += re15.matcher("puvyq p1 svefg qrpx").replaceAll("").size
        sum += re14.matcher("puvyq p1 svefg qbhoyr2").replaceAll("").size
        sum += re15.matcher("puvyq p1 svefg qbhoyr2").replaceAll("").size
        sum += re14.matcher("puvyq p2 ynfg").replaceAll("").size
        sum += re15.matcher("puvyq p2 ynfg").replaceAll("").size
        sum += re14.matcher("puvyq p2").replaceAll("").size
        sum += re15.matcher("puvyq p2").replaceAll("").size
        sum += re14.matcher("puvyq p3").replaceAll("").size
        sum += re15.matcher("puvyq p3").replaceAll("").size
        sum += re14.matcher("puvyq p4 ynfg").replaceAll("").size
        sum += re15.matcher("puvyq p4 ynfg").replaceAll("").size
        sum += re14.matcher("pbclevtug").replaceAll("").size
        sum += re15.matcher("pbclevtug").replaceAll("").size
        sum += re14.matcher("qZFAZR_1").replaceAll("").size
        sum += re15.matcher("qZFAZR_1").replaceAll("").size
        sum += re14.matcher("qbhoyr2 ps").replaceAll("").size
        sum += re15.matcher("qbhoyr2 ps").replaceAll("").size
        sum += re14.matcher("qbhoyr2").replaceAll("").size
        sum += re15.matcher("qbhoyr2").replaceAll("").size
        sum += re14.matcher("uqy_arj").replaceAll("").size
        sum += re15.matcher("uqy_arj").replaceAll("").size
        sum += re30.matcher("uc_fubccvatobk").replaceAll("").size
        sum += re29.matcher("ugzy%2Rvq").replaceAll("").size
        sum += re30.matcher("ugzy%2Rvq").replaceAll("").size
        sum += re33.matcher(s101[i]).replaceAll("").size
        sum += re71.matcher("uggc://wf.hv-cbegny.qr/tzk/ubzr/wf/20080602/cebgbglcr.wf${4}${5}").replaceAll("").size
        sum += re72.matcher("uggc://wf.hv-cbegny.qr/tzk/ubzr/wf/20080602/cebgbglcr.wf${5}").replaceAll("").size
        sum += re73.matcher(s102[i]).replaceAll("").size
        sum += re69.matcher("uggc://zfacbegny.112.2b7.arg/o/ff/zfacbegnyubzr/1/U.7-cqi-2/f55332979829981?[NDO]&{1}&{2}&[NDR]").replaceAll("").size
        sum += re14.matcher("vztZFSG").replaceAll("").size
        sum += re15.matcher("vztZFSG").replaceAll("").size
        sum += re14.matcher("zfasbbg1 ps").replaceAll("").size
        sum += re15.matcher("zfasbbg1 ps").replaceAll("").size
        sum += re14.matcher(s103[i]).replaceAll("").size
        sum += re15.matcher(s103[i]).replaceAll("").size
        sum += re14.matcher("cnerag puebzr6 fvatyr1 gno fryrpgrq ovaq").replaceAll("").size
        sum += re15.matcher("cnerag puebzr6 fvatyr1 gno fryrpgrq ovaq").replaceAll("").size
        sum += re14.matcher("cevznel").replaceAll("").size
        sum += re15.matcher("cevznel").replaceAll("").size
        sum += re30.matcher("erpgnatyr").replaceAll("").size
        sum += re14.matcher("frpbaqnel").replaceAll("").size
        sum += re15.matcher("frpbaqnel").replaceAll("").size
        sum += "haybnq".split(re70.string()).size;
        sum += re63.matcher("{0}{1}1").replaceAll("").size
        sum += re69.matcher("|{1}1").replaceAll("").size

        sum += Exec(Regex("(..-HF)(\\|(\\d+))?/i"),"xb-xe,ra-va,gu-gu")
        sum += Exec(re4,"/ZlFcnprNccf/NccPnainf,45000012")
        sum += Exec(re8,"144631658.0.10.1231367708")
        sum += Exec(re8,"144631658.1231367708.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
        sum += Exec(re8,"144631658.2770915348920628700.1231367708.1231367708.1231367708.1")
        sum += Exec(re8,"4413235p3660")
        sum += Exec(re8,"441327q73660")
        sum += Exec(re8,"9995p6rp12rrnr893334ro7nq70o7p64p69rqn844prs1473")
        sum += Exec(re8,"SbeprqRkcvengvba=633669350559478880")
        sum += Exec(re8,str54)
        sum += Exec(re8,str55)
        sum += Exec(re8,"AFP_zp_dfctwzs-aowb_80=441327q73660")
        sum += Exec(re8,"AFP_zp_kkk-aowb_80=4413235p3660")
        sum += Exec(re8,"FrffvbaQQS2=9995p6rp12rrnr893334ro7nq70o7p64p69rqn844prs1473")
        sum += Exec(re8,"__hgzn=144631658.2770915348920628700.1231367708.1231367708.1231367708.1")
        sum += Exec(re8,"__hgzo=144631658.0.10.1231367708")
        sum += Exec(re8,"__hgzm=144631658.1231367708.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
        sum += Exec(re34,s99[i])
        sum += Exec(re34,s100[i])
        sum += Exec(Regex("ZFVR\\s+5[.]01"),s15[i])
        sum += Exec(Regex("HF(?=;)/i"),str56)
        sum += Exec(re74,s97[i])
        sum += Exec(re28,"svefg npgvir svefgNpgvir")
        sum += Exec(re28,"ynfg")
        sum += Exec(Regex("\\bp:(..)/i"),"m:94043|yn:37.4154|yb:-122.0585|p:HF")
        sum += Exec(re75,str57)
        sum += Exec(re75,str58)
        sum += Exec(re76,str57)
        sum += Exec(re76,str58)
        sum += Exec(re77,str57)
        sum += Exec(re77,str58)
        sum += Exec(Regex("\\bhfucce\\s*=\\s*([^;]*)/i"),str59)
        sum += Exec(re78,str57)
        sum += Exec(re78,str58)
        sum += Exec(Regex("\\bjci\\s*=\\s*([^;]*)/i"),str59)
        sum += Exec(re79,str58)
        sum += Exec(re79,str60)
        sum += Exec(re79,str59)
        sum += Exec(Regex("\\|p:([a-z]{2})/i"),"\"m:94043|yn:37.4154|yb:-122.0585|p:HF|ue:1")
        sum += Exec(re80,s97[i])
        sum += Exec(re61,"cebgbglcr.wf")
        sum += Exec(re68,s97[i])
        sum += Exec(re81,s97[i])
        sum += Exec(re82,s97[i])
        sum += Exec(Regex("^Fubpxjnir Synfu (\\d)"),s21[i])
        sum += Exec(Regex("^Fubpxjnir Synfu (\\d+)"),s21[i])
        sum += Exec(re83,"[bowrpg tybony]")
        sum += Exec(re62,s97[i])
        sum += Exec(re84,str61)
        sum += Exec(re84,str62)
        sum += Exec(Regex("jroxvg"),str63)
      }
      return sum;
    }

    public static let re85 = Regex("eaq_zbqobkva")
    public static let str64 = "1231365729213"
    public static let str65 = "-1057165600.29978900"
    public static let str66 = "-1057165600.29978900.1231365730214"
    public static let str67 = "Frnepu%20Zvpebfbsg.pbz"
    public static let str68 = "FrffvbaQQS2=8sqq78r9n442851q565599o401385sp3s04r92rnn7o19ssn; ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669340386893867&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R="
    public static let str69 = "FrffvbaQQS2=8sqq78r9n442851q565599o401385sp3s04r92rnn7o19ssn; __hgzm=144631658.1231365779.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar); __hgzn=144631658.1877536177953918500.1231365779.1231365779.1231365779.1; __hgzo=144631658.0.10.1231365779; __hgzp=144631658; ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669340386893867&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str70 = "I=3%26THVQ=757q3ss871q44o7o805n8113n5p72q52"
    public static let str71 = "I=3&THVQ=757q3ss871q44o7o805n8113n5p72q52"
    public static let str72 = "uggc://tbbtyrnqf.t.qbhoyrpyvpx.arg/cntrnq/nqf?pyvrag=pn-svz_zlfcnpr_zlfcnpr-ubzrcntr_wf&qg=1231365765292&uy=ra&nqfnsr=uvtu&br=hgs8&ahz_nqf=4&bhgchg=wf&nqgrfg=bss&pbeeryngbe=1231365765292&punaary=svz_zlfcnpr_ubzrcntr_abgybttrqva%2Psvz_zlfcnpr_aba_HTP%2Psvz_zlfcnpr_havgrq-fgngrf&hey=uggc%3N%2S%2Sohyyrgvaf.zlfcnpr.pbz%2Svaqrk.psz&nq_glcr=grkg&rvq=6083027&rn=0&sez=0&tn_ivq=1579793869.1231365768&tn_fvq=1231365768&tn_uvq=2056210897&synfu=9.0.115&h_u=768&h_j=1024&h_nu=738&h_nj=1024&h_pq=24&h_gm=-480&h_uvf=2&h_wnin=gehr&h_acyht=7&h_azvzr=22"
    public static let str73 = "frnepu.zvpebfbsg.pbz"
    public static let str74 = "frnepu.zvpebfbsg.pbz/"
    public static let str75 = "ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669340386893867&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str76 = "ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669340386893867&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R="

    func runBlock10(): Int64 {
      var sum = 0;
      for (_ in 0..3) {
        sum += re39.matcher("%3Szxg=ra-HF").replaceAll("").size
        sum += re40.matcher("-8").replaceAll("").size
        sum += re10.matcher("-8").replaceAll("").size
        sum += re51.matcher("-8").replaceAll("").size
        sum += re52.matcher("-8").replaceAll("").size
        sum += re53.matcher("-8").replaceAll("").size
        sum += re39.matcher("-8").replaceAll("").size
        sum += re54.matcher("-8").replaceAll("").size
        sum += re40.matcher("1.5").replaceAll("").size
        sum += re10.matcher("1.5").replaceAll("").size
        sum += re51.matcher("1.5").replaceAll("").size
        sum += re52.matcher("1.5").replaceAll("").size
        sum += re53.matcher("1.5").replaceAll("").size
        sum += re39.matcher("1.5").replaceAll("").size
        sum += re54.matcher("1.5").replaceAll("").size
        sum += re40.matcher("1024k768").replaceAll("").size
        sum += re10.matcher("1024k768").replaceAll("").size
        sum += re51.matcher("1024k768").replaceAll("").size
        sum += re52.matcher("1024k768").replaceAll("").size
        sum += re53.matcher("1024k768").replaceAll("").size
        sum += re39.matcher("1024k768").replaceAll("").size
        sum += re54.matcher("1024k768").replaceAll("").size
        sum += re40.matcher(str64).replaceAll("").size
        sum += re10.matcher(str64).replaceAll("").size
        sum += re51.matcher(str64).replaceAll("").size
        sum += re52.matcher(str64).replaceAll("").size
        sum += re53.matcher(str64).replaceAll("").size
        sum += re39.matcher(str64).replaceAll("").size
        sum += re54.matcher(str64).replaceAll("").size
        sum += re40.matcher("14").replaceAll("").size
        sum += re10.matcher("14").replaceAll("").size
        sum += re51.matcher("14").replaceAll("").size
        sum += re52.matcher("14").replaceAll("").size
        sum += re53.matcher("14").replaceAll("").size
        sum += re39.matcher("14").replaceAll("").size
        sum += re54.matcher("14").replaceAll("").size
        sum += re40.matcher("24").replaceAll("").size
        sum += re10.matcher("24").replaceAll("").size
        sum += re51.matcher("24").replaceAll("").size
        sum += re52.matcher("24").replaceAll("").size
        sum += re53.matcher("24").replaceAll("").size
        sum += re39.matcher("24").replaceAll("").size
        sum += re54.matcher("24").replaceAll("").size
        sum += re40.matcher(str65).replaceAll("").size
        sum += re10.matcher(str65).replaceAll("").size
        sum += re51.matcher(str65).replaceAll("").size
        sum += re52.matcher(str65).replaceAll("").size
        sum += re53.matcher(str65).replaceAll("").size
        sum += re39.matcher(str65).replaceAll("").size
        sum += re54.matcher(str65).replaceAll("").size
        sum += re40.matcher(str66).replaceAll("").size
        sum += re10.matcher(str66).replaceAll("").size
        sum += re51.matcher(str66).replaceAll("").size
        sum += re52.matcher(str66).replaceAll("").size
        sum += re53.matcher(str66).replaceAll("").size
        sum += re39.matcher(str66).replaceAll("").size
        sum += re54.matcher(str66).replaceAll("").size
        sum += re40.matcher("9.0").replaceAll("").size
        sum += re10.matcher("9.0").replaceAll("").size
        sum += re51.matcher("9.0").replaceAll("").size
        sum += re52.matcher("9.0").replaceAll("").size
        sum += re53.matcher("9.0").replaceAll("").size
        sum += re39.matcher("9.0").replaceAll("").size
        sum += re54.matcher("9.0").replaceAll("").size
        sum += re40.matcher("994k634").replaceAll("").size
        sum += re10.matcher("994k634").replaceAll("").size
        sum += re51.matcher("994k634").replaceAll("").size
        sum += re52.matcher("994k634").replaceAll("").size
        sum += re53.matcher("994k634").replaceAll("").size
        sum += re39.matcher("994k634").replaceAll("").size
        sum += re54.matcher("994k634").replaceAll("").size
        sum += re40.matcher("?zxg=ra-HF").replaceAll("").size
        sum += re10.matcher("?zxg=ra-HF").replaceAll("").size
        sum += re51.matcher("?zxg=ra-HF").replaceAll("").size
        sum += re52.matcher("?zxg=ra-HF").replaceAll("").size
        sum += re53.matcher("?zxg=ra-HF").replaceAll("").size
        sum += re54.matcher("?zxg=ra-HF").replaceAll("").size
        sum += re25.matcher("PAA.pbz").replaceAll("").size
        sum += re12.matcher("PAA.pbz").replaceAll("").size
        sum += re39.matcher("PAA.pbz").replaceAll("").size
        sum += re25.matcher("Qngr & Gvzr").replaceAll("").size
        sum += re12.matcher("Qngr & Gvzr").replaceAll("").size
        sum += re39.matcher("Qngr & Gvzr").replaceAll("").size
        sum += re40.matcher("Frnepu Zvpebfbsg.pbz").replaceAll("").size
        sum += re54.matcher("Frnepu Zvpebfbsg.pbz").replaceAll("").size
        sum += re10.matcher(str67).replaceAll("").size
        sum += re51.matcher(str67).replaceAll("").size
        sum += re52.matcher(str67).replaceAll("").size
        sum += re53.matcher(str67).replaceAll("").size
        sum += re39.matcher(str67).replaceAll("").size
        sum += str68.split(re32.string()).size
        sum += str69.split(re32.string()).size
        sum += re52.matcher(str70).replaceAll("").size
        sum += re53.matcher(str70).replaceAll("").size
        sum += re39.matcher(str70).replaceAll("").size
        sum += re40.matcher(str71).replaceAll("").size
        sum += re10.matcher(str71).replaceAll("").size
        sum += re51.matcher(str71).replaceAll("").size
        sum += re54.matcher(str71).replaceAll("").size
        sum += re25.matcher("Jrngure").replaceAll("").size
        sum += re12.matcher("Jrngure").replaceAll("").size
        sum += re39.matcher("Jrngure").replaceAll("").size
        sum += re25.matcher("LbhGhor").replaceAll("").size
        sum += re12.matcher("LbhGhor").replaceAll("").size
        sum += re39.matcher("LbhGhor").replaceAll("").size
        sum += re33.matcher(str72).replaceAll("").size
        sum += Regex("^erzbgr_vsenzr_").matcher("erzbgr_vsenzr_1").replaceAll("").size
        sum += re40.matcher(str73).replaceAll("").size
        sum += re10.matcher(str73).replaceAll("").size
        sum += re51.matcher(str73).replaceAll("").size
        sum += re52.matcher(str73).replaceAll("").size
        sum += re53.matcher(str73).replaceAll("").size
        sum += re39.matcher(str73).replaceAll("").size
        sum += re54.matcher(str73).replaceAll("").size
        sum += re40.matcher(str74).replaceAll("").size
        sum += re10.matcher(str74).replaceAll("").size
        sum += re51.matcher(str74).replaceAll("").size
        sum += re52.matcher(str74).replaceAll("").size
        sum += re53.matcher(str74).replaceAll("").size
        sum += re39.matcher(str74).replaceAll("").size
        sum += re54.matcher(str74).replaceAll("").size
        sum += Regex("\\-").matcher("lhv-h").replaceAll("").size
        sum += Exec(re9,"p")
        sum += Exec(re9,"qz p")
        sum += Exec(re9,"zbqynory")
        sum += Exec(re9,"lhv-h svefg")
        sum += Exec(re8,"144631658.0.10.1231365779")
        sum += Exec(re8,"144631658.1231365779.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
        sum += Exec(re8,"144631658.1877536177953918500.1231365779.1231365779.1231365779.1")
        sum += Exec(re8,str75)
        sum += Exec(re8,str76)
        sum += Exec(re8,"__hgzn=144631658.1877536177953918500.1231365779.1231365779.1231365779.1")
        sum += Exec(re8,"__hgzo=144631658.0.10.1231365779")
        sum += Exec(re8,"__hgzm=144631658.1231365779.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
        sum += Exec(re34,str68)
        sum += Exec(re34,str69)
        sum += Exec(Regex("^$"),"")
        sum += Exec(re31,"qr")
        sum += Exec(Regex("^znk\\d+$"),"")
        sum += Exec(Regex("^zva\\d+$"),"")
        sum += Exec(Regex("^erfgber$"),"")
        sum += Exec(re85,"zbqobkva zbqobk_abcnqqvat ")
        sum += Exec(re85,"zbqgvgyr")
        sum += Exec(re85,"eaq_zbqobkva ")
        sum += Exec(re85,"eaq_zbqgvgyr ")
        sum += Exec(Regex("frpgvba\\d+_pbagragf"),"obggbz_ani")
      }
      return sum;
    }

    public static let re86 = Regex("\"\\s*")
    public static let re87 = Regex("(\\$\\{inyhr\\})|(\\$inyhr\\b)")
    public static let re88 = Regex("(\\$\\{abj\\})|(\\$abj\\b)")
    public static let re89 = Regex("\\s+$")
    public static let re90 = Regex("^\\s+")
    public static let re91 = Regex("(\\\"|\\x00-|\\x1f|\\x7f-|\\x9f|\u{00ad}|\u{0600}-|\u{0604}|\u{070f}|\u{17b4}|\u{17b5}|\u{200c}-|\u{200f}|\u{2028}-|\u{202f}|\u{2060}-|\u{206f}|\u{feff}|\u{fff0}-|\u{ffff})", Unicode)
    public static let re92 = Regex("^(:)([\\w-]+)\\(\"?'?((.*)?(\\((.*)?\\))?([^(]*)?)\"?'?\\)")
    public static let re93 = Regex("^([:.#]*)((?:[\\w\u{0128}-\u{ffff}*_-]|\\.)+)", Unicode)
    public static let re94 = Regex("^(\\[) *@?([\\w-]+) *([!*$^~=]*) *('?\"?)((.*)?)\\4 *\\]")
    public static let re95 = Regex("\\b\\w+\\b")
    public static let str77 = "#fubhgobk .pybfr"
    public static let str78 = "FrffvbaQQS2=102n9o0o9pq60132qn0337rr867p75953502q2s27s2s5r98; ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669341278771470&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R=; AFP_zp_dfctwzssrwh-aowb_80=441326q33660"
    public static let str79 = "FrffvbaQQS2=102n9o0o9pq60132qn0337rr867p75953502q2s27s2s5r98; AFP_zp_dfctwzssrwh-aowb_80=441326q33660; __hgzm=144631658.1231365869.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar); __hgzn=144631658.1670816052019209000.1231365869.1231365869.1231365869.1; __hgzo=144631658.0.10.1231365869; __hgzp=144631658; ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669341278771470&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str80 = "FrffvbaQQS2=9995p6rp12rrnr893334ro7nq70o7p64p69rqn844prs1473; ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669350559478880&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R=; AFP_zp_dfctwzs-aowb_80=441327q73660"
    public static let str81 = "FrffvbaQQS2=9995p6rp12rrnr893334ro7nq70o7p64p69rqn844prs1473; AFP_zp_dfctwzs-aowb_80=441327q73660; __hgzm=144631658.1231367054.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar); __hgzn=144631658.1796080716621419500.1231367054.1231367054.1231367054.1; __hgzo=144631658.0.10.1231367054; __hgzp=144631658; ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669350559478880&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str82 = "[glcr=fhozvg]"
    public static let str83 = "n.svryqOga,n.svryqOgaPnapry"
    public static let str84 = "n.svryqOgaPnapry"
    public static let str85 = "oyvpxchaxg"
    public static let str86 = "qvi.bow-nppbeqvba qg"
    public static let str87 = "uggc://tbbtyrnqf.t.qbhoyrpyvpx.arg/cntrnq/nqf?pyvrag=pn-svz_zlfcnpr_nccf_wf&qg=1231367052227&uy=ra&nqfnsr=uvtu&br=hgs8&ahz_nqf=4&bhgchg=wf&nqgrfg=bss&pbeeryngbe=1231367052227&punaary=svz_zlfcnpr_nccf-pnainf%2Psvz_zlfcnpr_havgrq-fgngrf&hey=uggc%3N%2S%2Scebsvyr.zlfcnpr.pbz%2SZbqhyrf%2SNccyvpngvbaf%2SCntrf%2SPnainf.nfck&nq_glcr=grkg&rvq=6083027&rn=0&sez=1&tn_ivq=716357910.1231367056&tn_fvq=1231367056&tn_uvq=1387206491&synfu=9.0.115&h_u=768&h_j=1024&h_nu=738&h_nj=1024&h_pq=24&h_gm=-480&h_uvf=2&h_wnin=gehr&h_acyht=7&h_azvzr=22"
    public static let str88 = "uggc://tbbtyrnqf.t.qbhoyrpyvpx.arg/cntrnq/nqf?pyvrag=pn-svz_zlfcnpr_zlfcnpr-ubzrcntr_wf&qg=1231365851658&uy=ra&nqfnsr=uvtu&br=hgs8&ahz_nqf=4&bhgchg=wf&nqgrfg=bss&pbeeryngbe=1231365851658&punaary=svz_zlfcnpr_ubzrcntr_abgybttrqva%2Psvz_zlfcnpr_aba_HTP%2Psvz_zlfcnpr_havgrq-fgngrf&hey=uggc%3N%2S%2Scebsvyrrqvg.zlfcnpr.pbz%2Svaqrk.psz&nq_glcr=grkg&rvq=6083027&rn=0&sez=0&tn_ivq=1979828129.1231365855&tn_fvq=1231365855&tn_uvq=2085229649&synfu=9.0.115&h_u=768&h_j=1024&h_nu=738&h_nj=1024&h_pq=24&h_gm=-480&h_uvf=2&h_wnin=gehr&h_acyht=7&h_azvzr=22"
    public static let str89 = "uggc://zfacbegny.112.2b7.arg/o/ff/zfacbegnyubzr/1/U.7-cqi-2/f55023338617756?[NDO]&aqu=1&g=7%2S0%2S2009%2014%3N12%3N47%203%20480&af=zfacbegny&cntrAnzr=HF%20UCZFSGJ&t=uggc%3N%2S%2Sjjj.zfa.pbz%2S&f=0k0&p=43835816&x=A&oj=994&ou=634&uc=A&{2}&[NDR]"
    public static let str90 = "zrgn[anzr=nwnkHey]"
    public static let str91 = "anpuevpugra"
    public static let str92 = ##"b oS={\'oT\':1.1};x $8n(B){z(B!=o9)};x $S(B){O(!$8n(B))z A;O(B.4L)z\'T\';b S=7t B;O(S==\'2P\'&&B.p4){23(B.7f){12 1:z\'T\';12 3:z/\\S/.2g(B.8M)?\'ox\':\'oh\'}}O(S==\'2P\'||S==\'x\'){23(B.nE){12 2V:z\'1O\';12 7I:z\'5a\';12 18:z\'4B\'}O(7t B.I==\'4F\'){O(B.3u)z\'pG\';O(B.8e)z\'1p\'}}z S};x $2p(){b 4E={};Z(b v=0;v<1p.I;v++){Z(b X 1o 1p[v]){b nc=1p[v][X];b 6E=4E[X];O(6E&&$S(nc)==\'2P\'&&$S(6E)==\'2P\')4E[X]=$2p(6E,nc);17 4E[X]=nc}}z 4E};b $E=7p.E=x(){b 1d=1p;O(!1d[1])1d=[p,1d[0]];Z(b X 1o 1d[1])1d[0][X]=1d[1][X];z 1d[0]};b $4D=7p.pJ=x(){Z(b v=0,y=1p.I;v<y;v++){1p[v].E=x(1J){Z(b 1I 1o 1J){O(!p.1Y[1I])p.1Y[1I]=1J[1I];O(!p[1I])p[1I]=$4D.6C(1I)}}}};$4D.6C=x(1I){z x(L){z p.1Y[1I].3H(L,2V.1Y.nV.1F(1p,1))}};$4D(7F,2V,6J,nb);b 3l=x(B){B=B||{};B.E=$E;z B};b pK=Y 3l(H);b pZ=Y 3l(C);C.6f=C.35(\'6f\')[0];x $2O(B){z!!(B||B===0)};x $5S(B,n8){z $8n(B)?B:n8};x $7K(3c,1m){z 1q.na(1q.7K()*(1m-3c+1)+3c)};x $3N(){z Y 97().os()};x $4M(1U){pv(1U);pa(1U);z 1S};H.43=!!(C.5Z);O(H.nB)H.31=H[H.7q?\'py\':\'nL\']=1r;17 O(C.9N&&!C.om&&!oy.oZ)H.pF=H.4Z=H[H.43?\'pt\':\'65\']=1r;17 O(C.po!=1S)H.7J=1r;O(7t 5B==\'o9\'){b 5B=x(){};O(H.4Z)C.nd(\"pW\");5B.1Y=(H.4Z)?H[\"[[oN.1Y]]\"]:{}}5B.1Y.4L=1r;O(H.nL)5s{C.oX(\"pp\",A,1r)}4K(r){};b 18=x(1X){b 63=x(){z(1p[0]!==1S&&p.1w&&$S(p.1w)==\'x\')?p.1w.3H(p,1p):p};$E(63,p);63.1Y=1X;63.nE=18;z 63};18.1z=x(){};18.1Y={E:x(1X){b 7x=Y p(1S);Z(b X 1o 1X){b nC=7x[X];7x[X]=18.nY(nC,1X[X])}z Y 18(7x)},3d:x(){Z(b v=0,y=1p.I;v<y;v++)$E(p.1Y,1p[v])}};18.nY=x(2b,2n){O(2b&&2b!=2n){b S=$S(2n);O(S!=$S(2b))z 2n;23(S){12\'x\':b 7R=x(){p.1e=1p.8e.1e;z 2n.3H(p,1p)};7R.1e=2b;z 7R;12\'2P\':z $2p(2b,2n)}}z 2n};b 8o=Y 18({oQ:x(J){p.4w=p.4w||[];p.4w.1x(J);z p},7g:x(){O(p.4w&&p.4w.I)p.4w.9J().2x(10,p)},oP:x(){p.4w=[]}});b 2d=Y 18({1V:x(S,J){O(J!=18.1z){p.$19=p.$19||{};p.$19[S]=p.$19[S]||[];p.$19[S].5j(J)}z p},1v:x(S,1d,2x){O(p.$19&&p.$19[S]){p.$19[S].1b(x(J){J.3n({\'L\':p,\'2x\':2x,\'1p\':1d})()},p)}z p},3M:x(S,J){O(p.$19&&p.$19[S])p.$19[S].2U(J);z p}});b 4v=Y 18({2H:x(){p.P=$2p.3H(1S,[p.P].E(1p));O(!p.1V)z p;Z(b 3O 1o p.P){O($S(p.P[3O]==\'x\')&&3O.2g(/^5P[N-M]/))p.1V(3O,p.P[3O])}z p}});2V.E({7y:x(J,L){Z(b v=0,w=p.I;v<w;v++)J.1F(L,p[v],v,p)},3s:x(J,L){b 54=[];Z(b v=0,w=p.I;v<w;v++){O(J.1F(L,p[v],v,p))54.1x(p[v])}z 54},2X:x(J,L){b 54=[];Z(b v=0,w=p.I;v<w;v++)54[v]=J.1F(L,p[v],v,p);z 54},4i:x(J,L){Z(b v=0,w=p.I;v<w;v++){O(!J.1F(L,p[v],v,p))z A}z 1r},ob:x(J,L){Z(b v=0,w=p.I;v<w;v++){O(J.1F(L,p[v],v,p))z 1r}z A},3F:x(3u,15){b 3A=p.I;Z(b v=(15<0)?1q.1m(0,3A+15):15||0;v<3A;v++){O(p[v]===3u)z v}z-1},8z:x(1u,I){1u=1u||0;O(1u<0)1u=p.I+1u;I=I||(p.I-1u);b 89=[];Z(b v=0;v<I;v++)89[v]=p[1u++];z 89},2U:x(3u){b v=0;b 3A=p.I;6L(v<3A){O(p[v]===3u){p.6l(v,1);3A--}17{v++}}z p},1y:x(3u,15){z p.3F(3u,15)!=-1},oz:x(1C){b B={},I=1q.3c(p.I,1C.I);Z(b v=0;v<I;v++)B[1C[v]]=p[v];z B},E:x(1O){Z(b v=0,w=1O.I;v<w;v++)p.1x(1O[v]);z p},2p:x(1O){Z(b v=0,y=1O.I;v<y;v++)p.5j(1O[v]);z p},5j:x(3u){O(!p.1y(3u))p.1x(3u);z p},oc:x(){z p[$7K(0,p.I-1)]||A},7L:x(){z p[p.I-1]||A}});2V.1Y.1b=2V.1Y.7y;2V.1Y.2g=2V.1Y.1y;x $N(1O){z 2V.8z(1O)};x $1b(3J,J,L){O(3J&&7t 3J.I==\'4F\'&&$S(3J)!=\'2P\')2V.7y(3J,J,L);17 Z(b 1j 1o 3J)J.1F(L||3J,3J[1j],1j)};6J.E({2g:x(6b,2F){z(($S(6b)==\'2R\')?Y 7I(6b,2F):6b).2g(p)},3p:x(){z 5K(p,10)},o4:x(){z 69(p)},7A:x(){z p.3y(/-\\D/t,x(2G){z 2G.7G(1).nW()})},9b:x(){z p.3y(/\\w[N-M]/t,x(2G){z(2G.7G(0)+\'-\'+2G.7G(1).5O())})},8V:x(){z p.3y(/\\b[n-m]/t,x(2G){z 2G.nW()})},5L:x(){z p.3y(/^\\s+|\\s+$/t,\'\')},7j:x(){z p.3y(/\\s{2,}/t,\' \').5L()},5V:x(1O){b 1i=p.2G(/\\d{1,3}/t);z(1i)?1i.5V(1O):A},5U:x(1O){b 3P=p.2G(/^#?(\\w{1,2})(\\w{1,2})(\\w{1,2})$/);z(3P)?3P.nV(1).5U(1O):A},1y:x(2R,f){z(f)?(f+p+f).3F(f+2R+f)>-1:p.3F(2R)>-1},nX:x(){z p.3y(/([.*+?^${}()|[\\]\\/\\])/t,\'\\$1\')}});2V.E({5V:x(1O){O(p.I<3)z A;O(p.I==4&&p[3]==0&&!1O)z\'p5\';b 3P=[];Z(b v=0;v<3;v++){b 52=(p[v]-0).4h(16);3P.1x((52.I==1)?\'0\'+52:52)}z 1O?3P:\'#\'+3P.2u(\'\')},5U:x(1O){O(p.I!=3)z A;b 1i=[];Z(b v=0;v<3;v++){1i.1x(5K((p[v].I==1)?p[v]+p[v]:p[v],16))}z 1O?1i:\'1i(\'+1i.2u(\',\')+\')\'}});7F.E({3n:x(P){b J=p;P=$2p({\'L\':J,\'V\':A,\'1p\':1S,\'2x\':A,\'4s\':A,\'6W\':A},P);O($2O(P.1p)&&$S(P.1p)!=\'1O\')P.1p=[P.1p];z x(V){b 1d;O(P.V){V=V||H.V;1d=[(P.V===1r)?V:Y P.V(V)];O(P.1p)1d.E(P.1p)}17 1d=P.1p||1p;b 3C=x(){z J.3H($5S(P"##
    public static let str93 = "hagreunyghat"
    public static let str94 = "ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669341278771470&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str95 = "ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&Pbhagel=IIZ%3Q&SbeprqRkcvengvba=633669350559478880&gvzrMbar=-8&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R%3Q"
    public static let str96 = "ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669341278771470&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R="
    public static let str97 = "ZFPhygher=VC=&VCPhygher=ra-HF&CersreerqPhygher=ra-HF&CersreerqPhygherCraqvat=&Pbhagel=IIZ=&SbeprqRkcvengvba=633669350559478880&gvzrMbar=0&HFEYBP=DKWyLHAiMTH9AwHjWxAcqUx9GJ91oaEunJ4tIzyyqlMQo3IhqUW5D29xMG1IHlMQo3IhqUW5GzSgMG1Iozy0MJDtH3EuqTImWxEgLHAiMTH9BQN3WxkuqTy0qJEyCGZ3YwDkBGVzGT9hM2y0qJEyCF0kZwVhZQH3APMDo3A0LJkQo2EyCGx0ZQDmWyWyM2yiox5uoJH9D0R="
    public static let str98 = "shapgvba (){Cuk.Nccyvpngvba.Frghc.Pber();Cuk.Nccyvpngvba.Frghc.Nwnk();Cuk.Nccyvpngvba.Frghc.Synfu();Cuk.Nccyvpngvba.Frghc.Zbqhyrf()}"

    func runBlock11(): Int64 {
      var sum = 0;
        for (_ in 0..2) {
        sum += re18.matcher(" .pybfr").replaceAll("").size
        sum += re18.matcher(" n.svryqOgaPnapry").replaceAll("").size
        sum += re18.matcher(" qg").replaceAll("").size
        sum += re68.matcher(str77).replaceAll("").size
        sum += re18.matcher(str77).replaceAll("").size
        sum += re39.matcher("").replaceAll("").size
        sum += Regex("^").matcher("").replaceAll("").size
        sum += "".split(re86.string()).size
        sum += re39.matcher("*").replaceAll("").size
        sum += re68.matcher("*").replaceAll("").size
        sum += re18.matcher("*").replaceAll("").size
        sum += re68.matcher(".pybfr").replaceAll("").size
        sum += re18.matcher(".pybfr").replaceAll("").size
        sum += re87.matcher(##"//vzt.jro.qr/vij/FC/tzk_uc/fperra/${inyhr}?gf=${abj}"##).replaceAll("").size
        sum += re88.matcher(##"//vzt.jro.qr/vij/FC/tzk_uc/fperra/1024?gf=${abj}"##).replaceAll("").size
        sum += re87.matcher(##"//vzt.jro.qr/vij/FC/tzk_uc/jvafvmr/${inyhr}?gf=${abj}"##).replaceAll("").size
        sum += re88.matcher(##"//vzt.jro.qr/vij/FC/tzk_uc/jvafvmr/992/608?gf=${abj}"##).replaceAll("").size
        sum += re30.matcher("300k120").replaceAll("").size
        sum += re30.matcher("300k250").replaceAll("").size
        sum += re30.matcher("310k120").replaceAll("").size
        sum += re30.matcher("310k170").replaceAll("").size
        sum += re30.matcher("310k250").replaceAll("").size
        sum += Regex("^.*\\.(.*)\\s.*$").matcher("9.0  e115").replaceAll("").size
        sum += re2.matcher("Nppbeqvba").replaceAll("").size
        sum += re89.matcher("Nxghryy\\x0a").replaceAll("").size
        sum += re90.matcher("Nxghryy\\x0a").replaceAll("").size
        sum += re2.matcher("Nccyvpngvba").replaceAll("").size
        sum += re89.matcher("Oyvpxchaxg\\x0a").replaceAll("").size
        sum += re90.matcher("Oyvpxchaxg\\x0a").replaceAll("").size
        sum += re89.matcher("Svanamra\\x0a").replaceAll("").size
        sum += re90.matcher("Svanamra\\x0a").replaceAll("").size
        sum += re89.matcher("Tnzrf\\x0a").replaceAll("").size
        sum += re90.matcher("Tnzrf\\x0a").replaceAll("").size
        sum += re89.matcher("Ubebfxbc\\x0a").replaceAll("").size
        sum += re90.matcher("Ubebfxbc\\x0a").replaceAll("").size
        sum += re89.matcher("Xvab\\x0a").replaceAll("").size
        sum += re90.matcher("Xvab\\x0a").replaceAll("").size
        sum += re2.matcher("Zbqhyrf").replaceAll("").size
        sum += re89.matcher("Zhfvx\\x0a").replaceAll("").size
        sum += re90.matcher("Zhfvx\\x0a").replaceAll("").size
        sum += re89.matcher("Anpuevpugra\\x0a").replaceAll("").size
        sum += re90.matcher("Anpuevpugra\\x0a").replaceAll("").size
        sum += re2.matcher("Cuk").replaceAll("").size
        sum += "ErdhrfgSvavfu".split(re70.string()).size
        sum += "ErdhrfgSvavfu.NWNK.Cuk".split(re70.string()).size
        sum += re89.matcher("Ebhgr\\x0a").replaceAll("").size
        sum += re90.matcher("Ebhgr\\x0a").replaceAll("").size

        sum += str78.split(re32.string()).size;
        sum += str79.split(re32.string()).size;
        sum += str80.split(re32.string()).size;
        sum += str81.split(re32.string()).size;

        sum += re89.matcher("Fcbeg\\x0a").replaceAll("").size
        sum += re90.matcher("Fcbeg\\x0a").replaceAll("").size
        sum += re89.matcher("GI-Fcbg\\x0a").replaceAll("").size
        sum += re90.matcher("GI-Fcbg\\x0a").replaceAll("").size
        sum += re89.matcher("Gbhe\\x0a").replaceAll("").size
        sum += re90.matcher("Gbhe\\x0a").replaceAll("").size
        sum += re89.matcher("Hagreunyghat\\x0a").replaceAll("").size
        sum += re90.matcher("Hagreunyghat\\x0a").replaceAll("").size
        sum += re89.matcher("Ivqrb\\x0a").replaceAll("").size
        sum += re90.matcher("Ivqrb\\x0a").replaceAll("").size
        sum += re89.matcher("Jrggre\\x0a").replaceAll("").size
        sum += re90.matcher("Jrggre\\x0a").replaceAll("").size
        sum += re68.matcher(str82).replaceAll("").size
        sum += re18.matcher(str82).replaceAll("").size
        sum += re68.matcher(str83).replaceAll("").size
        sum += re18.matcher(str83).replaceAll("").size
        sum += re68.matcher(str84).replaceAll("").size
        sum += re18.matcher(str84).replaceAll("").size
        sum += re30.matcher("nqiFreivprObk").replaceAll("").size
        sum += re30.matcher("nqiFubccvatObk").replaceAll("").size
        sum += re39.matcher("nwnk").replaceAll("").size
        sum += re40.matcher("nxghryy").replaceAll("").size
        sum += re41.matcher("nxghryy").replaceAll("").size
        sum += re42.matcher("nxghryy").replaceAll("").size
        sum += re43.matcher("nxghryy").replaceAll("").size
        sum += re44.matcher("nxghryy").replaceAll("").size
        sum += re45.matcher("nxghryy").replaceAll("").size
        sum += re46.matcher("nxghryy").replaceAll("").size
        sum += re47.matcher("nxghryy").replaceAll("").size
        sum += re48.matcher("nxghryy").replaceAll("").size
        sum += re40.matcher(str85).replaceAll("").size
        sum += re41.matcher(str85).replaceAll("").size
        sum += re42.matcher(str85).replaceAll("").size
        sum += re43.matcher(str85).replaceAll("").size
        sum += re44.matcher(str85).replaceAll("").size
        sum += re45.matcher(str85).replaceAll("").size
        sum += re46.matcher(str85).replaceAll("").size
        sum += re47.matcher(str85).replaceAll("").size
        sum += re48.matcher(str85).replaceAll("").size
        sum += re29.matcher("pngrtbel").replaceAll("").size
        sum += re30.matcher("pngrtbel").replaceAll("").size
        sum += re39.matcher("pybfr").replaceAll("").size
        sum += re39.matcher("qvi").replaceAll("").size
        sum += re68.matcher(str86).replaceAll("").size
        sum += re18.matcher(str86).replaceAll("").size
        sum += re39.matcher("qg").replaceAll("").size
        sum += re68.matcher("qg").replaceAll("").size
        sum += re18.matcher("qg").replaceAll("").size
        sum += re39.matcher("rzorq").replaceAll("").size
        sum += re68.matcher("rzorq").replaceAll("").size
        sum += re18.matcher("rzorq").replaceAll("").size
        sum += re39.matcher("svryqOga").replaceAll("").size
        sum += re39.matcher("svryqOgaPnapry").replaceAll("").size
        sum += "svz_zlfcnpr_nccf-pnainf,svz_zlfcnpr_havgrq-fgngrf".split(re20.string()).size;
        sum += re40.matcher("svanamra").replaceAll("").size
        sum += re41.matcher("svanamra").replaceAll("").size
        sum += re42.matcher("svanamra").replaceAll("").size
        sum += re43.matcher("svanamra").replaceAll("").size
        sum += re44.matcher("svanamra").replaceAll("").size
        sum += re45.matcher("svanamra").replaceAll("").size
        sum += re46.matcher("svanamra").replaceAll("").size
        sum += re47.matcher("svanamra").replaceAll("").size
        sum += re48.matcher("svanamra").replaceAll("").size
        sum += "sbphf".split(re70.string()).size
        sum += "sbphf.gno sbphfva.gno".split(re70.string()).size
        sum += "sbphfva".split(re70.string()).size
        sum += re39.matcher("sbez").replaceAll("").size
        sum += re68.matcher("sbez.nwnk").replaceAll("").size
        sum += re18.matcher("sbez.nwnk").replaceAll("").size
        sum += re40.matcher("tnzrf").replaceAll("").size
        sum += re41.matcher("tnzrf").replaceAll("").size
        sum += re42.matcher("tnzrf").replaceAll("").size
        sum += re43.matcher("tnzrf").replaceAll("").size
        sum += re44.matcher("tnzrf").replaceAll("").size
        sum += re45.matcher("tnzrf").replaceAll("").size
        sum += re46.matcher("tnzrf").replaceAll("").size
        sum += re47.matcher("tnzrf").replaceAll("").size
        sum += re48.matcher("tnzrf").replaceAll("").size
        sum += re30.matcher("ubzrcntr").replaceAll("").size
        sum += re40.matcher("ubebfxbc").replaceAll("").size
        sum += re41.matcher("ubebfxbc").replaceAll("").size
        sum += re42.matcher("ubebfxbc").replaceAll("").size
        sum += re43.matcher("ubebfxbc").replaceAll("").size
        sum += re44.matcher("ubebfxbc").replaceAll("").size
        sum += re45.matcher("ubebfxbc").replaceAll("").size
        sum += re46.matcher("ubebfxbc").replaceAll("").size
        sum += re47.matcher("ubebfxbc").replaceAll("").size
        sum += re48.matcher("ubebfxbc").replaceAll("").size
        sum += re30.matcher("uc_cebzbobk_ugzy%2Puc_cebzbobk_vzt").replaceAll("").size
        sum += re30.matcher("uc_erpgnatyr").replaceAll("").size
        sum += re33.matcher(str87).replaceAll("").size
        sum += re33.matcher(str88).replaceAll("").size
        sum += re71.matcher("uggc://wf.hv-cbegny.qr/tzk/ubzr/wf/20080602/onfr.wf${4}${5}").replaceAll("").size
        sum += re72.matcher("uggc://wf.hv-cbegny.qr/tzk/ubzr/wf/20080602/onfr.wf${5}").replaceAll("").size
        sum += re71.matcher("uggc://wf.hv-cbegny.qr/tzk/ubzr/wf/20080602/qlaYvo.wf${4}${5}").replaceAll("").size
        sum += re72.matcher("uggc://wf.hv-cbegny.qr/tzk/ubzr/wf/20080602/qlaYvo.wf${5}").replaceAll("").size
        sum += re71.matcher("uggc://wf.hv-cbegny.qr/tzk/ubzr/wf/20080602/rssrpgYvo.wf${4}${5}").replaceAll("").size
        sum += re72.matcher("uggc://wf.hv-cbegny.qr/tzk/ubzr/wf/20080602/rssrpgYvo.wf${5}").replaceAll("").size
        sum += re73.matcher(str89).replaceAll("").size
        sum += re69.matcher("uggc://zfacbegny.112.2b7.arg/o/ff/zfacbegnyubzr/1/U.7-cqi-2/f55023338617756?[NDO]&{1}&{2}&[NDR]").replaceAll("").size
        sum += re23.matcher(str6).replaceAll("").size
        sum += re40.matcher("xvab").replaceAll("").size
        sum += re41.matcher("xvab").replaceAll("").size
        sum += re42.matcher("xvab").replaceAll("").size
        sum += re43.matcher("xvab").replaceAll("").size
        sum += re44.matcher("xvab").replaceAll("").size
        sum += re45.matcher("xvab").replaceAll("").size
        sum += re46.matcher("xvab").replaceAll("").size
        sum += re47.matcher("xvab").replaceAll("").size
        sum += re48.matcher("xvab").replaceAll("").size
        sum += "ybnq".split(re70.string()).size;
        sum += re18.matcher("zrqvnzbqgno lhv-anifrg lhv-anifrg-gbc").replaceAll("").size
        sum += re39.matcher("zrgn").replaceAll("").size
        sum += re68.matcher(str90).replaceAll("").size
        sum += re18.matcher(str90).replaceAll("").size
        sum += "zbhfrzbir".split(re70.string()).size;
        sum += "zbhfrzbir.gno".split(re70.string()).size;
        sum += Regex("^.*jroxvg\\/(\\d+(\\.\\d+)?).*$").matcher(str63).replaceAll("").size
        sum += re40.matcher("zhfvx").replaceAll("").size
        sum += re41.matcher("zhfvx").replaceAll("").size
        sum += re42.matcher("zhfvx").replaceAll("").size
        sum += re43.matcher("zhfvx").replaceAll("").size
        sum += re44.matcher("zhfvx").replaceAll("").size
        sum += re45.matcher("zhfvx").replaceAll("").size
        sum += re46.matcher("zhfvx").replaceAll("").size
        sum += re47.matcher("zhfvx").replaceAll("").size
        sum += re48.matcher("zhfvx").replaceAll("").size
        sum += re52.matcher("zlfcnpr_nccf_pnainf").replaceAll("").size
        sum += re40.matcher(str91).replaceAll("").size
        sum += re41.matcher(str91).replaceAll("").size
        sum += re42.matcher(str91).replaceAll("").size
        sum += re43.matcher(str91).replaceAll("").size
        sum += re44.matcher(str91).replaceAll("").size
        sum += re45.matcher(str91).replaceAll("").size
        sum += re46.matcher(str91).replaceAll("").size
        sum += re47.matcher(str91).replaceAll("").size
        sum += re48.matcher(str91).replaceAll("").size
        sum += re39.matcher("anzr").replaceAll("").size
        sum += re95.matcher(str92).replaceAll("").size
        sum += re39.matcher("bow-nppbeqvba").replaceAll("").size
        sum += re39.matcher("bowrpg").replaceAll("").size
        sum += re68.matcher("bowrpg").replaceAll("").size
        sum += re18.matcher("bowrpg").replaceAll("").size
        sum += re29.matcher("cnenzf%2Rfglyrf").replaceAll("").size
        sum += re30.matcher("cnenzf%2Rfglyrf").replaceAll("").size
        sum += re30.matcher("cbchc").replaceAll("").size
        sum += re40.matcher("ebhgr").replaceAll("").size
        sum += re41.matcher("ebhgr").replaceAll("").size
        sum += re42.matcher("ebhgr").replaceAll("").size
        sum += re43.matcher("ebhgr").replaceAll("").size
        sum += re44.matcher("ebhgr").replaceAll("").size
        sum += re45.matcher("ebhgr").replaceAll("").size
        sum += re46.matcher("ebhgr").replaceAll("").size
        sum += re47.matcher("ebhgr").replaceAll("").size
        sum += re48.matcher("ebhgr").replaceAll("").size
        sum += re30.matcher("freivprobk_uc").replaceAll("").size
        sum += re30.matcher("fubccvatobk_uc").replaceAll("").size
        sum += re39.matcher("fubhgobk").replaceAll("").size
        sum += re40.matcher("fcbeg").replaceAll("").size
        sum += re41.matcher("fcbeg").replaceAll("").size
        sum += re42.matcher("fcbeg").replaceAll("").size
        sum += re43.matcher("fcbeg").replaceAll("").size
        sum += re44.matcher("fcbeg").replaceAll("").size
        sum += re45.matcher("fcbeg").replaceAll("").size
        sum += re46.matcher("fcbeg").replaceAll("").size
        sum += re47.matcher("fcbeg").replaceAll("").size
        sum += re48.matcher("fcbeg").replaceAll("").size
        sum += re40.matcher("gbhe").replaceAll("").size
        sum += re41.matcher("gbhe").replaceAll("").size
        sum += re42.matcher("gbhe").replaceAll("").size
        sum += re43.matcher("gbhe").replaceAll("").size
        sum += re44.matcher("gbhe").replaceAll("").size
        sum += re45.matcher("gbhe").replaceAll("").size
        sum += re46.matcher("gbhe").replaceAll("").size
        sum += re47.matcher("gbhe").replaceAll("").size
        sum += re48.matcher("gbhe").replaceAll("").size
        sum += re40.matcher("gi-fcbg").replaceAll("").size
        sum += re41.matcher("gi-fcbg").replaceAll("").size
        sum += re42.matcher("gi-fcbg").replaceAll("").size
        sum += re43.matcher("gi-fcbg").replaceAll("").size
        sum += re44.matcher("gi-fcbg").replaceAll("").size
        sum += re45.matcher("gi-fcbg").replaceAll("").size
        sum += re46.matcher("gi-fcbg").replaceAll("").size
        sum += re47.matcher("gi-fcbg").replaceAll("").size
        sum += re48.matcher("gi-fcbg").replaceAll("").size
        sum += re39.matcher("glcr").replaceAll("").size
        sum += Regex("\\/").matcher("haqrsvarq").replaceAll("").size
        sum += re40.matcher(str93).replaceAll("").size
        sum += re41.matcher(str93).replaceAll("").size
        sum += re42.matcher(str93).replaceAll("").size
        sum += re43.matcher(str93).replaceAll("").size
        sum += re44.matcher(str93).replaceAll("").size
        sum += re45.matcher(str93).replaceAll("").size
        sum += re46.matcher(str93).replaceAll("").size
        sum += re47.matcher(str93).replaceAll("").size
        sum += re48.matcher(str93).replaceAll("").size
        sum += re40.matcher("ivqrb").replaceAll("").size
        sum += re41.matcher("ivqrb").replaceAll("").size
        sum += re42.matcher("ivqrb").replaceAll("").size
        sum += re43.matcher("ivqrb").replaceAll("").size
        sum += re44.matcher("ivqrb").replaceAll("").size
        sum += re45.matcher("ivqrb").replaceAll("").size
        sum += re46.matcher("ivqrb").replaceAll("").size
        sum += re47.matcher("ivqrb").replaceAll("").size
        sum += re48.matcher("ivqrb").replaceAll("").size
        sum += "ivfvgf=1".split(re86.string()).size
        sum += re40.matcher("jrggre").replaceAll("").size
        sum += re41.matcher("jrggre").replaceAll("").size
        sum += re42.matcher("jrggre").replaceAll("").size
        sum += re43.matcher("jrggre").replaceAll("").size
        sum += re44.matcher("jrggre").replaceAll("").size
        sum += re45.matcher("jrggre").replaceAll("").size
        sum += re46.matcher("jrggre").replaceAll("").size
        sum += re47.matcher("jrggre").replaceAll("").size
        sum += re48.matcher("jrggre").replaceAll("").size
        sum += Exec(Regex("#[a-z0-9]+$/i"),"uggc://jjj.fpuhryreim.arg/Qrsnhyg")
        sum += Exec(re66,"fryrpgrq")
        sum += Exec(Regex("(?:^|\\s+)lhv-ani(?:\\s+|$)"),"sff lhv-ani")
        sum += Exec(Regex("(?:^|\\s+)lhv-anifrg(?:\\s+|$)"),"zrqvnzbqgno lhv-anifrg")
        sum += Exec(Regex("(?:^|\\s+)lhv-anifrg-gbc(?:\\s+|$)"),"zrqvnzbqgno lhv-anifrg")
        sum += Exec(re91,"GnoThvq")
        sum += Exec(re91,"thvq")
        sum += Exec(Regex("(pbzcngvoyr|jroxvg)"),str63)
        sum += Exec(Regex(".+(?:ei|vg|en|vr)[\\/: ]([\\d.]+)"),str63)
        sum += Exec(re8,"144631658.0.10.1231365869")
        sum += Exec(re8,"144631658.0.10.1231367054")
        sum += Exec(re8,"144631658.1231365869.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
        sum += Exec(re8,"144631658.1231367054.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
        sum += Exec(re8,"144631658.1670816052019209000.1231365869.1231365869.1231365869.1")
        sum += Exec(re8,"144631658.1796080716621419500.1231367054.1231367054.1231367054.1")
        sum += Exec(re8,str94)
        sum += Exec(re8,str95)
        sum += Exec(re8,str96)
        sum += Exec(re8,str97)
        sum += Exec(re8,"__hgzn=144631658.1670816052019209000.1231365869.1231365869.1231365869.1")
        sum += Exec(re8,"__hgzn=144631658.1796080716621419500.1231367054.1231367054.1231367054.1")
        sum += Exec(re8,"__hgzo=144631658.0.10.1231365869")
        sum += Exec(re8,"__hgzo=144631658.0.10.1231367054")
        sum += Exec(re8,"__hgzm=144631658.1231365869.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
        sum += Exec(re8,"__hgzm=144631658.1231367054.1.1.hgzpfe=(qverpg)|hgzppa=(qverpg)|hgzpzq=(abar)")
        sum += Exec(re34,str78)
        sum += Exec(re34,str79)
        sum += Exec(re34,str81)
        sum += Exec(re74,str77)
        sum += Exec(re74,"*")
        sum += Exec(re74,str82)
        sum += Exec(re74,str83)
        sum += Exec(re74,str86)
        sum += Exec(re74,"rzorq")
        sum += Exec(re74,"sbez.nwnk")
        sum += Exec(re74,str90)
        sum += Exec(re74,"bowrpg")
        sum += Exec(Regex("\\/onfr.wf(\\?.+)?$"),"/uggc://wf.hv-cbegny.qr/tzk/ubzr/wf/20080602/onfr.wf")
        sum += Exec(re28,"uvag ynfgUvag ynfg")
        sum += Exec(re75,"")
        sum += Exec(re76,"")
        sum += Exec(re77,"")
        sum += Exec(re78,"")
        sum += Exec(re80,str77)
        sum += Exec(re80,"*")
        sum += Exec(re80,".pybfr")
        sum += Exec(re80,str82)
        sum += Exec(re80,str83)
        sum += Exec(re80,str84)
        sum += Exec(re80,str86)
        sum += Exec(re80,"qg")
        sum += Exec(re80,"rzorq")
        sum += Exec(re80,"sbez.nwnk")
        sum += Exec(re80,str90)
        sum += Exec(re80,"bowrpg")
        sum += Exec(re61,"qlaYvo.wf")
        sum += Exec(re61,"rssrpgYvo.wf")
        sum += Exec(re61,"uggc://jjj.tzk.arg/qr/?fgnghf=uvajrvf")
        sum += Exec(re92," .pybfr")
        sum += Exec(re92," n.svryqOgaPnapry")
        sum += Exec(re92," qg")
        sum += Exec(re92,str48)
        sum += Exec(re92,".nwnk")
        sum += Exec(re92,".svryqOga,n.svryqOgaPnapry")
        sum += Exec(re92,".svryqOgaPnapry")
        sum += Exec(re92,".bow-nppbeqvba qg")
        sum += Exec(re68,str77)
        sum += Exec(re68,"*")
        sum += Exec(re68,".pybfr")
        sum += Exec(re68,str82)
        sum += Exec(re68,str83)
        sum += Exec(re68,str84)
        sum += Exec(re68,str86)
        sum += Exec(re68,"qg")
        sum += Exec(re68,"rzorq")
        sum += Exec(re68,"sbez.nwnk")
        sum += Exec(re68,str90)
        sum += Exec(re68,"bowrpg")
        sum += Exec(re93," .pybfr")
        sum += Exec(re93," n.svryqOgaPnapry")
        sum += Exec(re93," qg")
        sum += Exec(re93,str48)
        sum += Exec(re93,".nwnk")
        sum += Exec(re93,".svryqOga,n.svryqOgaPnapry")
        sum += Exec(re93,".svryqOgaPnapry")
        sum += Exec(re93,".bow-nppbeqvba qg")
        sum += Exec(re81,str77)
        sum += Exec(re81,"*")
        sum += Exec(re81,str48)
        sum += Exec(re81,".pybfr")
        sum += Exec(re81,str82)
        sum += Exec(re81,str83)
        sum += Exec(re81,str84)
        sum += Exec(re81,str86)
        sum += Exec(re81,"qg")
        sum += Exec(re81,"rzorq")
        sum += Exec(re81,"sbez.nwnk")
        sum += Exec(re81,str90)
        sum += Exec(re81,"bowrpg")
        sum += Exec(re94," .pybfr")
        sum += Exec(re94," n.svryqOgaPnapry")
        sum += Exec(re94," qg")
        sum += Exec(re94,str48)
        sum += Exec(re94,".nwnk")
        sum += Exec(re94,".svryqOga,n.svryqOgaPnapry")
        sum += Exec(re94,".svryqOgaPnapry")
        sum += Exec(re94,".bow-nppbeqvba qg")
        sum += Exec(re94,"[anzr=nwnkHey]")
        sum += Exec(re94,str82)
        sum += Exec(re31,"rf")
        sum += Exec(re31,"wn")
        sum += Exec(re82,str77)
        sum += Exec(re82,"*")
        sum += Exec(re82,str48)
        sum += Exec(re82,".pybfr")
        sum += Exec(re82,str82)
        sum += Exec(re82,str83)
        sum += Exec(re82,str84)
        sum += Exec(re82,str86)
        sum += Exec(re82,"qg")
        sum += Exec(re82,"rzorq")
        sum += Exec(re82,"sbez.nwnk")
        sum += Exec(re82,str90)
        sum += Exec(re82,"bowrpg")
        sum += Exec(re83,str98)
        sum += Exec(re83,"shapgvba sbphf() { [angvir pbqr] }")
        sum += Exec(re62,"#Ybtva")
        sum += Exec(re62,"#Ybtva_cnffjbeq")
        sum += Exec(re62,str77)
        sum += Exec(re62,"#fubhgobkWf")
        sum += Exec(re62,"#fubhgobkWfReebe")
        sum += Exec(re62,"#fubhgobkWfFhpprff")
        sum += Exec(re62,"*")
        sum += Exec(re62,str82)
        sum += Exec(re62,str83)
        sum += Exec(re62,str86)
        sum += Exec(re62,"rzorq")
        sum += Exec(re62,"sbez.nwnk")
        sum += Exec(re62,str90)
        sum += Exec(re62,"bowrpg")
        sum += Exec(re49,"pbagrag")
        sum += Exec(re24,str6)
        sum += Exec(Regex("xbadhrebe"),str63)
        sum += Exec(Regex("znp"),"jva32")
        sum += Exec(Regex("zbmvyyn"),str63)
        sum += Exec(Regex("zfvr"),str63)
        sum += Exec(Regex("ag\\s5\\.1"),str63)
        sum += Exec(Regex("bcren"),str63)
        sum += Exec(Regex("fnsnev"),str63)
        sum += Exec(Regex("jva"),"jva32")
        sum += Exec(Regex("jvaqbjf"),str63)
      }
      return sum;
    }
}

class Timer {
    private var start_time: DateTime = DateTime.now()
    private var end_time: DateTime = DateTime.now()

    public func getTime() {
        let time = DateTime.now()
        return time 
    }
}

main() {
    let test2 = RegExpBenchmark()
    test2.run()  
}
