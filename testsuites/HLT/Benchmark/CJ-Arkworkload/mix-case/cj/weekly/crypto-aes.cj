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
import std.time.*
import std.convert.*
import std.regex.*
import std.math.*

private let inDebug = true
private func log(str: String) {
    if (inDebug) {
        print(str)
    }
}


// Sbox is pre-computed multiplicative inverse in GF(2^8) used in SubBytes and KeyExpansion [§5.1.1]
private let Sbox =  [0x63,0x7c,0x77,0x7b,0xf2,0x6b,0x6f,0xc5,0x30,0x01,0x67,0x2b,0xfe,0xd7,0xab,0x76,
             0xca,0x82,0xc9,0x7d,0xfa,0x59,0x47,0xf0,0xad,0xd4,0xa2,0xaf,0x9c,0xa4,0x72,0xc0,  //Sbox[16-1]
             0xb7,0xfd,0x93,0x26,0x36,0x3f,0xf7,0xcc,0x34,0xa5,0xe5,0xf1,0x71,0xd8,0x31,0x15,
             0x04,0xc7,0x23,0xc3,0x18,0x96,0x05,0x9a,0x07,0x12,0x80,0xe2,0xeb,0x27,0xb2,0x75,  //Sbox[16-3]
             0x09,0x83,0x2c,0x1a,0x1b,0x6e,0x5a,0xa0,0x52,0x3b,0xd6,0xb3,0x29,0xe3,0x2f,0x84,
             0x53,0xd1,0x00,0xed,0x20,0xfc,0xb1,0x5b,0x6a,0xcb,0xbe,0x39,0x4a,0x4c,0x58,0xcf,  //Sbox[16-5]
             0xd0,0xef,0xaa,0xfb,0x43,0x4d,0x33,0x85,0x45,0xf9,0x02,0x7f,0x50,0x3c,0x9f,0xa8,
             0x51,0xa3,0x40,0x8f,0x92,0x9d,0x38,0xf5,0xbc,0xb6,0xda,0x21,0x10,0xff,0xf3,0xd2,  //Sbox[16-7]
             0xcd,0x0c,0x13,0xec,0x5f,0x97,0x44,0x17,0xc4,0xa7,0x7e,0x3d,0x64,0x5d,0x19,0x73,
             0x60,0x81,0x4f,0xdc,0x22,0x2a,0x90,0x88,0x46,0xee,0xb8,0x14,0xde,0x5e,0x0b,0xdb,  //Sbox[16-9]
             0xe0,0x32,0x3a,0x0a,0x49,0x06,0x24,0x5c,0xc2,0xd3,0xac,0x62,0x91,0x95,0xe4,0x79,
             0xe7,0xc8,0x37,0x6d,0x8d,0xd5,0x4e,0xa9,0x6c,0x56,0xf4,0xea,0x65,0x7a,0xae,0x08,  //Sbox[16-11]
             0xba,0x78,0x25,0x2e,0x1c,0xa6,0xb4,0xc6,0xe8,0xdd,0x74,0x1f,0x4b,0xbd,0x8b,0x8a,
             0x70,0x3e,0xb5,0x66,0x48,0x03,0xf6,0x0e,0x61,0x35,0x57,0xb9,0x86,0xc1,0x1d,0x9e,  //Sbox[16-13]
             0xe1,0xf8,0x98,0x11,0x69,0xd9,0x8e,0x94,0x9b,0x1e,0x87,0xe9,0xce,0x55,0x28,0xdf,
             0x8c,0xa1,0x89,0x0d,0xbf,0xe6,0x42,0x68,0x41,0x99,0x2d,0x0f,0xb0,0x54,0xbb,0x16];

// Rcon is Round Constant used for the Key Expansion [1st col is 2^(r-1) in GF(2^8)] [§5.2]
private let Rcon = [ [0x00, 0x00, 0x00, 0x00],
             [0x01, 0x00, 0x00, 0x00],  //Rcon[1]
             [0x02, 0x00, 0x00, 0x00],
             [0x04, 0x00, 0x00, 0x00],  //Rcon[3]
             [0x08, 0x00, 0x00, 0x00],
             [0x10, 0x00, 0x00, 0x00],  //Rcon[5]
             [0x20, 0x00, 0x00, 0x00],
             [0x40, 0x00, 0x00, 0x00],  //Rcon[7]
             [0x80, 0x00, 0x00, 0x00],
             [0x1b, 0x00, 0x00, 0x00],  //Rcon[9]
             [0x36, 0x00, 0x00, 0x00] ];

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */

/**
 ** AES Cipher function: encrypt 'input' with Rijndael algorithm
 *
 **   takes   byte-array 'input' (16 bytes)
 **          2D byte-array key schedule 'w' (Nr+1 x Nb bytes)
 *
 **   applies Nr rounds (10/12/14) using key schedule w for 'add round key' stage
 *
 **   returns byte-array encrypted value (16 bytes)
 **/
private func Cipher(input: Array<Int16>, w:Array<Array<Int16>>): Array<Int16> {    // main Cipher func [§5.1]
    let Nb: Int64 = 4;               // block size (in words): no of columns in state (fixed at 4 for AES)
    let Nr = w.size / Nb - 1; // no of rounds: 10/12/14 for 128/192/256-bit keys

    var state:Array<Array<Int16>> = Array<Array<Int16>>(4, repeat: Array<Int16>(Nb, repeat : 0)) // initialise 4xNb byte-array 'state' with input [§3.4]

    for (i in 0..4*Nb) {
        state[i%4][Int64(floor(Float64(i/4)))] = input[i]
    }

    state = AddRoundKey(state, w, 0, Nb);
    for (round in 1..Nr) {
        state = SubBytes(state, Nb);
        state = ShiftRows(state, Nb);
        state = MixColumns(state);
        state = AddRoundKey(state, w, round, Nb);
    }

    state = SubBytes(state, Nb);
    state = ShiftRows(state, Nb);
    state = AddRoundKey(state, w, Nr, Nb);

    var output = Array<Int16>(4*Nb, repeat:0)// convert state to 1-d array before returning [§3.4]
    for (i in 0..4*Nb) {
        output[i] = state[i%4][Int64(floor(Float64((i/4))))]
    }
    return output;
}

private func SubBytes(s1:Array<Array<Int16>>, Nb: Int64): Array<Array<Int16>>{    // apply SBox to state S [§5.1.1]
    var s = s1
    for (r in 0..4) {
        for (c in 0..Nb) {
            s[r][c] = Int16(Sbox[Int64(s[r][c])])
        }
    }
    return s;
}

private func ShiftRows(s1:Array<Array<Int16>>,Nb: Int64): Array<Array<Int16>>{    // shift row r of state S left by r bytes [§5.1.2]
    var s = s1
    var t = Array<Int16>(4, repeat:0);
    for (r in 1..4) {
        for (c in 0..4) {
            t[c] = s[r][(c+r)%Nb] // shift into temp copy
        }
        for (c in 0..4) {
            s[r][c] = t[c] // and copy back
        }
    } // note that this will work for Nb=4,5,6, but not 7,8 (always 4 for AES):
    return s // see fp.gladman.plus.com/cryptography_technology/rijndael/aes.spec.311.pdf
}

private func MixColumns(s1: Array<Array<Int16>>): Array<Array<Int16>> {   // combine bytes of each col of state S [§5.1.3]
    var s = s1
    for (c in 0..4) {
        var a = Array<Int16>(4, repeat:0)  // 'a' is a copy of the current column from 's'
        var b = Array<Int16>(4, repeat:0)  // 'b' is a•{02} in GF(2^8)
        for (i in 0..4) {
            a[i] = s[i][c];
            if((s[i][c]&0x80) != 0){
                b[i] = s[i][c]<<1 ^ 0x011b

            }else {
                b[i] = s[i][c]<<1
            }
        }
  
        s[0][c] = b[0] ^ a[1] ^ b[1] ^ a[2] ^ a[3]; // 2*a0 + 3*a1 + a2 + a3
        s[1][c] = a[0] ^ b[1] ^ a[2] ^ b[2] ^ a[3]; // a0 * 2*a1 + 3*a2 + a3
        s[2][c] = a[0] ^ a[1] ^ b[2] ^ a[3] ^ b[3]; // a0 + a1 + 2*a2 + 3*a3
        s[3][c] = a[0] ^ b[0] ^ a[1] ^ a[2] ^ b[3]; // 3*a0 + a1 + a2 + 2*a3
    }
    return s
}

private func AddRoundKey(state1: Array<Array<Int16>>, w: Array<Array<Int16>>, rnd: Int64, Nb: Int64): Array<Array<Int16>> {  // xor Round Key into state S [§5.1.4]
    var state = state1
    for (r in 0..4) {
        for (c in 0..Nb) {
            state[r][c] = state[r][c] ^ w[rnd*4+c][r]
        }
    }
    return state;
}

private func KeyExpansion(key1: Array<Int16>): Array<Array<Int16>> {  // generate Key Schedule (byte-array Nr+1 x Nb) from Key [§5.2]
    let key = key1
    let Nb = 4;            // block size (in words): no of columns in state (fixed at 4 for AES)
    let Nk = key.size / 4  // key length (in words): 4/6/8 for 128/192/256-bit keys
    let Nr = Nk + 6;       // no of rounds: 10/12/14 for 128/192/256-bit keys

    var w = Array<Array<Int16>>(Nb*(Nr+1),repeat:Array<Int16>())
    var temp = Array<Int16>(4, repeat:0)

    for (i in 0..Nk) {
        let r = [key[4*i], key[4*i+1], key[4*i+2], key[4*i+3]]
        w[i] = r
    }
    for (i in Nk..Nb*(Nr+1)) {
        w[i] = Array<Int16>(4, repeat:0)
        for (t in 0..4) {
            temp[t] = w[i-1][t]
        }
        if (i % Nk == 0) {
            temp = SubWord(RotWord(temp));
            for (t in 0..4) {
                temp[t] = temp[t] ^ Int16(Rcon[i/Nk][t])
            }
        } else if (Nk > 6 && i%Nk == 4) {
            temp = SubWord(temp);
        }
        for (t in 0..4) {
            w[i][t] = w[i-Nk][t] ^ temp[t]
        }
    }
    return w
}

private func SubWord(w1: Array<Int16>): Array<Int16> {    // apply SBox to 4-byte word w
    var w = w1
    for (i in 0..4) {
        w[i] = Int16(Sbox[Int64(w[i])])
    }
    return w
}

private func RotWord(w1: Array<Int16>): Array<Int16> {// rotate 4-byte word w left by one byte
    var w = w1
    var list = ArrayList<Int16>();
    for(i in 0..w.size){
        list.add(w[i])
    }
    let toMax = 4 - w.size
    if (toMax >= 0) {
        for(_ in 0..toMax + 1){
            list.add(0)
        }
    }
    var wTemp = Array<Int16>(list.size, repeat:0)
    for(i in 0..wTemp.size){
      wTemp[i]=list[i]   
    }    
    wTemp[4] = wTemp[0];
    for (i in 0..4) {
        wTemp[i] = wTemp[i+1]
    }
    return wTemp
}


private func AESEncryptCtr(plaintext: String, password: String, nBits: Int64): String {
    if (!(nBits==128 || nBits==192 || nBits==256)) {
        return ""
    } // standard allows 128/192/256 bit keys

    // for this example script, generate the key by applying Cipher to 1st 16/24/32 chars of password;
    // for real-world applications, a more secure approach would be to hash the password e.g. with SHA-1
    let nBytes = nBits/8;  // no bytes in key
    var pwBytes = Array<Int16>(nBytes, repeat:0)
    for (i in 0..nBytes) {
        pwBytes[i] = getASCCode(password, i) & 0xff
    }

    var key = Cipher(pwBytes, KeyExpansion(pwBytes));
    var list = ArrayList<Int16>(key);
    for(i in key[..(nBytes-16)]){
        list.add(i)
    }
    var keyTemp = list.toArray() // key is now 16/24/32 bytes long

    // initialise counter block (NIST SP800-38A §B.2): millisecond time-stamp for nonce in 1st 8 bytes,
    // block counter in 2nd 8 bytes
    let blockSize = 16;  // block size fixed at 16 bytes / 128 bits (Nb=4) for AES
    var counterBlock = Array<Int16>(blockSize,repeat:0)  // block size fixed at 16 bytes / 128 bits (Nb=4) for AES
    var t = DateTime.of(year: 1970, month: 1, dayOfMonth: 1)
    let nonce = Int64(Float64((DateTime.now()-t).toNanoseconds())/1000000.0) // milliseconds since 1-Jan-1970
    // encode nonce in two stages to cater for JavaScript 32-bit limit on bitwise ops
    for (i in 0..4) {
        counterBlock[i] = Int16(Int64(triBig(Int32(transBigInt32(nonce)),Int32(i*8))) & 0xff)
    }
    for (i in 0..4) {
        counterBlock[i+4] = Int16(Int64(triBig(Int32(transBigInt32(nonce)/0x100000000),Int32(i*8))) & 0xff)
    }

    // generate key schedule - an expansion of the key into distinct Key Rounds for each round
    let keySchedule = KeyExpansion(keyTemp);

    let blockCount = Int64(ceil(Float64(plaintext.size)/Float64(blockSize)))
    var ciphertext = Array<String>(blockCount, repeat:"") // ciphertext as array of strings
    for (b in 0..blockCount) {
        // set counter (block #) in last 8 bytes of counter block (leaving nonce in 1st 8 bytes)
        // again done in two stages for 32-bit ops
        for (c in 0..4) {
            counterBlock[15-c] = Int16(triBig(Int32(b),Int32(c*8)) & 0xff)
        }
        for (c in 0..4) {
            counterBlock[15-c-4] = Int16(triBig(Int32(b/0x100000000),Int32(c*8)))
        }

        let cipherCntr = Cipher(counterBlock, keySchedule);  // -- encrypt counter block --

        // calculate length of final block:
        let blockLength : Int64 ;
        if (b<blockCount-1){
            blockLength = blockSize;
        }else {
            blockLength = (plaintext.size-1)%blockSize+1
        }

        var ct = ""
        for (i in 0..blockLength) { // -- xor plaintext with ciphered counter byte-by-byte --
            let plaintextByte = getASCCode(plaintext, b*blockSize+i)
            let cipherByte = plaintextByte ^ cipherCntr[i];
            ct += String(Rune(Int64(cipherByte)))
        }
        // ct is now ciphertext for this block
        ciphertext[b] = escCtrlChars(ct);  // escape troublesome characters in ciphertext
    }

    // convert the nonce to a string to go on the front of the ciphertext
    var ctrTxt = ""
    for (i in 0..8) {
        ctrTxt += String(Rune(Int64(counterBlock[i])))
    }
    ctrTxt = escCtrlChars(ctrTxt)
    // use '-' to separate blocks, use Array.join to concatenate arrays of strings for efficiency;
    return ctrTxt + "-" + String.join(ciphertext , delimiter:"-") 
}

/*
 * Use AES to decrypt 'ciphertext' with 'password' using 'nBits' key, in Counter mode of operation;
 *
 *   for each block;
 *   - outputblock = cipher(counter, key);
 *   - cipherblock = plaintext xor outputblock;
 */
private func AESDecryptCtr(ciphertext: String, password: String, nBits: Int64): String {
    if (!(nBits==128 || nBits==192 || nBits==256)) {
        return ""
    } // standard allows 128/192/256 bit keys

    let nBytes = nBits/8;  // no bytes in key
    var pwBytes = Array<Int16>(nBytes, repeat : 0)

    for (i in 0..nBytes) {
        pwBytes[i] = getASCCode(password, i) & 0xff
    }

    let pwKeySchedule = KeyExpansion(pwBytes);
    var key = Cipher(pwBytes, pwKeySchedule);
    var list = ArrayList<Int16>(key);
    for(i in key[..(nBytes-16)]){
        list.add(i)
    }
    var keyTemp = list.toArray() // key is now 16/24/32 bytes long

    let keySchedule = KeyExpansion(keyTemp);
    var ciphertextArray:Array<String> = ciphertext.split("-") // split ciphertext into array of block-length strings

    // recover nonce from 1st element of ciphertext
    let blockSize = 16;  // block size fixed at 16 bytes / 128 bits (Nb=4) for AES
    var counterBlock = Array<Int16>(blockSize, repeat : 0);
    let ctrTxt = unescCtrlChars(ciphertextArray[0]);
    for (i in 0..8) {
        counterBlock[i] = Int16(getASCCode(ctrTxt, i))
    }

    var plaintext = Array<String>(ciphertextArray.size-1, repeat: "");

    for (b in 1..ciphertextArray.size) {
        // set counter (block #) in last 8 bytes of counter block (leaving nonce in 1st 8 bytes)
        for (c in 0..4) {
            counterBlock[15-c] = Int16(triBig(Int32((b-1)),Int32(c*8))) & 0xff
        }
        for (c in 0..4) {
            counterBlock[15-c-4] = Int16(Int32(triBig(Int32((Float64(b)/Float64(0x100000000) - Float64(1))),Int32(c*8))) & 0xff)
        }

        let cipherCntr = Cipher(counterBlock, keySchedule);  // encrypt counter block
        var x = ciphertextArray[b]

        ciphertextArray[b] = unescCtrlChars(ciphertextArray[b]);

        var pt = ""
        var len = ciphertextArray[b].toRuneArray().size-1 
        if (ciphertextArray[b].contains("\r\n")){
            len = ciphertextArray[b].toRuneArray().size 
        } 
        for (i in 0..=len) {
            // -- xor plaintext with ciphered counter byte-by-byte -- 
        
            var ciphertextByte =  getASCCode(ciphertextArray[b], i)
            var plaintextByte = ciphertextByte ^ cipherCntr[i];
            pt += String(Rune(Int64(plaintextByte)))

            
        }
        // pt is now plaintext for this block
        
         plaintext[b-1] = pt // b-1 'cos no initial nonce block in plaintext
    }
    
    return String.join(plaintext,delimiter:"")

}

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  */
private func escCtrlChars(str: String): String {  // escape control chars which might cause problems handling ciphertext
    let tmpsArr = [0, 9, 10, 11, 12, 13, 160, 39, 34, 33, 45]
    
    var s = ""
    var arr = str.toRuneArray()
    for(i in 0..arr.size){
        var c =arr[i]
        var a =String(c).toArray()
        if(String(c) == " "){s += "!${160}!"}

        else if(a.size == 1 && tmpsArr.contains(Int64(a[0]))) { 
            s += "!${a[0]}!"
        }else{
            s += String(c)
        }     
    }
    return s
}  // \xa0 to cater for bug in Firefox; include '-' to leave it free for use as a block marker

private func unescCtrlChars(str: String): String {  // unescape potentially problematic control characters
    var b =str
    var strArr = ["\0", "\t", "\n", "\u{0B}", "\u{0C}", "\r", " ", "\'", "\"", "!", "-"]
    var tmpsArr = ["0", "9", "10", "11", "12", "13", "160", "39", "34", "33", "45"]
    let r = Regex("!\\d\\d?\\d?!").matcher(str)
    var count  = r.allCount()
    var arr = r.findAll() ?? Array<MatchData>()
    for(i in 0..count){
        var md = arr[count - 1 - i]

        var pos = md.matchPosition()
        var start = pos.start
        var end = pos.end

        var m = md.matchString()
        var num = m[1..m.size-1]
        var index = tmpsArr.indexOf(num).getOrThrow()

        b = b[0..start] + strArr[index] + b[end..]
    }
    return b

}

private func getASCCode(str: String, at: Int64): Int16 {
    
    if (str.contains("\r\n")) {
        if (str.startsWith("\r\n")) {
            // 开头包含 \r\n
            if (at == 0) { return 13; }
            if (at == 1) { return 10; }
            if (at > 1) {
                let ch = str.toRuneArray()[at-1] 
                var a = String(ch).toArray()
                var asciicode = Int64(a[0])
                if(a.size == 2){asciicode = toUnicode(a)}
                if (asciicode != 0){
                    return Int16(asciicode)
                } else {
                    return Int16(0)
                }
            }
        }else if (str.endsWith("\r\n")) {
            // 结尾包含 \r\n
            if (at == str.toRuneArray().size - 1) { return 13; }
            if (at == str.toRuneArray().size) { return 10; }
            let ch = str.toRuneArray()[at]
            var a = String(ch).toArray()
            var asciicode = Int64(a[0])
            if(a.size == 2){asciicode = toUnicode(a)}
            if (asciicode != 0){
                return Int16(asciicode)
            } else {
                return Int16(0)
            }
        }
        // /r/n 在字符串的中间
        let tmpStrings = str.split("\r\n")
        if (tmpStrings.size == 2) {
            // 在中间的加这个梳理
            let aStr = tmpStrings[0]
            if (at < aStr.toRuneArray().size) {
                let ch = str.toRuneArray()[at]
                var a = String(ch).toArray()
                var asciicode = Int64(a[0])
                if(a.size == 2){asciicode = toUnicode(a)}
                if (asciicode != 0){
                    return Int16(asciicode)
                } else {
                    return Int16(0)
                }
            }
            if (at == aStr.toRuneArray().size - 1 + 1) { return 13 }
            if (at == aStr.toRuneArray().size - 1 + 2) { return 10 }
            if ((at > aStr.toRuneArray().size - 1 + 2) ) {
                let bStr = tmpStrings[1]
                let bIndex = at - aStr.toRuneArray().size - 2
                let subIndex = bStr.toRuneArray()[bIndex]
                var a = String(subIndex).toArray()
                var asciicode = Int64(a[0])
                if(a.size == 2){asciicode = toUnicode(a)}
                if (asciicode != 0){
                    return Int16(asciicode)
                } else {
                    return Int16(0)
                }
            }
        } else {

        }
    }
    if (at == str.toRuneArray().size) {
        return Int16(0)
    }

    let ch = str.toRuneArray()[at]
    if(ch.toString().toArray().size == 1){
        return Int16(ch.toString().toArray()[0])
    }
    return Int16(toUnicode(ch.toString().toArray()))

}
 
private func toUnicode(arr:Array<UInt8>):Int64{
    var bin =[128,64,32,16,8,4,2,1]
    var a = toBinary(Int64(arr[0]))
    var b = toBinary(Int64(arr[1]))
    var c : Array<Int64> =Array(8,repeat:0)
    for(i in 0..2){
      c[i]=a[1-i]    
    }
    for(i in 2..8){c[i]=b[7-i]}

    var n =0
    for(i in 0..8){n += c[i]*bin[i]}
    return n
}

private func toBinary(n:Int64){
    var arr : Array<Int64> =Array(8,repeat:0)
    var m =n
    for(i in 0..8){
      arr[i] = m%2
      m /=2
      if(m ==0){break}  
       
    }
    return arr
}

private func transBigInt32(bigInt32Num: Int64): Int64 {
    var tmp = bigInt32Num
    if (tmp > 2147483647) {
        let max = 4294967295
        tmp = tmp % (max + 1)
        if (tmp > 2147483647){
            tmp = tmp - max - 1
        }
    }else if (tmp < -2147483648){
        let max = 4294967295
        tmp = tmp % (max + 1)
        if (tmp < -2147483648) {
            tmp = tmp + max + 1
        }
    }
    return tmp
}


private func run() {
    let plainText = "ROMEO: But, soft! what light through yonder window breaks?\nIt is the east, and Juliet is the sun.\nArise, fair sun, and kill the envious moon,\nWho is already sick and pale with grief,\nThat thou her maid art far more fair than she:\nBe not her maid, since she is envious;\nHer vestal livery is but sick and green\nAnd none but fools do wear it; cast it off.\nIt is my lady, O, it is my love!\nO, that she knew she were!\nShe speaks yet she says nothing: what of that?\nHer eye discourses; I will answer it.\nI am too bold, 'tis not to me she speaks:\nTwo of the fairest stars in all the heaven,\nHaving some business, do entreat her eyes\nTo twinkle in their spheres till they return.\nWhat if her eyes were there, they in her head?\nThe brightness of her cheek would shame those stars,\nAs daylight doth a lamp; her eyes in heaven\nWould through the airy region stream so bright\nThat birds would sing and think it were not night.\nSee, how she leans her cheek upon her hand!\nO, that I were a glove upon that hand,\nThat I might touch that cheek!\nJULIET: Ay me!\nROMEO: She speaks:\nO, speak again, bright angel! for thou art\nAs glorious to this night, being o'er my head\nAs is a winged messenger of heaven\nUnto the white-upturned wondering eyes\nOf mortals that fall back to gaze on him\nWhen he bestrides the lazy-pacing clouds\nAnd sails upon the bosom of the air."
    let password = getVariable("SRYPTO_PASSWORD").getOrThrow();
    let cipherText = AESEncryptCtr(plainText, password, 256);
    // log("crypto-aes: cipherText ${cipherText}")
    let decryptedText = AESDecryptCtr(cipherText, password, 256);
    if (decryptedText != plainText) {
        throw Exception("ERROR: bad result: expected ${plainText} but got ${decryptedText}")
    }
}
/*
 * @State
 * @Tags Jetstream2
 */
private class Benchmark {
    /*
   * @Benchmark
   */
    func runIteration() {
       for (_ in 0..8) {
           run()
       }
    }
}

main() {
    let startTime = Timer().getTime()
    for (i in 0..20){
        let startTimeInLoop = Timer().getTime()
        Benchmark().runIteration()
        let endTimeInLoop = Timer().getTime()
        // log("crypto-aes: ms = ${endTimeInLoop - startTimeInLoop} i = ${i}")

    }
    let endTime = Timer().getTime()
    println("crypto-aes: ms = ${Float64((endTime-startTime).toNanoseconds())/1000000.0}")
}

private func triBig(lhs: Int32, rhs: Int32): Int32{
    return Int32(lhs >> rhs)
}

private class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}
