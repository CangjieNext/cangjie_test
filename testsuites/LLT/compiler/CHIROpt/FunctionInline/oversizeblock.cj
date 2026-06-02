// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %frontendCompiler %front_cmp_opt %debugCHIROpt --fchir-function-inlining %n.cj -o %output | compare %f
// ASSERT: scan-not The Apply node in the line:23 and the column:5, was optimized by Function Inline
// ASSERT: scan-not The Apply node in the line:24 and the column:42, was optimized by Function Inline
// ASSERT: scan-not The Apply node in the line:24 and the column:25, was optimized by Function Inline
// ASSERT: scan-not The Apply node in the line:25 and the column:41, was optimized by Function Inline
// ASSERT: scan-not The Apply node in the line:25 and the column:24, was optimized by Function Inline
// ASSERT: scan-not The Apply node in the line:26 and the column:41, was optimized by Function Inline
// ASSERT: scan-not The Apply node in the line:26 and the column:24, was optimized by Function Inline
// ASSERT: scan-not The Apply node in the line:31 and the column:42, was optimized by Function Inline

import std.collection.*

let dataArr: ArrayList<HashMap<String, ArrayList<Int64>>> = ArrayList<HashMap<String, ArrayList<Int64>>>(
    [
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x7b2e0f1f, 0x9f216bee, 0x8a8c089a, 0xe2872c3b])),
                ("pt", ArrayList<Int64>([0x1fac2c99, 0x9d8bbcd3, 0xcf329565, 0xfbabaa50])),
                ("ct", ArrayList<Int64>([0x47b93074, 0x7dcf8cbb, 0x44343ef7, 0x1d347f16]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x5d322ac0, 0xb8a09764, 0xbe57c426, 0xc5ee59eb])),
                ("pt", ArrayList<Int64>([0x2314b9ea, 0x1e07b2e0, 0xc6c1ef6b, 0x1901d1ec])),
                ("ct", ArrayList<Int64>([0xe6f2dbd9, 0x8d5bf2dd, 0x18f86752, 0xb410b76a]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xd9b70c85, 0x7995b14a, 0xdf87077e, 0xc8d1007a])),
                ("pt", ArrayList<Int64>([0x28d89862, 0x702bb678, 0x3a2761bf, 0x209475cb])),
                ("ct", ArrayList<Int64>([0xdf911250, 0x955307bc, 0xe8af5106, 0x45ad3314]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x5aeaad3, 0x3a0d6b1b, 0xdb35c4ce, 0xecb0cca2])),
                ("pt", ArrayList<Int64>([0xf9f1ec88, 0x7876b39c, 0xd7eff360, 0xb2f678d7])),
                ("ct", ArrayList<Int64>([0x2de608fe, 0xd6488482, 0x6a7e10a7, 0x82a379ad]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xab44b8da, 0x4427bebc, 0x2d7345fa, 0x4c056d4e])),
                ("pt", ArrayList<Int64>([0xa2b091e5, 0xee9cce21, 0x80cc4b5d, 0x2a6199a9])),
                ("ct", ArrayList<Int64>([0x4c9e3ce3, 0x71805a41, 0xac906d00, 0xe6170011]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xfb66ebb9, 0xaeda3e46, 0x56f12780, 0x563884ff])),
                ("pt", ArrayList<Int64>([0xcfb17acf, 0xf9e89df2, 0xd1ab5d97, 0xdc669d55])),
                ("ct", ArrayList<Int64>([0x8fe5a947, 0xbf01a32d, 0x6887f090, 0xd891ec39]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xd6f9b245, 0xc3612052, 0x26e6ff63, 0xa09740a4])),
                ("pt", ArrayList<Int64>([0x8b724b0, 0x42dd8ef9, 0x6101afbc, 0x200ee3a2])),
                ("ct", ArrayList<Int64>([0xe0267900, 0xb5c45a9b, 0x17089613, 0xe1a4e23]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x5b04fcf7, 0xaa67f0b8, 0xcc590be6, 0xc5abb013])),
                ("pt", ArrayList<Int64>([0xfe6afdd3, 0x3e4adcbe, 0x26450ba8, 0x48e8adae])),
                ("ct", ArrayList<Int64>([0x91b17402, 0x90cbbd90, 0x7da7edeb, 0xca1c64a6]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xb817db07, 0x7da3084, 0x9acd9b68, 0xcc426b30])),
                ("pt", ArrayList<Int64>([0x2b885ac4, 0x7aab0c75, 0xace53408, 0xfcad62a7])),
                ("ct", ArrayList<Int64>([0x4593c11, 0xf6728aec, 0xfe75ec6a, 0xcfdf8259]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x4b518d08, 0xcd455c3b, 0xd35c6264, 0xe2d167de])),
                ("pt", ArrayList<Int64>([0x389b1d3b, 0x39a79afe, 0xdeee838b, 0x272bd50d])),
                ("ct", ArrayList<Int64>([0xa2c02723, 0x1766b166, 0x8b064003, 0x4346d2e1]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xc8ab4083, 0x2ba41b2b, 0xa18cb3cb, 0xec2320f9])),
                ("pt", ArrayList<Int64>([0xb19281dd, 0x2469cdea, 0x610d3e3c, 0x34b62ae9])),
                ("ct", ArrayList<Int64>([0x1e2221ac, 0x34c93ed9, 0x85a34236, 0xe3e522ec]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x346a2a3c, 0x60c86cc9, 0x511c2b7e, 0x6c3e2c64])),
                ("pt", ArrayList<Int64>([0xda31d45c, 0xa133e016, 0x71d1c27d, 0x40b38cb])),
                ("ct", ArrayList<Int64>([0x58ce0a26, 0xc36e8e6, 0x378ad51f, 0x2b0cdb46]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xcf7c2f2a, 0x40675847, 0xb43a07d8, 0x8fb29ceb])),
                ("pt", ArrayList<Int64>([0x6a5ce184, 0x632e59a3, 0x3b3fcfc7, 0x93f032ab])),
                ("ct", ArrayList<Int64>([0x2ea61704, 0xe10a7290, 0xc5cd64b9, 0x8aa1415b]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xb359ece7, 0xf2f2c0e1, 0xad5dd1cf, 0xaa6c8055])),
                ("pt", ArrayList<Int64>([0xd8eb8a1, 0x8fd2c45, 0xae4d7bcf, 0x42037aa2])),
                ("ct", ArrayList<Int64>([0x6af21ef2, 0xfaa21521, 0x6bb856fb, 0xcc52de03]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xaa809d32, 0xc0ce19df, 0x356ee031, 0x38b76164])),
                ("pt", ArrayList<Int64>([0x96be96de, 0x311e0da7, 0xbf63447a, 0xdbf24d69])),
                ("ct", ArrayList<Int64>([0xfce177bd, 0xee0516ba, 0x9391708a, 0xf9c1db8f]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x59d1083e, 0x2ac1663c, 0x61058d77, 0xa6cd1e48])),
                ("pt", ArrayList<Int64>([0xfa8c98a5, 0x2d9b0911, 0x30acc672, 0x6aa3b8c8])),
                ("ct", ArrayList<Int64>([0x6c2ee654, 0xd7342295, 0x2310a8ac, 0xd3721816]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x807e770f, 0x5c7d0a6d, 0x8e03c450, 0xefb5e8da])),
                ("pt", ArrayList<Int64>([0x2b39a3c3, 0xe88eef4e, 0x9af52bd5, 0xbd4fa780])),
                ("ct", ArrayList<Int64>([0x77b183ed, 0x351d5dc, 0x6973a4e4, 0x1bf74412]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x19b77d81, 0xb1ea196f, 0x580ba972, 0x3c47ec4f])),
                ("pt", ArrayList<Int64>([0x304387e3, 0x2c1f1e99, 0x631804af, 0x8501f83e])),
                ("ct", ArrayList<Int64>([0xe2fe368e, 0x64ba5028, 0x7d50967a, 0xa0e0e824]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xd8b5c5a8, 0xa61d056e, 0xe07bf540, 0x9b9f86d3])),
                ("pt", ArrayList<Int64>([0x4eb55fee, 0xf3b1f6a6, 0x55e3f390, 0x716038f8])),
                ("ct", ArrayList<Int64>([0x8a4dbdf2, 0x6abf7ef0, 0x411cf865, 0x8adf095f]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x73780e87, 0x2e522907, 0x80020b4d, 0xd51ddf79])),
                ("pt", ArrayList<Int64>([0x9ccfcf3c, 0x60c24cb8, 0x6c5f0090, 0x95f624f0])),
                ("ct", ArrayList<Int64>([0xcc30f550, 0x7b05fd0f, 0x2e3af2c1, 0xa9aa7bbf]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x71f7a8ae, 0x79bfb4c1, 0x2ec9b1ab, 0xd050ba4b])),
                ("pt", ArrayList<Int64>([0x46e58641, 0x553135e5, 0x29e51151, 0x1e635f7c])),
                ("ct", ArrayList<Int64>([0x140dfba8, 0xac9a5785, 0x7be19955, 0x15553204]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x8a403e87, 0x69b3ff06, 0x91f4e104, 0xae4ad386])),
                ("pt", ArrayList<Int64>([0xa8d04363, 0x2d3ce601, 0xa8a62e98, 0x7b4749ce])),
                ("ct", ArrayList<Int64>([0xc1d533e1, 0x1cff5802, 0x81f51edb, 0xb2c911a6]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x268ec5e3, 0xc3be7f56, 0x874d4a62, 0x5d1cb4fa])),
                ("pt", ArrayList<Int64>([0x508b5a8, 0x23266504, 0x49259809, 0x984f613b])),
                ("ct", ArrayList<Int64>([0x8f2ff40c, 0x6881c9bc, 0x127d21e3, 0xeb61939e]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x49d7c617, 0x5dc850e6, 0x3ee4fe15, 0x6eca7380])),
                ("pt", ArrayList<Int64>([0x272d0c57, 0x771eedb6, 0x9ef487c6, 0x2805e924])),
                ("ct", ArrayList<Int64>([0x4bf90f2f, 0x796a056a, 0xaed6e05, 0x37670e3e]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x7248fb6d, 0xf191659a, 0x16f3e87c, 0xbe4610dc])),
                ("pt", ArrayList<Int64>([0x7e65a2be, 0x2a696aad, 0x8c18dad9, 0x995ce50b])),
                ("ct", ArrayList<Int64>([0xb3bc19f4, 0xd22bc622, 0x17e7a326, 0xe46d00e3]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x9735f897, 0xddc56776, 0x7b497237, 0xd817ccce])),
                ("pt", ArrayList<Int64>([0xa23689ba, 0x62198c32, 0x3f8f807b, 0xc2e19d82])),
                ("ct", ArrayList<Int64>([0x5f9a793d, 0x3099672e, 0x55049552, 0xc1b61265]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xe96dc40d, 0x43874a0e, 0xcdc908c, 0xc07c7889])),
                ("pt", ArrayList<Int64>([0x7aabf0c3, 0xff72ed56, 0xe33edd44, 0xa71ff508])),
                ("ct", ArrayList<Int64>([0xf17149db, 0xc759983e, 0x81a419, 0xf4c20f05]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xf041241e, 0xbc5a6772, 0x31ef7b9b, 0x2c016536])),
                ("pt", ArrayList<Int64>([0xb3634a7d, 0x8175b83a, 0x908af9e9, 0xd138f1ab])),
                ("ct", ArrayList<Int64>([0xf3a985a, 0xc0163470, 0x9ad8e8b8, 0x2da56e46]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x5864a1f9, 0x71441763, 0xfd6f77d8, 0xe3413436])),
                ("pt", ArrayList<Int64>([0xa409dad, 0xd1a65cd0, 0x5842b145, 0xfe98a73a])),
                ("ct", ArrayList<Int64>([0x7821dae6, 0x2521e82e, 0x86cd538b, 0x73631a39]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x4c61b563, 0x6c70ae5c, 0x2f59cd4e, 0x8ea52846])),
                ("pt", ArrayList<Int64>([0xc7d652ee, 0x4d6cb975, 0x5c8bf459, 0x8393c2be])),
                ("ct", ArrayList<Int64>([0x1be3fa23, 0x56a26042, 0x4bfdb139, 0xe5116c7d]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x5570ce14, 0xc6e3b388, 0x9d174ae3, 0x20fd65d4])),
                ("pt", ArrayList<Int64>([0xf8f91887, 0xe605a6d0, 0x89569eb6, 0x1cbcf72a])),
                ("ct", ArrayList<Int64>([0xc394e35, 0x673d61e0, 0x8533c754, 0xd5e6e572]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x37cb4383, 0x10073ae4, 0x17e2ee6f, 0x8a368e41])),
                ("pt", ArrayList<Int64>([0x88499d9, 0x5d2fee83, 0x407b3012, 0xff2450c6])),
                ("ct", ArrayList<Int64>([0x37aab9d8, 0x8f79bd1b, 0x6ab356a5, 0xce2efddc]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xc6c66307, 0x994fa0ec, 0x1f6f4299, 0x60c24f8])),
                ("pt", ArrayList<Int64>([0x8f5ccfd9, 0x4c8f57b, 0x6aafba08, 0x2034116b])),
                ("ct", ArrayList<Int64>([0xfc9bd5d4, 0xa189ab7d, 0x97f5fae4, 0xc922a247]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xe73cffd7, 0x2ab75abd, 0x50bddce7, 0xf446ec42])),
                ("pt", ArrayList<Int64>([0x175aa79b, 0x4abd3a1, 0x29d3aaed, 0xf5bfd04f])),
                ("ct", ArrayList<Int64>([0xeba81987, 0xe556bacf, 0x1b45a589, 0x7a40ea65]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x43b50d0b, 0x2fa04584, 0x68673051, 0xa13c19e8])),
                ("pt", ArrayList<Int64>([0x2010e7ec, 0x7401a264, 0x786a2c44, 0x6c57a577])),
                ("ct", ArrayList<Int64>([0x6b2e8487, 0x431e26d7, 0xd8470a81, 0x8fad02b6]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x4ea685d7, 0xfd823286, 0x9bbd1b19, 0x59d7bd76])),
                ("pt", ArrayList<Int64>([0x5df33286, 0x51235e59, 0x2fa02371, 0x73e56407])),
                ("ct", ArrayList<Int64>([0x1679e3a2, 0x17691eac, 0x990279ee, 0x22e4c64d]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x69f1b0d3, 0xebb7cf5a, 0xcea72abf, 0xb4f0394e])),
                ("pt", ArrayList<Int64>([0x465fcf12, 0xee930dfd, 0xe7b4fb15, 0xf7d6f9b7])),
                ("ct", ArrayList<Int64>([0x7164f57a, 0x1950d93b, 0x158d578c, 0x14438ff2]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x9be94896, 0x491a371d, 0x7867db32, 0xdf0acf32])),
                ("pt", ArrayList<Int64>([0xc07767c8, 0x9d57e421, 0xbfe3ef21, 0x10d336b6])),
                ("ct", ArrayList<Int64>([0xc377df27, 0x96e348f, 0x3c9bbc26, 0x5bd1cd34]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xe1829b06, 0x39fb051b, 0xd8c98a8b, 0xa4c426b])),
                ("pt", ArrayList<Int64>([0x529f72dd, 0x4f73e256, 0x2ca9a91f, 0x50537110])),
                ("ct", ArrayList<Int64>([0xd380b437, 0xa3a67ca3, 0x841d1293, 0x8a0f6d84]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x933c6bde, 0xa5165d67, 0x5fc7d0f7, 0x4661d281])),
                ("pt", ArrayList<Int64>([0x61f0777f, 0xda1e22cb, 0x464c7172, 0x8c9b1f8c])),
                ("ct", ArrayList<Int64>([0x3481e196, 0xc07b0e5b, 0x8b1ab429, 0xf009c360]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xfcc49655, 0xd5145cab, 0x6d0c9ebc, 0xe5c7e4f5])),
                ("pt", ArrayList<Int64>([0x91fed9d6, 0x3165f17d, 0xd92648ed, 0xe5d403f6])),
                ("ct", ArrayList<Int64>([0xfaff524a, 0xd05fe831, 0xde89dc11, 0x86f57f37]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x985cae48, 0xaea8d84e, 0xd1cba3f6, 0xbfb3f08])),
                ("pt", ArrayList<Int64>([0x361e1cd0, 0xaee44a7b, 0x8664c7aa, 0x18bd04e8])),
                ("ct", ArrayList<Int64>([0xb4cf42cd, 0x92feef3f, 0x62b89709, 0x4e25dca3]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x7752f821, 0xcfe92a67, 0xa7031955, 0x1b1e92da])),
                ("pt", ArrayList<Int64>([0x5db2b567, 0xf47904, 0x2e10f720, 0x956f7621])),
                ("ct", ArrayList<Int64>([0xc8423fba, 0xd372331b, 0x1db66a9c, 0x327c0df0]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x2e88599f, 0xe2a16528, 0xa4422e59, 0x7fe0f149])),
                ("pt", ArrayList<Int64>([0x2c5b5f4, 0x2529450c, 0x240d484f, 0x71180e1c])),
                ("ct", ArrayList<Int64>([0x77eda12b, 0x3bcb0e81, 0xc349853f, 0xaab0a6aa]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x832abf17, 0x1f2a92da, 0x28640921, 0xa3e095ae])),
                ("pt", ArrayList<Int64>([0xb3653a1, 0x2fb0baf3, 0xd649a4df, 0x175696be])),
                ("ct", ArrayList<Int64>([0xa0e2c1df, 0x5ade77f, 0x1e1abea3, 0xe15ee8ad]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xd01aa8d2, 0x640e10c6, 0x373f04e7, 0x2ba5aef0])),
                ("pt", ArrayList<Int64>([0x8b9d8748, 0xd940e284, 0x4f9fe9b9, 0xd7b6e6cf])),
                ("ct", ArrayList<Int64>([0x359a36e7, 0x71c13666, 0xefffd72b, 0x90c9d9b4]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x73a60d36, 0x35769906, 0x3eda856e, 0x85b68146])),
                ("pt", ArrayList<Int64>([0x7ecc5510, 0x55df7e66, 0xf11b430b, 0xd49415bb])),
                ("ct", ArrayList<Int64>([0x1dd6bde0, 0x869f117f, 0x94b54d5c, 0x596340ac]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x6ec41529, 0x3fac0ab8, 0xdd8884e5, 0xfa1cc548])),
                ("pt", ArrayList<Int64>([0xafc2757c, 0xcbf51c9a, 0x59bd7657, 0x407a9684])),
                ("ct", ArrayList<Int64>([0x6af9e59f, 0xdf27e9ba, 0x375dfd99, 0x347c6192]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x74ff3819, 0xf0e770d0, 0x93ad4c77, 0x3874caca])),
                ("pt", ArrayList<Int64>([0x4762c140, 0xb15d86b0, 0x864d4af, 0x3ef5150b])),
                ("ct", ArrayList<Int64>([0xbe9004f8, 0x51a1cd03, 0x6d574c11, 0xc1f2ef13]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x5e98d2d7, 0x9dd27069, 0x9ab3ff68, 0xe3e849ea])),
                ("pt", ArrayList<Int64>([0xa4798523, 0xc9593251, 0x64364ad2, 0x72ef5435])),
                ("ct", ArrayList<Int64>([0xdfd6f23e, 0xd0a23f33, 0x27b89ebf, 0xdd520b45]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x9ae91920, 0xf0196634, 0xc51dfce5, 0xee872e37])),
                ("pt", ArrayList<Int64>([0x25eeebfc, 0x63d39bea, 0x3a84708b, 0xe0a27d30])),
                ("ct", ArrayList<Int64>([0xb84be2d3, 0x3efa90d3, 0xe356784, 0xac56d3bb]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x6d228012, 0xcdd549c3, 0x2c59d79c, 0x3d8cadbd])),
                ("pt", ArrayList<Int64>([0xd005b86d, 0x42beb83b, 0x258b2cf8, 0xc2683aaf])),
                ("ct", ArrayList<Int64>([0x65a726b3, 0x1001fe19, 0x64927419, 0xd005701a]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xa9c1d2fe, 0x401c6a20, 0xdf2d6bcb, 0x6f1fc916])),
                ("pt", ArrayList<Int64>([0xa087a1c8, 0x85a02104, 0xbfe25110, 0xe0c07c3f])),
                ("ct", ArrayList<Int64>([0x2223f2b2, 0xb77f7937, 0x9c8bd0a0, 0xf55334d6]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x8b3a2fcc, 0x26b140a6, 0xa2ca0911, 0x8d30c745])),
                ("pt", ArrayList<Int64>([0x61db2dae, 0xdca8fa78, 0x6526c457, 0x4403afa8])),
                ("ct", ArrayList<Int64>([0xdda3c1f9, 0x2d7c17bc, 0x1b9570df, 0x176b76e6]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xcb4754ec, 0x69f2fd19, 0x40d062e0, 0x637cd468])),
                ("pt", ArrayList<Int64>([0xb0c2c772, 0x79368e16, 0x79eebf16, 0xfc61c8be])),
                ("ct", ArrayList<Int64>([0xf8901aeb, 0x61594a1e, 0xd5286300, 0xba7e4694]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x3b40b89, 0x66cd45a5, 0x908cb243, 0x36465a50])),
                ("pt", ArrayList<Int64>([0x890f7a6a, 0x8ccbb372, 0xb9bd43fe, 0x63874d23])),
                ("ct", ArrayList<Int64>([0x7f66c0e7, 0xe44abcda, 0xd1ec5a84, 0xeddc83aa]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xbbfdff9e, 0x45d766b0, 0xbaa4567f, 0x2f17b62c])),
                ("pt", ArrayList<Int64>([0xae8045a8, 0xa817c52c, 0xf1e2f041, 0xfb98737d])),
                ("ct", ArrayList<Int64>([0x139112d, 0x7a9f11b2, 0x4dab93ca, 0xea2b3173]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x2a75f6a4, 0xef0eec1f, 0x7b1d9dca, 0x857d1444])),
                ("pt", ArrayList<Int64>([0xe61a3da9, 0xc09fbe2b, 0xc80c081, 0x3c079611])),
                ("ct", ArrayList<Int64>([0x894a57a2, 0xc1ebe13b, 0xbed36f57, 0xd5cac260]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x2a9bfe72, 0xf80279de, 0x84ea56b0, 0xb669cade])),
                ("pt", ArrayList<Int64>([0x998e8f9d, 0x76d1a9f6, 0x3d107e51, 0xd4764cbd])),
                ("ct", ArrayList<Int64>([0xa085d54b, 0x9066fab2, 0xc3a5c5c0, 0xed96b33c]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x38fcdb22, 0x8534810a, 0xdff9cb57, 0xe20f492d])),
                ("pt", ArrayList<Int64>([0x6f894a4b, 0x2985f169, 0x2d2a94b9, 0x613b67e1])),
                ("ct", ArrayList<Int64>([0xd85fef9, 0xa795b318, 0x7c276361, 0xdc4d0450]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xd16bd281, 0xc0d5319d, 0xb24f19c3, 0x290b7ab5])),
                ("pt", ArrayList<Int64>([0x949ccc1c, 0xc286887c, 0x268d6286, 0x1e9e8d8a])),
                ("ct", ArrayList<Int64>([0xdca3d4a5, 0x919c7cde, 0xfaffb7a7, 0x4ca30609]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xb783c071, 0xdbeb72a0, 0xef93e164, 0xa462b0b1])),
                ("pt", ArrayList<Int64>([0xdc7aac78, 0xa20ef760, 0x829e1b49, 0x1d96196])),
                ("ct", ArrayList<Int64>([0x697a55ae, 0x4c3b7c4c, 0xb3f328a1, 0xdb3976f2]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xaa3880a1, 0x6dd59a8e, 0x577a10a2, 0x308511c6])),
                ("pt", ArrayList<Int64>([0xa1c10d51, 0x8dbf66a8, 0x6d3e2a6e, 0xae462981])),
                ("ct", ArrayList<Int64>([0xf90d02e, 0xa6750716, 0xeba82229, 0x7923ebc7]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xea113d1d, 0xfd610a31, 0x5d9cf19, 0x915f488a])),
                ("pt", ArrayList<Int64>([0xf6b7ed7a, 0x2cb65f25, 0x77511fd1, 0x611c862])),
                ("ct", ArrayList<Int64>([0x40ea48cb, 0x34b8f0f, 0xaae568b6, 0x364bc8ef]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xb4613491, 0xc118dec6, 0xfe7d9ba1, 0xa280187a])),
                ("pt", ArrayList<Int64>([0xb23163c5, 0x7a8845f, 0xd4d0568a, 0xdcc0a6c3])),
                ("ct", ArrayList<Int64>([0xa86e965f, 0x1a88d273, 0x5f8d4886, 0xb3b1d799]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x813a4b4b, 0x79cf7ae9, 0x6a1b216a, 0xff1e9cd])),
                ("pt", ArrayList<Int64>([0xfd36532f, 0xa1fd8957, 0xd00e6fa, 0x365e1330])),
                ("ct", ArrayList<Int64>([0x46613593, 0x358e8c6d, 0xfbcedbbd, 0xc4b084b]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x747cb7e4, 0x42a5dbf4, 0xfb5124b3, 0xb5252fbf])),
                ("pt", ArrayList<Int64>([0xa6d6169, 0xb28ff164, 0xd6b7bc92, 0x262b24e5])),
                ("ct", ArrayList<Int64>([0x779ce9ad, 0xdd49384f, 0x6093f029, 0xaffa3258]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x25f939b1, 0x7db026dc, 0x3f884a5e, 0x816bb8bb])),
                ("pt", ArrayList<Int64>([0x11349942, 0xec694e2a, 0xcd031adf, 0xd492c602])),
                ("ct", ArrayList<Int64>([0x322cfcec, 0x1fc85396, 0x5db8ae78, 0x61ae1512]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x604c81, 0xbfc05c84, 0x171b445f, 0xff1d8e29])),
                ("pt", ArrayList<Int64>([0x179cee8c, 0xff2a44c4, 0x2e7e2832, 0xcbe78902])),
                ("ct", ArrayList<Int64>([0xc1e24b90, 0x111fded4, 0x6184b602, 0xed128541]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x195b7c15, 0xd0efa529, 0xcc83609a, 0xea1222e7])),
                ("pt", ArrayList<Int64>([0xb19c1c4f, 0xe48379e3, 0x1c20bdbd, 0xb2664625])),
                ("ct", ArrayList<Int64>([0xf0c2cdae, 0xe0422b50, 0xd6bf45b, 0xdc560f83]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xf7eb2535, 0x31a5e37b, 0x95df46f3, 0xe9804b9b])),
                ("pt", ArrayList<Int64>([0xfb669b9b, 0x40db505b, 0xf8d7d0ce, 0xac13cea6])),
                ("ct", ArrayList<Int64>([0xb2c5e1b1, 0x68a14b88, 0x6b044d26, 0xb8cfbcf9]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x14a1b27d, 0x5375302, 0xafe1b865, 0x27181703])),
                ("pt", ArrayList<Int64>([0xd60c8099, 0x25a1eaa3, 0x2348d75, 0xaef1c4da])),
                ("ct", ArrayList<Int64>([0xa29828b2, 0x4882757a, 0xd65f2172, 0x98d39ca]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x13840529, 0xf0811d75, 0x7be2938, 0x88ce405b])),
                ("pt", ArrayList<Int64>([0xefd2b41, 0xa8fcef0a, 0x77d8c4e1, 0x33786519])),
                ("ct", ArrayList<Int64>([0x423d33fd, 0x7f507adf, 0x906b6fcf, 0xb0cf13f2]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x4a5605ad, 0xca5a2670, 0xe4f896f2, 0xff60b4ca])),
                ("pt", ArrayList<Int64>([0x7dfe4329, 0xd7a32a1f, 0x3c389c9, 0x1b64520f])),
                ("ct", ArrayList<Int64>([0x757fe8b4, 0x5927c8cc, 0x65686473, 0xabaff7a3]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x1746d436, 0x1a5a4e48, 0xf217c8db, 0xe2e4906f])),
                ("pt", ArrayList<Int64>([0x45ecfaae, 0x99ec86d, 0x2c1fd76a, 0x7f04cdbc])),
                ("ct", ArrayList<Int64>([0x3719ccc5, 0xfd679661, 0xd5f97796, 0x3fc2976d]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x771d24be, 0x2fc885e, 0xfe5e408e, 0xa6137ca3])),
                ("pt", ArrayList<Int64>([0x6cdc42c3, 0x53bfa457, 0xc0f397a9, 0x6eb20ed7])),
                ("ct", ArrayList<Int64>([0xe32b62d1, 0xba90279a, 0x3f7155eb, 0xcb4bac57]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x43522b3d, 0xe0be38be, 0xe26dfff0, 0x6169bcd2])),
                ("pt", ArrayList<Int64>([0x868e0aec, 0xbeb6873e, 0x7e2ef23b, 0x600a1d7e])),
                ("ct", ArrayList<Int64>([0xd3f1fe24, 0x9078a0b9, 0x4ea9a237, 0x1d1224ec]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xd30640c8, 0xb3e927ae, 0xcec3d51b, 0x4eab0513])),
                ("pt", ArrayList<Int64>([0xead816f8, 0x2410e4, 0x996985f3, 0x30ff8eb7])),
                ("ct", ArrayList<Int64>([0x8ab271aa, 0x921e2ec6, 0xb1411cc1, 0x9dcd9a6b]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xb52a14ad, 0x5621cda, 0xf88ef257, 0x9f56b21d])),
                ("pt", ArrayList<Int64>([0xc7e7fe25, 0xa7e58de, 0x11a80ced, 0xeb5ad273])),
                ("ct", ArrayList<Int64>([0xd5aa9f2c, 0x1585790d, 0x46dcb17f, 0x54ce00ef]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x51870748, 0x1c8a8649, 0xa612a2b5, 0xed2abd5e])),
                ("pt", ArrayList<Int64>([0x9b58b941, 0x1e9a199c, 0xe558bac9, 0x93389c6e])),
                ("ct", ArrayList<Int64>([0x76f16f6b, 0x67321e20, 0xdd72d046, 0x391111d3]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x59fcd7f9, 0x91c887d4, 0xde2d9ef, 0x6d1d22d1])),
                ("pt", ArrayList<Int64>([0xc1282db3, 0x3974b9c4, 0x1e6253e6, 0x2c7179e])),
                ("ct", ArrayList<Int64>([0x282e8ee2, 0x209ad250, 0x99581653, 0x832c1125]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xd287872b, 0x811019f0, 0x192e543e, 0x81c10ecf])),
                ("pt", ArrayList<Int64>([0x675414f1, 0x90ae80d9, 0xc0d7afdb, 0x1ffe0cc2])),
                ("ct", ArrayList<Int64>([0xb28a3f29, 0x12617ffc, 0xbb6c52a5, 0x9c6c94cc]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x329146b2, 0x304a8961, 0xe7dee1c4, 0x8904c632])),
                ("pt", ArrayList<Int64>([0x7112fdfd, 0xe0a6b563, 0xf01d5d72, 0x44cf9c26])),
                ("ct", ArrayList<Int64>([0xb260656a, 0xe8e1c097, 0xfa339cf5, 0x6d0f03ed]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x9dcc3903, 0xcffc6848, 0x7aa31522, 0x4935f56])),
                ("pt", ArrayList<Int64>([0xf8c485ba, 0x273fd593, 0x120e3fc4, 0xcb4db98c])),
                ("ct", ArrayList<Int64>([0xb255376, 0x80cdc317, 0x6e470426, 0x62603b4f]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xb38c19e3, 0xb7214a83, 0xd268e76b, 0x2c93ea8c])),
                ("pt", ArrayList<Int64>([0x140807a0, 0xbc741d36, 0xd7e1854a, 0x685f678])),
                ("ct", ArrayList<Int64>([0x6af3d63b, 0x65d16570, 0x7bd01fc1, 0xf8a064a5]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xe5d2f0b5, 0x99f89d5c, 0x89d8f8d8, 0x1f92251a])),
                ("pt", ArrayList<Int64>([0xe8461085, 0x7843866e, 0xd3ae5012, 0x14db2a1f])),
                ("ct", ArrayList<Int64>([0xfe6d48cd, 0x10028378, 0x333c22f, 0xc4a5c5aa]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x4469f8d2, 0x9fc22df2, 0xf17dfd2b, 0x29b92b0f])),
                ("pt", ArrayList<Int64>([0xc2acad79, 0x2109880f, 0xf72077a0, 0xddcb2d76])),
                ("ct", ArrayList<Int64>([0xaefa32f1, 0x86fbd55, 0x44fd53d1, 0xd3cd9ab0]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xc9827df4, 0x2d756e9, 0x33ebe02d, 0x633ede6a])),
                ("pt", ArrayList<Int64>([0x285d1b81, 0x4100abbe, 0xab0d02b, 0xba39d2b5])),
                ("ct", ArrayList<Int64>([0x9a99dcf5, 0x43857cc7, 0x8108eb6b, 0xcae26e3a]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x7a979b6, 0x219f50ae, 0x3ba39050, 0x3e2ebb29])),
                ("pt", ArrayList<Int64>([0xd14fd54c, 0xdd7e6b7f, 0x64b90f3f, 0x6dad1208])),
                ("ct", ArrayList<Int64>([0xb0e93229, 0xbfaae4a0, 0x7ea557e5, 0xaa5599d8]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x2965ea87, 0x75916b8e, 0x8743df6a, 0x87865978])),
                ("pt", ArrayList<Int64>([0x62fdf99e, 0x7999dc46, 0x45cce3a6, 0xf6e2cb18])),
                ("ct", ArrayList<Int64>([0x2436bd58, 0xf107369f, 0xd3c1b77a, 0x112e3c16]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x802e3b31, 0x15ed5be0, 0x75d36f91, 0x2323828f])),
                ("pt", ArrayList<Int64>([0x8486574a, 0xb9c2756d, 0x88f397c0, 0x3d6f7f4a])),
                ("ct", ArrayList<Int64>([0x69c4c864, 0xd786ee76, 0xd292d2f1, 0x5964a803]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x4d1bd7c6, 0x3bcc2a61, 0x16f57bb, 0x8ac6fb75])),
                ("pt", ArrayList<Int64>([0xf92f5395, 0x37f09158, 0x9bb9daea, 0x21d59ff4])),
                ("ct", ArrayList<Int64>([0x93a9a897, 0x544859d4, 0x5f545567, 0x5a76d3ad]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x1107c413, 0xe8cf7e26, 0xe155c44a, 0xe71a38ad])),
                ("pt", ArrayList<Int64>([0xb701b629, 0xd9c36227, 0x17ea1ccb, 0x2aa21c2b])),
                ("ct", ArrayList<Int64>([0xc5b8934f, 0xcc758d3, 0xd1ca45ac, 0x9f0c919]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x3897401d, 0x3ffb3535, 0x1608e1a8, 0x3b107d95])),
                ("pt", ArrayList<Int64>([0x88e79eae, 0x49440345, 0xe8674688, 0x518ed3d8])),
                ("ct", ArrayList<Int64>([0xf86055ff, 0xdadef5e, 0x3047cab8, 0xc92e75c4]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xabe527b2, 0x1ed94dc4, 0x4a6e92b0, 0x8df6849a])),
                ("pt", ArrayList<Int64>([0xab2c701f, 0x7d69bad1, 0xc20a9f60, 0x3270ed8d])),
                ("ct", ArrayList<Int64>([0x5cb278dd, 0xa1540627, 0x527e534b, 0x85d294c6]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x2602e967, 0xad353077, 0x52ea726f, 0x698b0a0d])),
                ("pt", ArrayList<Int64>([0x6fe7369a, 0xd61aea8, 0xd0d4ea52, 0xcecfe066])),
                ("ct", ArrayList<Int64>([0x2d54dd07, 0x35411569, 0xa5701f56, 0x41916b11]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x1f1513ca, 0x6a283a32, 0x28d53395, 0xd8c1cb7f])),
                ("pt", ArrayList<Int64>([0xa9ef661d, 0xf5dbd1ac, 0xabb4263e, 0x6483a9d3])),
                ("ct", ArrayList<Int64>([0xb2b1d081, 0xeb6bbdd1, 0x71b1b63b, 0x9072715b]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xbe8e0044, 0xc13f5cdf, 0x299b260c, 0x9806fd48])),
                ("pt", ArrayList<Int64>([0x745fd894, 0xb9082b3c, 0xa50f0598, 0x4c6353e5])),
                ("ct", ArrayList<Int64>([0x134af3cc, 0x268a662e, 0x9cc48864, 0xc55a2172]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x1f3660f7, 0xc8958a88, 0x249ca71c, 0x4e8a4915])),
                ("pt", ArrayList<Int64>([0xb91d29b2, 0xf01ba1e7, 0x7bcf43f, 0xbe1c7a5d])),
                ("ct", ArrayList<Int64>([0x743630d3, 0x51e59817, 0x10c389f7, 0x614c7f13]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xfc77fea6, 0xf8c7f205, 0xa796ae37, 0xaa3fd4ae])),
                ("pt", ArrayList<Int64>([0xcec3efdd, 0x1f2937f8, 0xf3946d74, 0xd055b910])),
                ("ct", ArrayList<Int64>([0xde55d84c, 0x2c2629bb, 0x7424b72c, 0x5186ad9c]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xa177b624, 0x9a2d4e9, 0x59a9e3af, 0x350991bf])),
                ("pt", ArrayList<Int64>([0x83022809, 0x2c5059b1, 0x1f784e9a, 0xa06c4858])),
                ("ct", ArrayList<Int64>([0x531361f7, 0xaefee125, 0x6f1e2c27, 0x6770399]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xd6c9307, 0xc01e2e0b, 0x37b6a20b, 0xb318a00f])),
                ("pt", ArrayList<Int64>([0x62df2f3b, 0xb999937d, 0x26df56ea, 0x2d85423a])),
                ("ct", ArrayList<Int64>([0x4d3777, 0x67d5507b, 0xa6f5d44d, 0x96764128]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x6add669c, 0x5f7b8fca, 0x9fc61635, 0x16670d0e])),
                ("pt", ArrayList<Int64>([0x50dcc40e, 0xd31624c3, 0x22f3b2c0, 0xf0f6b444])),
                ("ct", ArrayList<Int64>([0x70310362, 0x421ade, 0xf3d53276, 0x7f41de34]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x2958b759, 0x3ab845f5, 0xdc9f4d70, 0xdc967ebe])),
                ("pt", ArrayList<Int64>([0xfeb640bf, 0xc1805cae, 0x64ef2388, 0x23ee9a3])),
                ("ct", ArrayList<Int64>([0x855cd47d, 0xcce9014f, 0x1b69a5e3, 0x1787ecb0]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x606358ca, 0x703ce1a2, 0xe03ce5ee, 0x4bcf7d21])),
                ("pt", ArrayList<Int64>([0xba49a95a, 0xfeccf9a6, 0xf63016c4, 0xa33e041a])),
                ("ct", ArrayList<Int64>([0x16763798, 0x73b11903, 0x9708da6b, 0x71ae27f2]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xc82e3845, 0x688e4d0e, 0xff101513, 0x9bffa951])),
                ("pt", ArrayList<Int64>([0x9c9f42ab, 0xdf04777c, 0xb68e5865, 0x9a04b539])),
                ("ct", ArrayList<Int64>([0x928912df, 0xbfd1a16a, 0xf405ff79, 0x7f3b2b60]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x489f488f, 0x5be787cf, 0x31772239, 0xccb1bd89])),
                ("pt", ArrayList<Int64>([0x7c75ea3, 0x63b78ddd, 0x2d0694c5, 0xda964635])),
                ("ct", ArrayList<Int64>([0x223fe890, 0x11cd68c7, 0x6724eaa7, 0x7049a1ae]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x508637c3, 0x51c8a9a7, 0x1fb224d1, 0xe16d143c])),
                ("pt", ArrayList<Int64>([0xa4d2d4c2, 0x98e999d9, 0x5a3599fb, 0xdbd34c5a])),
                ("ct", ArrayList<Int64>([0x1c72fe7b, 0x369f27fb, 0xef51165f, 0xa084fe15]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x30a42c34, 0x1646e40c, 0xb8e33b22, 0x61583ef4])),
                ("pt", ArrayList<Int64>([0xdcb4a8e1, 0x6ee1e9d, 0x97c90bd8, 0x3875a1c])),
                ("ct", ArrayList<Int64>([0x26082e4d, 0x8192243a, 0xbf0991a5, 0xa8fce8e5]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x801b0e74, 0x8a7f2c6f, 0x2f6b8e1f, 0xcaaef6b9])),
                ("pt", ArrayList<Int64>([0xa203a9e2, 0x87abba9a, 0x2083e37c, 0x68c58c97])),
                ("ct", ArrayList<Int64>([0xfb058859, 0xb733bf53, 0xdf4f8974, 0x460ccb13]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x9efd462a, 0xf250be55, 0x6e51fa20, 0xfbf30c65])),
                ("pt", ArrayList<Int64>([0x7dc55bfd, 0x4d3c2975, 0xd05e42ee, 0xd0a25066])),
                ("ct", ArrayList<Int64>([0xc14c968f, 0x7f2c229f, 0xdc8b6068, 0x5604741f]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x923d9a4e, 0x13ae66f4, 0xc3220048, 0x437770aa])),
                ("pt", ArrayList<Int64>([0xe1d5a22d, 0x8a817840, 0x86757ada, 0xd35316e2])),
                ("ct", ArrayList<Int64>([0x20eecb77, 0x6a8dcc22, 0xbaa8c108, 0xb53a1742]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xd8d21904, 0x363685ce, 0xdea0c6cd, 0xbfaee950])),
                ("pt", ArrayList<Int64>([0xfc480754, 0xe441f9ea, 0xc1776908, 0xcf1c69bc])),
                ("ct", ArrayList<Int64>([0x2959dfbb, 0x1dc33de9, 0xbc4db4a6, 0x5a9da783]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x718b52d3, 0x83f425d0, 0xa3d621d5, 0xcafeebb4])),
                ("pt", ArrayList<Int64>([0xd1acd5de, 0x2de5a356, 0xad9f34dc, 0x120ef664])),
                ("ct", ArrayList<Int64>([0xdba1e77, 0xffe6128f, 0x674636f8, 0x1561dd0e]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xe0116da1, 0x90d7ebbd, 0x61fb05e3, 0xf28ce553])),
                ("pt", ArrayList<Int64>([0xa6f8d875, 0xc94c335, 0x8043fd11, 0x1011991e])),
                ("ct", ArrayList<Int64>([0x30357af0, 0xb0115263, 0x4f6631a0, 0x14bfd3d0]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xc8e6fde7, 0x8697e6c8, 0xa93a8d2e, 0xc78dbd11])),
                ("pt", ArrayList<Int64>([0x4653c7ed, 0x8d438db2, 0xa888d199, 0x98547ba3])),
                ("ct", ArrayList<Int64>([0x503f5fcb, 0x6ac1044f, 0x8a42fe21, 0x67c89d33]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x7e08ecff, 0xb27be0eb, 0xb582f99b, 0x8bff4734])),
                ("pt", ArrayList<Int64>([0x5a7b1354, 0x8512cbd9, 0x6e76b171, 0x1e02dff2])),
                ("ct", ArrayList<Int64>([0x53097001, 0x1333c203, 0x5f129e72, 0x6ab817d5]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x77d3e1df, 0xebd941cd, 0x760c8942, 0xb3102b69])),
                ("pt", ArrayList<Int64>([0x7568a710, 0x4d93656b, 0x62d29b50, 0x4f46ff7a])),
                ("ct", ArrayList<Int64>([0xdacd8d71, 0xea654086, 0x9d71fdc4, 0xe60480c2]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x829be282, 0x6c2f01fd, 0x2ae28c3c, 0xbd98b9de])),
                ("pt", ArrayList<Int64>([0xa40c2d3c, 0x15f408a9, 0x13ab2ffe, 0x437dd775])),
                ("ct", ArrayList<Int64>([0xe067caa7, 0x2b403600, 0x4e39a5b0, 0xdf605396]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x39a65934, 0xe9ae9e96, 0x9618bd26, 0xa7186ee])),
                ("pt", ArrayList<Int64>([0x7e7c6bf, 0x46cf1cf2, 0x919d9fe3, 0xc04c0e63])),
                ("ct", ArrayList<Int64>([0xb4a700d8, 0x5c9c58f1, 0xea24dc04, 0x67ab7393]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xc03eb0ff, 0xb318a629, 0x7167b736, 0xc88234b2])),
                ("pt", ArrayList<Int64>([0x2c1834ee, 0x12cf5c41, 0x6df7c99b, 0xff723c98])),
                ("ct", ArrayList<Int64>([0x6258f82e, 0xe83622ca, 0xf594589b, 0x4c4c3762]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x5fed884c, 0x91974af3, 0x747afd8, 0x2d5059e2])),
                ("pt", ArrayList<Int64>([0x31f7f09f, 0x11d64243, 0x4e7b9c85, 0xccad7e0c])),
                ("ct", ArrayList<Int64>([0x5be308ee, 0x2190cdb7, 0x6b677522, 0x76f11153]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xc17d2933, 0xa3599bff, 0x4549a3a0, 0xa212b2c1])),
                ("pt", ArrayList<Int64>([0x4b1aaf99, 0xe2b15ce0, 0x6c12adeb, 0x86011866])),
                ("ct", ArrayList<Int64>([0x80d3cf6b, 0x5d30e7b6, 0xa778e9e2, 0xd289c7b8]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xadc2fad5, 0x9aec9e3e, 0x7024cacc, 0xb33993db])),
                ("pt", ArrayList<Int64>([0xe1f95f0e, 0xbd5e43ab, 0x6203991f, 0x52cc7cdc])),
                ("ct", ArrayList<Int64>([0xda52ecf1, 0x5a129256, 0xeb1b7a67, 0x7d66d115]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x456bfcec, 0x8583accf, 0xc9afc526, 0x7214281f])),
                ("pt", ArrayList<Int64>([0xa21dfc77, 0xffdd5443, 0xb8674a45, 0x784d369b])),
                ("ct", ArrayList<Int64>([0xf884f17d, 0x17fdd038, 0x403e6a37, 0x729ee4b]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xd2a8f47d, 0xc5c2280d, 0x848fb9c8, 0xd7e0ceb0])),
                ("pt", ArrayList<Int64>([0xf76cd274, 0xd7c72ae6, 0xfb55f9d7, 0xa131c412])),
                ("ct", ArrayList<Int64>([0x7a937483, 0x9dbed5bf, 0x48a5dc45, 0xf337f8ee]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x7bbb9ec1, 0xe4296e29, 0xf5e0745b, 0xebbdbc20])),
                ("pt", ArrayList<Int64>([0xdd8154d6, 0xf0f761d3, 0xb0ddf34a, 0xb63737ef])),
                ("ct", ArrayList<Int64>([0x9422716f, 0xc19609e7, 0x9d3fa08c, 0xe531e09c]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xa6f2f1bb, 0xfa0d62b1, 0x8c394721, 0x2f63daab])),
                ("pt", ArrayList<Int64>([0x3452dff5, 0x385166b9, 0xf9acc1eb, 0x4f0aebfd])),
                ("ct", ArrayList<Int64>([0x21f05ed2, 0x566b6650, 0x4fed84d, 0xe6c7c563]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xabd9ad1e, 0x5d460bb1, 0x2176630d, 0xdd65d8cd])),
                ("pt", ArrayList<Int64>([0x43786db5, 0x41560cf6, 0x57c85a35, 0x4cfa3d39])),
                ("ct", ArrayList<Int64>([0x9b6ae09c, 0x1f5a08a9, 0x4f355cf9, 0xea8f34ef]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x5ac83332, 0x119a9069, 0x71304a62, 0xb4f1393f])),
                ("pt", ArrayList<Int64>([0x97d12e77, 0xfcd7fffd, 0xd7aba29b, 0xd9789c95])),
                ("ct", ArrayList<Int64>([0xdb711c0c, 0x50c517aa, 0xe8abcc89, 0xdcec85ec]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x2d0daebf, 0xaa511be6, 0x1bab4b63, 0x53fe020d])),
                ("pt", ArrayList<Int64>([0xd89b15eb, 0x4feb62ed, 0x6164978b, 0x59d2f09f])),
                ("ct", ArrayList<Int64>([0x77b8e854, 0x80f95279, 0xf398cfb9, 0x21f44d38]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x1133161c, 0xf58db6c8, 0xd885d8c7, 0x86948fdd])),
                ("pt", ArrayList<Int64>([0xd8acc649, 0x640b8f15, 0xa80fb57e, 0xaf9636df])),
                ("ct", ArrayList<Int64>([0x6fb144d8, 0x9a3655f, 0xf53baddd, 0xb49a647b]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xca957c5d, 0x8b56553c, 0xf04556ef, 0xc5e81fea])),
                ("pt", ArrayList<Int64>([0x5df14e65, 0x8cce354f, 0x985e6f33, 0x30b3b345])),
                ("ct", ArrayList<Int64>([0xb50026c9, 0xfa057010, 0x9b5cac9f, 0xc1cfc8e8]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xcae6b52c, 0xf5f8703c, 0xb25ab5c7, 0xdc78cbe8])),
                ("pt", ArrayList<Int64>([0x30b12c36, 0xa99f7247, 0xddb92cbb, 0x3915aa71])),
                ("ct", ArrayList<Int64>([0xeb00a9da, 0xe9bd4a93, 0x75685696, 0x64c0eee9]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xf83bc587, 0x79bca429, 0x6e77eab9, 0xd1138732])),
                ("pt", ArrayList<Int64>([0x7ffe1a25, 0x19eb949, 0x922d1173, 0xa77b06c])),
                ("ct", ArrayList<Int64>([0x46450368, 0xdbceb6a9, 0x96a55cc3, 0xe0585428]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x2e063f97, 0x6c749430, 0x51ec46b6, 0xcbfebb9d])),
                ("pt", ArrayList<Int64>([0x2f868545, 0x9d2e5d07, 0xd09df4f2, 0xc9161c77])),
                ("ct", ArrayList<Int64>([0x5220c33b, 0xa1759a42, 0x8222e66c, 0x1dc1bac4]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xa6d6a87d, 0xa88aa9a1, 0xcbcf0373, 0x73491351])),
                ("pt", ArrayList<Int64>([0xebe4ee73, 0xca960d6c, 0xa288d539, 0x1011c2e5])),
                ("ct", ArrayList<Int64>([0xb794b41f, 0xcf61e897, 0x74c262c9, 0x693beb4e]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xc836ab67, 0xc52fb97f, 0x40ab110a, 0x495a13c9])),
                ("pt", ArrayList<Int64>([0x8ecb5de5, 0x5f6a9d5a, 0xc5d0ecbb, 0x97e66ec3])),
                ("ct", ArrayList<Int64>([0x4f66fd08, 0x7c3585e8, 0xdfd13f34, 0x696838d3]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x65877cdb, 0x2fab207e, 0x3b472687, 0x4ca9e635])),
                ("pt", ArrayList<Int64>([0xd50a5496, 0x15666519, 0x7ceb9231, 0xf4ea5980])),
                ("ct", ArrayList<Int64>([0x7cfc9603, 0x7481780, 0x84fde342, 0x5184020b]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xfbff3054, 0x322acf04, 0x7846f106, 0xc96fcfef])),
                ("pt", ArrayList<Int64>([0xd29d1968, 0x18715033, 0x10e1ade, 0x1c4977b2])),
                ("ct", ArrayList<Int64>([0xbeb90d7b, 0xf068c41b, 0xfdae5713, 0x6e73e12f]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xbc6ac4ef, 0xb7b9d5cd, 0x7253c2ce, 0xc3f03ac8])),
                ("pt", ArrayList<Int64>([0x2ee195c7, 0xf175be6f, 0xcc98373d, 0x894e15aa])),
                ("ct", ArrayList<Int64>([0xffb23102, 0xb505cd48, 0x823c39, 0x1c7f83e5]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x1ca0e486, 0xd782b6ca, 0xec043384, 0x5fe8ed9])),
                ("pt", ArrayList<Int64>([0xa7f24256, 0x538a664e, 0x2e9a09fe, 0x22466afb])),
                ("ct", ArrayList<Int64>([0x3f857671, 0x26c4d5e0, 0x2a562881, 0x79cacc57]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xf431f6b4, 0x686d6bb4, 0xb8d3dbf4, 0x271a04bc])),
                ("pt", ArrayList<Int64>([0x1149de10, 0x8933d01d, 0x71053a84, 0x86c41d33])),
                ("ct", ArrayList<Int64>([0x4a71bb1d, 0x986debef, 0xb06c9707, 0x4237ca47]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xe59af5cf, 0xd839a55e, 0xda6591d1, 0x1f3c37f9])),
                ("pt", ArrayList<Int64>([0x1da87528, 0x24d7f30d, 0x62eac1b7, 0xc73e0d5e])),
                ("ct", ArrayList<Int64>([0xcab6c9ed, 0xf0714d6b, 0x42f11981, 0x39295e54]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xb1fd1c1b, 0x3a95bf77, 0x991f5be2, 0x62564178])),
                ("pt", ArrayList<Int64>([0x984873b8, 0x9fcdfdfb, 0x251f4e1f, 0x21039c67])),
                ("ct", ArrayList<Int64>([0xd1235be3, 0xb3b1d1c0, 0xac5e17bf, 0xbf8dbc20]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x73650918, 0xa006f24b, 0xb819f978, 0x73ed5e4f])),
                ("pt", ArrayList<Int64>([0xff21faf7, 0xc25c5cef, 0xb70990a1, 0xaea3de8])),
                ("ct", ArrayList<Int64>([0xa02aac1b, 0x98574b66, 0x5e1dbe6e, 0xa40c0786]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xe3fa92c0, 0x45d17392, 0x996af1af, 0x43fb2eb4])),
                ("pt", ArrayList<Int64>([0xf271b583, 0xe420ee4c, 0xe607e90f, 0x68d07af6])),
                ("ct", ArrayList<Int64>([0x59dc075b, 0x3bcec29c, 0xc664c1ea, 0x25121ee5]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xdc4571f9, 0x21d11694, 0xd904dbd2, 0xb6dc9834])),
                ("pt", ArrayList<Int64>([0xe7ab20b7, 0xa100f735, 0xacfbf33, 0xbfcf9118])),
                ("ct", ArrayList<Int64>([0x43bb2e9d, 0x889fb716, 0x936b4d91, 0xb99044d7]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x266df37d, 0xe6de6e69, 0x431e4d97, 0x204483cb])),
                ("pt", ArrayList<Int64>([0xedd43ffb, 0xf5e326cb, 0xf7b1ee34, 0x78879ad8])),
                ("ct", ArrayList<Int64>([0x9339f012, 0x61d7e689, 0x230e5f5d, 0xeeea5c4c]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xa3f6fa11, 0xd97e8f9d, 0x1e8b845a, 0xaa1e90f8])),
                ("pt", ArrayList<Int64>([0x899cfe0b, 0x2d09fe43, 0x7a74714b, 0xede7171b])),
                ("ct", ArrayList<Int64>([0x47901dd8, 0x20a82ab5, 0x9fa0c99b, 0x3fec09cf]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xa8262d21, 0x9985f1e, 0x9335d181, 0xd7be689b])),
                ("pt", ArrayList<Int64>([0xf77619e3, 0x7398ae3a, 0x90c9c20e, 0x3af81767])),
                ("ct", ArrayList<Int64>([0x377f053e, 0xd41c5f64, 0xde62a8c3, 0x1d65a224]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x7055509e, 0x689f8138, 0x86a1e7a8, 0x832faa09])),
                ("pt", ArrayList<Int64>([0x996713f9, 0xe44b816d, 0x44e862fd, 0xa1adce85])),
                ("ct", ArrayList<Int64>([0x67cc8adf, 0x5b984b6b, 0xac15686, 0x87cbe82d]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xdeb000f1, 0xb02bb86b, 0xdb5ca902, 0x62c72fca])),
                ("pt", ArrayList<Int64>([0x4d53fe0, 0x38cd3b6f, 0x246110dc, 0x78c41f89])),
                ("ct", ArrayList<Int64>([0x8ea14af5, 0xab06577c, 0x638f2a9e, 0x7632ba3e]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x4e53e56b, 0x2e1e1cb4, 0x8630c1ea, 0x9dc162f3])),
                ("pt", ArrayList<Int64>([0x38283990, 0xfd963315, 0x7d887ff3, 0x135e4ae2])),
                ("ct", ArrayList<Int64>([0xd9472249, 0x51e22395, 0x3ba4b1b7, 0x9b96a8b1]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x8fda4b39, 0x179a488a, 0x29467ac4, 0x58af6adc])),
                ("pt", ArrayList<Int64>([0x8c5a09eb, 0xe47945af, 0x86a69c85, 0x89858f5e])),
                ("ct", ArrayList<Int64>([0x92e800c, 0xdf294398, 0xc828f6ac, 0xd23d195]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x59810e07, 0xa2677e01, 0x62476399, 0xc0ec5857])),
                ("pt", ArrayList<Int64>([0x15d0b9d8, 0x2abef40, 0x43cf0c65, 0x9e24a019])),
                ("ct", ArrayList<Int64>([0xb7f109e, 0xa037a4dc, 0xbd9a0f7a, 0x697f96ae]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x958343cd, 0x4ab40b1a, 0x88c54b7c, 0xee8e68fe])),
                ("pt", ArrayList<Int64>([0x8ab9024f, 0xc6409608, 0x85ebd763, 0xb27eaf87])),
                ("ct", ArrayList<Int64>([0x55c493c5, 0xffaca80a, 0x70e223b7, 0x4810ca0]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xa8943367, 0x9d06b239, 0xa0b7495d, 0x62179c1a])),
                ("pt", ArrayList<Int64>([0x313edf1a, 0xc26451af, 0x6cda0fe9, 0x2cf9c4b])),
                ("ct", ArrayList<Int64>([0x13b4bf41, 0xc52803e, 0x3ec1b866, 0xadc9bb88]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xaa576419, 0xebea7730, 0x50085535, 0xdc62b609])),
                ("pt", ArrayList<Int64>([0x25c6e2fa, 0xaef3dd2d, 0xe2e278f, 0xebced828])),
                ("ct", ArrayList<Int64>([0xc0b14702, 0x3ead73c4, 0x63433395, 0x45aa054c]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xf82c019, 0x9ffc17c9, 0x4494452, 0x7a75cc8f])),
                ("pt", ArrayList<Int64>([0x9b7c80e0, 0xa8a8d7cd, 0xae2c39e6, 0x9cbe29ca])),
                ("ct", ArrayList<Int64>([0x8dac5817, 0xf9743f86, 0xb51bedee, 0xef4c5ca9]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xb98e2700, 0x872fa265, 0x74cdcbe9, 0x6281dc26])),
                ("pt", ArrayList<Int64>([0xa570ca63, 0x5d482de1, 0x6f799138, 0x436e6267])),
                ("ct", ArrayList<Int64>([0xe7e83af2, 0x996e9705, 0xfdb14da0, 0x12bcd65]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x387a7447, 0x871f99a6, 0xd1351510, 0x172835c0])),
                ("pt", ArrayList<Int64>([0xc175a7ed, 0xcbaa82e5, 0x30db5f1c, 0xcfa5b91a])),
                ("ct", ArrayList<Int64>([0x2af3c541, 0x6ebd442f, 0x6434b245, 0x4fa6b582]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x3072f10a, 0xf146f5ca, 0x3e3d91ba, 0xf1062436])),
                ("pt", ArrayList<Int64>([0x435a8c40, 0x6d57f560, 0x9e1916b, 0x728b4768])),
                ("ct", ArrayList<Int64>([0xf5e21898, 0xe16a92d5, 0x7c7e50, 0x787ed601]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x1daa4bcd, 0xde8f4467, 0xd8c2d054, 0xae7cbd94])),
                ("pt", ArrayList<Int64>([0x2237d057, 0x9f26a5ca, 0x96bd2856, 0x5c5598c6])),
                ("ct", ArrayList<Int64>([0x246d3055, 0xb73e6e83, 0x734c262, 0x1ad9b717]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xdfbcc70b, 0xe7fa2ef8, 0x442cabaa, 0xa8d4188f])),
                ("pt", ArrayList<Int64>([0x40ee3ffc, 0xd0af8030, 0x57a541a0, 0x55f49b1a])),
                ("ct", ArrayList<Int64>([0xbaf3bfc7, 0x7462759e, 0xf1fecdba, 0xc7ae9963]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xefbf9c33, 0x26a73d21, 0x35c26fa, 0x6e9f2522])),
                ("pt", ArrayList<Int64>([0x3f1e6fba, 0x1867dc7d, 0x65fe00f5, 0x8e1e949c])),
                ("ct", ArrayList<Int64>([0x9311c349, 0x1d92188d, 0x615ea3fc, 0x9be1d25b]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x8987ba67, 0x7a094eff, 0xacea2fda, 0xb4deae55])),
                ("pt", ArrayList<Int64>([0xa5a54c7f, 0x24d1d60b, 0x3f834ebc, 0x2204018f])),
                ("ct", ArrayList<Int64>([0xc553a2f3, 0xe27df1fb, 0xb074fc5, 0x41767525]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x3f8ae7e, 0x99ec1b81, 0x56d2e457, 0x7b219de0])),
                ("pt", ArrayList<Int64>([0x16d60726, 0x4a50a507, 0xd86940a2, 0xf10b979f])),
                ("ct", ArrayList<Int64>([0x9ed28439, 0xa035f98c, 0xfcbfa4ad, 0xe5f8e3f4]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x877465b3, 0xb7a2fcd8, 0xfa7fa572, 0xec36c3a4])),
                ("pt", ArrayList<Int64>([0xfd57ce62, 0xe2a96127, 0xd3d3c5b5, 0x608c9a19])),
                ("ct", ArrayList<Int64>([0xc3b9228a, 0x760c304, 0x925075b0, 0x1f10966c]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xaea57e26, 0x49c74525, 0x9f637e3c, 0x282b392c])),
                ("pt", ArrayList<Int64>([0xd747f37b, 0x35c28057, 0x2c4d77d0, 0x396efff1])),
                ("ct", ArrayList<Int64>([0xd1578e4e, 0xe9401f94, 0x53463366, 0xbb62b855]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x11989a9e, 0xce7fcd6, 0x6c52c0ca, 0xf37d0478])),
                ("pt", ArrayList<Int64>([0x2b2bd4bc, 0x768fc3be, 0xeae6e404, 0x70f717de])),
                ("ct", ArrayList<Int64>([0xb9181a22, 0xbc8d91ac, 0xc4f503cf, 0xfb45cdb5]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x878ac216, 0x6b5df69, 0x9c2801ef, 0x4b7dcb])),
                ("pt", ArrayList<Int64>([0x6b2c148b, 0x63b7b923, 0x65597b02, 0x32953f8c])),
                ("ct", ArrayList<Int64>([0x22a7120e, 0x7a87b208, 0x2b5a8ec4, 0xc6753638]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x4d924046, 0xd87ab3ba, 0xa61c145b, 0x1ac31e57])),
                ("pt", ArrayList<Int64>([0x8129b2f, 0x9116b377, 0xa13ff6df, 0xcae262cf])),
                ("ct", ArrayList<Int64>([0x5414996b, 0xf9d9ddbc, 0xc3481d3a, 0xfdffafb2]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xfb38d4c1, 0xca43491a, 0xf0d4f2a9, 0x97e9f740])),
                ("pt", ArrayList<Int64>([0x1466d9c6, 0x1be6d713, 0xdb1a6381, 0xed212978])),
                ("ct", ArrayList<Int64>([0x1b48c22c, 0xfc5f8ac9, 0x3e9b01d3, 0xac38946b]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xe3c1f0a8, 0xd9c07e7f, 0x51d02605, 0xc8fe2f19])),
                ("pt", ArrayList<Int64>([0x244a49f2, 0xf4633825, 0x63f92594, 0x1dc51f06])),
                ("ct", ArrayList<Int64>([0x86489daa, 0xefec03ed, 0xf928a8cb, 0xfa7df4b5]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x74cb1fb3, 0x6b7f80a8, 0xc87a6cfb, 0x778dff36])),
                ("pt", ArrayList<Int64>([0x3fad0fed, 0x2c4d3904, 0x15c00d9a, 0x6a377768])),
                ("ct", ArrayList<Int64>([0xd8654e00, 0x27920724, 0x380f4bc8, 0x80284d56]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x49ed6791, 0x2a6b8c29, 0x284399a4, 0x24f5519])),
                ("pt", ArrayList<Int64>([0x3e311d3e, 0xde14688b, 0x80cd6220, 0xedadc00a])),
                ("ct", ArrayList<Int64>([0x7455c216, 0x2870e2dd, 0x9c1b279, 0x3e7b0095]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x81992852, 0x75773545, 0x2d56ca05, 0x192b33c2])),
                ("pt", ArrayList<Int64>([0xedc76e30, 0xf4e7a50e, 0x3e76459f, 0xd1579557])),
                ("ct", ArrayList<Int64>([0xed8ddd07, 0x9c37ca96, 0xfe6b10d2, 0x8825b460]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x30f91606, 0x92196404, 0x574f34de, 0x31ee83d1])),
                ("pt", ArrayList<Int64>([0x228cb101, 0x196bd771, 0x77732fe9, 0x27391edd])),
                ("ct", ArrayList<Int64>([0x86e7a5cc, 0x35d78267, 0xae30f259, 0xba0e13a1]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x1a66237e, 0x99984179, 0xf63c8b6b, 0x1927a592])),
                ("pt", ArrayList<Int64>([0x9d0cd50e, 0xd2bfabf4, 0x9963575b, 0xfb2c4fe2])),
                ("ct", ArrayList<Int64>([0x9d66a013, 0xac8e601, 0x1d9b448a, 0xc8c46177]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x7aaa14c4, 0x6db6b514, 0x521cf2c7, 0x5a23530d])),
                ("pt", ArrayList<Int64>([0xfddf1d33, 0x1c27b4e7, 0x29362e5c, 0x815f0561])),
                ("ct", ArrayList<Int64>([0x7b798134, 0x415cb2cf, 0xb88bc21f, 0x1dbb9c41]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x8a5a68cf, 0xae758e39, 0x1a596870, 0x4e8c05bc])),
                ("pt", ArrayList<Int64>([0xfb86d8c0, 0x6674f638, 0xcb8f551d, 0xf30589a1])),
                ("ct", ArrayList<Int64>([0xc6169c87, 0xc8cf2af5, 0xa86c6d05, 0xb16ab7a9]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x2a8c54cc, 0xf96a353a, 0x66de0b78, 0x3a499b])),
                ("pt", ArrayList<Int64>([0xd62faabe, 0x7b654a8, 0x83b5e979, 0x307ee472])),
                ("ct", ArrayList<Int64>([0x8fa39571, 0xd8f43a20, 0xcc343cd8, 0x23d437cf]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xf0e19d7a, 0x6b1c475c, 0xa2df3f05, 0xff84b3ed])),
                ("pt", ArrayList<Int64>([0x3f16bd44, 0x166c181e, 0x39b94d43, 0x7409bde4])),
                ("ct", ArrayList<Int64>([0x3aaf565d, 0xd8d92ecd, 0x89d36eaf, 0x9e2b88f3]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x9f11d99c, 0x392d8bd5, 0x8d775223, 0x6a7abe85])),
                ("pt", ArrayList<Int64>([0xed42580e, 0x460301a3, 0x7f668332, 0x128969bb])),
                ("ct", ArrayList<Int64>([0x457e5aef, 0xacebc4b5, 0x60479471, 0xb3a7db60]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x14fd37e5, 0xe50ff010, 0xc4c11aaa, 0xfc3a09d8])),
                ("pt", ArrayList<Int64>([0x8f8dcc16, 0x66a6ad24, 0xe6da9e9d, 0xf1e1c087])),
                ("ct", ArrayList<Int64>([0xfc07c5a4, 0xd92ac021, 0xebc99acd, 0xcde3e395]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x3b0e99ea, 0x96024d16, 0x397a82f1, 0xb813577a])),
                ("pt", ArrayList<Int64>([0x957d8c77, 0x1a6df0b, 0xa82fb1d0, 0x29a7fed7])),
                ("ct", ArrayList<Int64>([0x6445acd3, 0xd00d68ef, 0x5b9a98d4, 0xe8cc92db]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xcf7be6d7, 0x59fb8fce, 0x3f059333, 0x325b65cb])),
                ("pt", ArrayList<Int64>([0xf19d026f, 0x9518b1fa, 0x8af72900, 0x317013a7])),
                ("ct", ArrayList<Int64>([0x819e085b, 0xf0960687, 0x4ec8b742, 0xa4c9d68]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x27b18601, 0x3e3db7a, 0xd5ebbd99, 0x73effa80])),
                ("pt", ArrayList<Int64>([0xe1b2101d, 0xa827ac60, 0xf5ba881b, 0x7d990a47])),
                ("ct", ArrayList<Int64>([0xff4ef5d4, 0x76aeb34c, 0xc1505d0, 0x1b398440]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x76075708, 0xd55b47dd, 0xe2a853f0, 0x60bf98c9])),
                ("pt", ArrayList<Int64>([0x766dba9e, 0x2f7e7058, 0xabeb2b77, 0x520f8ca9])),
                ("ct", ArrayList<Int64>([0x3dea2573, 0x622a2e52, 0xeaf64575, 0x51604b22]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x2052855f, 0xdc7f5d94, 0x1451e582, 0xabc5da12])),
                ("pt", ArrayList<Int64>([0x54decfe2, 0xadc44e81, 0xf3cd4d2d, 0x881935c0])),
                ("ct", ArrayList<Int64>([0xe1b59304, 0x4ed93b17, 0x272820ab, 0xc19e50e]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x8625d90e, 0xeb4a26d3, 0xa29a53f5, 0x1d2c9028])),
                ("pt", ArrayList<Int64>([0x7dd7d1aa, 0x7a29907c, 0xa26820b1, 0x224a43ac])),
                ("ct", ArrayList<Int64>([0xe7f43282, 0xd66ccc5a, 0x23cf2df9, 0x1478517e]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x5419f5c0, 0x60903fcc, 0xeb4414e6, 0xdd916275])),
                ("pt", ArrayList<Int64>([0x66b8ef8a, 0xce74b0ea, 0xbd545067, 0x75f92a01])),
                ("ct", ArrayList<Int64>([0xefec231e, 0x6d9f875f, 0xd036add2, 0x527c147e]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xf4dc3270, 0x7dc9b8fc, 0x6097abfb, 0x69eb19ab])),
                ("pt", ArrayList<Int64>([0xf5e8b4b, 0xdab8b261, 0x399fe824, 0x9284e798])),
                ("ct", ArrayList<Int64>([0x9b9db113, 0xd426c3ae, 0x5f767ca1, 0x28c39862]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x7d7f646c, 0x54248375, 0x4ee26e6, 0x76197a77])),
                ("pt", ArrayList<Int64>([0x79a5c252, 0x368aae0e, 0xdcd9d11, 0xdd74a3ed])),
                ("ct", ArrayList<Int64>([0x7707e1ed, 0x6cdb7c8d, 0x6cd5736d, 0x748c80e6]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x38428ffc, 0x6120ae32, 0xbb23c7e0, 0x291264e9])),
                ("pt", ArrayList<Int64>([0x78217744, 0x6aacf8ef, 0x430d8d5d, 0xd36f5e0e])),
                ("ct", ArrayList<Int64>([0xae8f59ee, 0xeafa4800, 0xb8acffb2, 0x8d5d09d2]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xc2c147d0, 0xca934715, 0xc272a17a, 0x4e022755])),
                ("pt", ArrayList<Int64>([0x23484cfa, 0x305810b2, 0x8742da7d, 0xd0e62f])),
                ("ct", ArrayList<Int64>([0x73c5518, 0xdc03fa20, 0xf27b0c64, 0x67242f68]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x3f257fe4, 0x601cdf36, 0x53a18cb8, 0x656f8691])),
                ("pt", ArrayList<Int64>([0xe073b4f0, 0x20c99715, 0xc716e9f6, 0x8a5a4632])),
                ("ct", ArrayList<Int64>([0x250a62bf, 0x72e0e386, 0xed621fd3, 0x60bab5b3]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x94519927, 0xef307655, 0x2aff6085, 0xf28c0e6e])),
                ("pt", ArrayList<Int64>([0x96a37f99, 0xfbdb9df8, 0xd4cea2cf, 0x9bdb014a])),
                ("ct", ArrayList<Int64>([0x4ba0e1e8, 0xe6bfb2e5, 0xbe1bc970, 0x810d2df5]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x90f4e1a9, 0x84a554d9, 0x979bcc74, 0x3dd522a3])),
                ("pt", ArrayList<Int64>([0xd8efa520, 0x2dc12f8f, 0x5aa673f9, 0x725ed6fc])),
                ("ct", ArrayList<Int64>([0xcf0c2aba, 0x46ebe72a, 0x8c89c305, 0xe8156e00]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x1d74c249, 0x21a77c9, 0xc8fd3e91, 0xd054f7c1])),
                ("pt", ArrayList<Int64>([0x48e6f95a, 0x5a9a2a5c, 0x37d3ded, 0xd7766d51])),
                ("ct", ArrayList<Int64>([0x9286ab7c, 0x290a5ae1, 0xaeee14fa, 0xe933c0d7]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x98fb3435, 0x289bb07d, 0x8b72bcf9, 0x29bf15ce])),
                ("pt", ArrayList<Int64>([0x1acac542, 0x1d7acbeb, 0xa2f0d24c, 0x7cbdf4b4])),
                ("ct", ArrayList<Int64>([0xd89ef7a5, 0x4224c73, 0x86019fb, 0x4aed2099]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x1418a423, 0xa5c16079, 0xa3de4ddd, 0xa2f09665])),
                ("pt", ArrayList<Int64>([0xbb166141, 0x202665e7, 0xc50d7b3f, 0x96d50382])),
                ("ct", ArrayList<Int64>([0xb855a52c, 0xc27fb04e, 0xd8dfae0b, 0x49d1d24b]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x32b7e0c3, 0x2db4d72e, 0xa16a54da, 0xdc432d17])),
                ("pt", ArrayList<Int64>([0x2b654142, 0xd302aa3d, 0x81fdca76, 0xcf4b0167])),
                ("ct", ArrayList<Int64>([0x5f771016, 0xbe591af2, 0x8e57860d, 0x886aa15e]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xa351ceea, 0x99787c3f, 0x2711fcb0, 0x6d519194])),
                ("pt", ArrayList<Int64>([0xa490fb0b, 0x23d042f8, 0x26f004d0, 0xb56cb84b])),
                ("ct", ArrayList<Int64>([0x8397e747, 0x32c59641, 0xfd54c7d4, 0xdab410d]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x294fc27e, 0xbf1dbc03, 0x8ec30a61, 0xe48804ee])),
                ("pt", ArrayList<Int64>([0xf20dcdca, 0xa53b3897, 0x203c53ae, 0x93f246bd])),
                ("ct", ArrayList<Int64>([0xe36c5081, 0x45ebb23, 0x5bd1a18e, 0xfe6fb332]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xca28368b, 0x57eff945, 0xc2e05bcb, 0x37100a9c])),
                ("pt", ArrayList<Int64>([0x5b9e804f, 0x74c44cea, 0xa989e1d5, 0x9f18e9d5])),
                ("ct", ArrayList<Int64>([0xcb5c16c3, 0x3233ef93, 0xe218ae9d, 0xd2f00fc8]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x1fa281f8, 0xa9ea7506, 0x6da0b07b, 0xf923ceeb])),
                ("pt", ArrayList<Int64>([0x6793656d, 0x490edec9, 0xbae93d03, 0x21be0641])),
                ("ct", ArrayList<Int64>([0x1b9f359f, 0xa0a8e29e, 0xb8bdf5de, 0xa860c59c]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x591a1131, 0x588be4f5, 0x6732b72e, 0xc385c396])),
                ("pt", ArrayList<Int64>([0x3b9861b3, 0x31e5396b, 0x2b6e12f0, 0x991aa5da])),
                ("ct", ArrayList<Int64>([0xfd43614f, 0x3f02d4a2, 0x87f09947, 0xab5162ea]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xf538253a, 0x69a2f8f4, 0x12805a16, 0x27e1a70b])),
                ("pt", ArrayList<Int64>([0xc53c8f4a, 0x2311f80f, 0x89fff5b3, 0x1540ba5e])),
                ("ct", ArrayList<Int64>([0x3bc7f9b6, 0xfa6db33c, 0x99dea790, 0xb73dc5e2]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x65e26f5c, 0x3a65942, 0xd3891455, 0x3076ce11])),
                ("pt", ArrayList<Int64>([0x22b05bd5, 0xeed93682, 0x732fdf02, 0xed255673])),
                ("ct", ArrayList<Int64>([0xa0c13f9b, 0xc26ccde4, 0xd9975066, 0x2064898c]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x2fc893bd, 0x39fb243b, 0xe9a0ffb4, 0x30c25ba1])),
                ("pt", ArrayList<Int64>([0x404a6ad6, 0xe1e11aa3, 0x3cb36, 0xcb66dffa])),
                ("ct", ArrayList<Int64>([0xa2a647ca, 0x15851c6, 0x5e7b670, 0x2e134d03]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x180c4285, 0x5d540bb6, 0x2992a296, 0xe289a29b])),
                ("pt", ArrayList<Int64>([0xb461f043, 0xfba39f65, 0xb4d7a2e, 0x495f786c])),
                ("ct", ArrayList<Int64>([0xcbfc9b26, 0xf9710e30, 0xc27ef130, 0xddec9ffc]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x571b02f3, 0x8d45ae42, 0xa06f6f88, 0x315af8a2])),
                ("pt", ArrayList<Int64>([0xce57388d, 0xd8fb021, 0x81689307, 0xc5b276f9])),
                ("ct", ArrayList<Int64>([0x2966b97a, 0xe55c061a, 0x1bc04f19, 0x8fc61275]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xcf808226, 0xd27f0244, 0x70c8f08f, 0x3fd3707b])),
                ("pt", ArrayList<Int64>([0x9758c743, 0xb2784f4d, 0xf0d78741, 0x94b472be])),
                ("ct", ArrayList<Int64>([0xd6d89082, 0xe40a7b62, 0x1fa7ed4a, 0x8e845970]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xc9769601, 0xd3a99cc8, 0xa7f7f59, 0xdb882634])),
                ("pt", ArrayList<Int64>([0x9e44101f, 0x813b38c2, 0xb39c5d6d, 0x503e6b8f])),
                ("ct", ArrayList<Int64>([0xac292df9, 0xd565e24e, 0x5253fd00, 0x8741e231]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x43c90298, 0xc18536c6, 0x49c31cb8, 0x1205b3b3])),
                ("pt", ArrayList<Int64>([0x3a8cb006, 0x95cf82bf, 0x4bb3627, 0x9e0b42d2])),
                ("ct", ArrayList<Int64>([0x3e25bd02, 0x911ba293, 0xc64a0b5b, 0xd7f58d01]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xa5598ef, 0xafd34219, 0x1dcd4f8e, 0x3fd8007f])),
                ("pt", ArrayList<Int64>([0xb39c085c, 0xb43e0096, 0xebb52eef, 0xec5cdbd6])),
                ("ct", ArrayList<Int64>([0xe6d7b198, 0x128379ce, 0x80fcd0cb, 0x9f9eb0e2]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x94b27152, 0xe2c21b65, 0xc81ba02, 0xe00f675f])),
                ("pt", ArrayList<Int64>([0x8f52dd4f, 0xdc8a200b, 0xe5c15490, 0xbb5db510])),
                ("ct", ArrayList<Int64>([0xde26bd44, 0x3f6ac66c, 0xe5e61120, 0x1ef210c1]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x8699f1d9, 0x49b9357a, 0xd1054d73, 0xc7265250])),
                ("pt", ArrayList<Int64>([0x2475e073, 0x459f47da, 0x85336a42, 0x5cd11e1f])),
                ("ct", ArrayList<Int64>([0xe7466e90, 0x22e1de3a, 0x85fe695e, 0x29d1a124]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x145e3d99, 0x752bc57c, 0x5be17cf1, 0xc1ca18c6])),
                ("pt", ArrayList<Int64>([0xaa9a4047, 0x83587c2d, 0x47ad90a, 0x9923ceda])),
                ("ct", ArrayList<Int64>([0xb9d2e6db, 0x8ca0649, 0xaf9f433e, 0x5158e7d5]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x67ba7664, 0x60e6c961, 0x460e225b, 0x8f9d8ab2])),
                ("pt", ArrayList<Int64>([0x98779424, 0x7120c4d7, 0x4803e6b1, 0x80c5fed0])),
                ("ct", ArrayList<Int64>([0x62ad6088, 0x5509a90c, 0xa8783bc7, 0x434b4039]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x40917e8c, 0xa8401d09, 0x3fc61206, 0x808bd137])),
                ("pt", ArrayList<Int64>([0x4541a6e6, 0xd82fdc39, 0x6c5f2320, 0xd14acd21])),
                ("ct", ArrayList<Int64>([0x12402881, 0x7587a701, 0xcfac7322, 0x17fdaba8]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x83c35e83, 0x16d6234e, 0xa29d36c1, 0xa2dc1785])),
                ("pt", ArrayList<Int64>([0x23a8a344, 0x3ed503a6, 0x410716ba, 0x720e47ff])),
                ("ct", ArrayList<Int64>([0x74d9523a, 0x2079f513, 0xaaa2e71c, 0xdbcee1af]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xd64d5352, 0x2a72f522, 0x54759c15, 0x9fb33a32])),
                ("pt", ArrayList<Int64>([0x3f3fe5e6, 0x690114a, 0x27946f0b, 0xed024018])),
                ("ct", ArrayList<Int64>([0x10b06d7a, 0xf5637a4e, 0x19b11458, 0x26bd49da]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x3c1300ec, 0x432c49e5, 0xf2353e0c, 0xa1a03eb2])),
                ("pt", ArrayList<Int64>([0xac99eeda, 0xd4fbdf52, 0xd417d63c, 0xe837555d])),
                ("ct", ArrayList<Int64>([0xd050f60d, 0xd48913fd, 0x387b7108, 0xb9a939d1]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x47d41e75, 0x2f1ad2f5, 0x2cc203d0, 0xb40e4b4f])),
                ("pt", ArrayList<Int64>([0x9f818686, 0x843b528b, 0xe0e0b376, 0x5d3cf29c])),
                ("ct", ArrayList<Int64>([0x5bf46ebf, 0xe7f907e4, 0xad4eb3a3, 0x8ea0a011]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xc1c1706b, 0x365b606f, 0xa8e3c28d, 0x28ce0749])),
                ("pt", ArrayList<Int64>([0xa67a9768, 0x726c6d5, 0xd92be59a, 0x6680787b])),
                ("ct", ArrayList<Int64>([0x506b43b4, 0xaf9a1a26, 0xae200ea7, 0x7bc27ac6]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x7b3085b8, 0xdbbf40d9, 0xc6145e57, 0x941a4979])),
                ("pt", ArrayList<Int64>([0xfa99bddd, 0xa43e9124, 0x7a3a55dc, 0x3b409b23])),
                ("ct", ArrayList<Int64>([0x522d0075, 0x655fd20c, 0xaf3aa3f, 0xfd354f4e]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x21d2a5e9, 0x1bfc939a, 0xfe08d91c, 0x85d99fa])),
                ("pt", ArrayList<Int64>([0x98e1974c, 0xa85062fc, 0xb83e72fa, 0xc626861d])),
                ("ct", ArrayList<Int64>([0xd097604, 0x1784d419, 0x523b0e7c, 0x19f8346e]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x8fdb45b9, 0x31e347f9, 0x7e9fdc75, 0x323b4098])),
                ("pt", ArrayList<Int64>([0x68967660, 0x74794a67, 0xdad38fa9, 0x3392146a])),
                ("ct", ArrayList<Int64>([0x391f9934, 0xb3fa423f, 0x17079aa6, 0xca03c062]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x1ccd9dd1, 0x4bacb50f, 0x41f44f2f, 0xfe4adf1e])),
                ("pt", ArrayList<Int64>([0x4e4add55, 0x402a9de3, 0x1d774e09, 0x9839f44])),
                ("ct", ArrayList<Int64>([0xf118fc3d, 0x2ff6a5ab, 0x3ddedffd, 0x31f597c7]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xe95b139a, 0x146c989a, 0x5dd152f9, 0x5596c67c])),
                ("pt", ArrayList<Int64>([0xeed7723, 0xf5fa1622, 0x1f5d06b4, 0xf149a4b0])),
                ("ct", ArrayList<Int64>([0x7492e2f0, 0x16175eb4, 0x5717b810, 0x4019d2d3]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xc117773c, 0xa83a6376, 0x84aaeff5, 0xa5558786])),
                ("pt", ArrayList<Int64>([0xe8019cda, 0xf74c68f2, 0xa2e9bbef, 0x27438873])),
                ("ct", ArrayList<Int64>([0xe37d558d, 0x707de751, 0xa9e882af, 0xef0382c9]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x7d345bda, 0xcd29fec, 0x7b16b381, 0x26853084])),
                ("pt", ArrayList<Int64>([0xeb2ff988, 0xefef5906, 0x37e4e10, 0xd440a8b9])),
                ("ct", ArrayList<Int64>([0x27639685, 0xc4cd6f33, 0x875cb348, 0xf8f35ee9]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x8a31bfb0, 0x32473ff5, 0x9d8efd13, 0x66415f0f])),
                ("pt", ArrayList<Int64>([0xed0d8eaa, 0xaca71ea1, 0x195b3952, 0xc82e0ba6])),
                ("ct", ArrayList<Int64>([0x6eda5ff8, 0x6345ed38, 0x3ed35c79, 0xca7d1f04]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x26ca1da9, 0xbfbf732d, 0x4632d360, 0x63170d30])),
                ("pt", ArrayList<Int64>([0x8bd77448, 0xc197e58a, 0x522ec1ca, 0xc9de21b8])),
                ("ct", ArrayList<Int64>([0xf57d75aa, 0xfbebeb9e, 0x2ba8455a, 0xfef74b46]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x3fb09c06, 0x937e8035, 0x2c7dc4c6, 0xa913387f])),
                ("pt", ArrayList<Int64>([0x5380d46d, 0x4951a49b, 0xa0741ffa, 0xc7bdea0a])),
                ("ct", ArrayList<Int64>([0x561d904e, 0x414bc1bf, 0xfa7384ba, 0x7611bdb0]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x2c3bce63, 0x423c766c, 0x14032881, 0xcb8822c8])),
                ("pt", ArrayList<Int64>([0x75f0c682, 0x6442012, 0x944fedb1, 0x36a9c2a7])),
                ("ct", ArrayList<Int64>([0xb5a03f9d, 0x2926d08f, 0xb87688de, 0xb03e6ad6]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xf65c65ca, 0xeb0b637f, 0x8e76da3c, 0xe3798ce8])),
                ("pt", ArrayList<Int64>([0x7c286730, 0x5559679, 0x1097f9fa, 0x4a66e65f])),
                ("ct", ArrayList<Int64>([0x10381fcf, 0xeb96ee69, 0x5f3297d1, 0x259e718a]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x349af732, 0x996bd10c, 0xd56eb56c, 0x57f351a0])),
                ("pt", ArrayList<Int64>([0x4df3fbdd, 0xc72d88a1, 0x65ffd4eb, 0x14a488b8])),
                ("ct", ArrayList<Int64>([0x8beb5628, 0x48aa7b64, 0x26e7e8fd, 0xe182a99e]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xca9b643c, 0x5e564df4, 0xf086f578, 0xa761a51d])),
                ("pt", ArrayList<Int64>([0x62451526, 0x3e5244a2, 0xc870453c, 0xb8f37c4d])),
                ("ct", ArrayList<Int64>([0x7a6c71fa, 0x6e812b26, 0xff663527, 0x5c784d62]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x90198813, 0x4ee1e23d, 0x5498897b, 0x72781bb1])),
                ("pt", ArrayList<Int64>([0xda540600, 0x8ebd2b0c, 0x813a4a32, 0x673aef85])),
                ("ct", ArrayList<Int64>([0xc41763ed, 0xff786dc5, 0x7ac942c2, 0xe84728b5]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xfb900fd8, 0xd80a720e, 0xf9f6b8fd, 0x9e1dfc38])),
                ("pt", ArrayList<Int64>([0x22d24c1c, 0xa0f8b48f, 0x8f0c0468, 0x278bd394])),
                ("ct", ArrayList<Int64>([0x9a103e45, 0xb8c9c34c, 0xb4cf964c, 0xc6ef159e]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x95899247, 0x388a5ac5, 0x8719a503, 0xb205ff91])),
                ("pt", ArrayList<Int64>([0xa95d3adb, 0x3144c716, 0x84cb44fa, 0xbfe6f5f6])),
                ("ct", ArrayList<Int64>([0x5b41a0b4, 0xee81e727, 0x372b1d5b, 0x25283cfc]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x93254ec1, 0xd7c5dd53, 0x4e5d962, 0xb4e2bdc7])),
                ("pt", ArrayList<Int64>([0x3ab0f068, 0xd00df7b8, 0xf8f83f8c, 0x45e39916])),
                ("ct", ArrayList<Int64>([0xbdb0eb9a, 0x777df9ee, 0xdcbbd196, 0xf02acff3]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x943cbe97, 0x681bfd8a, 0xfeda11fa, 0xf6c0f58f])),
                ("pt", ArrayList<Int64>([0xf6546601, 0xe930538, 0x17411d1b, 0xea5fe04a])),
                ("ct", ArrayList<Int64>([0x1f6b3803, 0x4922e958, 0x970c22eb, 0xbf742f62]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x4698864e, 0x9857c432, 0x7917efd6, 0xca7d4b93])),
                ("pt", ArrayList<Int64>([0x3d393ed2, 0x2a0545a7, 0x8435fb25, 0x2caa2a2a])),
                ("ct", ArrayList<Int64>([0xdd2fcbe5, 0x5e183396, 0x4bacaf86, 0x65fe1771]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xfb148835, 0x5fde85, 0xc85be4d3, 0x6b4fb64])),
                ("pt", ArrayList<Int64>([0xe8da8109, 0x90b542d7, 0x9194d64b, 0x8d7af88a])),
                ("ct", ArrayList<Int64>([0x6e0070d2, 0x1dd8afe8, 0x970310d4, 0xea94f129]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x559bf43b, 0x4b288eef, 0xc1ccca7e, 0x6d9a92a1])),
                ("pt", ArrayList<Int64>([0x6a1a4d50, 0xae0ab970, 0x2a3c6ce4, 0x63147dd1])),
                ("ct", ArrayList<Int64>([0x69000712, 0xa4984d72, 0x18e30085, 0xb2e80fa]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xeb5ed7d5, 0x4ba76d32, 0x1da83a51, 0x2eb52511])),
                ("pt", ArrayList<Int64>([0xd9bfb052, 0x274b126, 0xc86522a5, 0xbfa65fc6])),
                ("ct", ArrayList<Int64>([0x723957b7, 0x32d4de48, 0x27fb49b9, 0xfc47ca68]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xc0366624, 0x1df86b98, 0x4ed6afd9, 0xfbcc594c])),
                ("pt", ArrayList<Int64>([0xba14f66e, 0xbec2de9b, 0xbd032af2, 0x82e71073])),
                ("ct", ArrayList<Int64>([0xbe4722c0, 0xcb214203, 0xffe63a8c, 0x9bd6b884]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x6d916616, 0x3219e819, 0x8e6427d6, 0x4a2cc4af])),
                ("pt", ArrayList<Int64>([0xd07ba2cc, 0xbc8b8e43, 0x445709f3, 0x143cce8d])),
                ("ct", ArrayList<Int64>([0xa7dd032, 0xa33b003c, 0x2e4fce61, 0x5d235037]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xcaa60757, 0xeecf8f27, 0xc020b450, 0x4c191a37])),
                ("pt", ArrayList<Int64>([0xab678f3f, 0x41b236c8, 0xf6bc3b6c, 0x9f9dfc27])),
                ("ct", ArrayList<Int64>([0xdc705627, 0x37160424, 0x8ef00bf, 0x2df6183e]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x1fbfe8d2, 0x92c18406, 0x28c5ecf2, 0x92ad1464])),
                ("pt", ArrayList<Int64>([0xf27a5327, 0x10e46be3, 0xaaeb5e47, 0x8ebf0373])),
                ("ct", ArrayList<Int64>([0x266bf75c, 0xfefe120d, 0xfce33fe9, 0xe2a95e03]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0x4c2d6e93, 0xc85716fa, 0xc51af501, 0x4be7f5d4])),
                ("pt", ArrayList<Int64>([0x83b6db9, 0x95a99cfd, 0x4131e7cc, 0x2c6c5b1b])),
                ("ct", ArrayList<Int64>([0x60752c84, 0x4e8ca2e4, 0x2f8a7be2, 0xbf53882e]))
            ]
        ),
        HashMap<String, ArrayList<Int64>>(
            [
                ("key", ArrayList<Int64>([0xd0163cff, 0x35ace527, 0xe57b544c, 0x18dde547])),
                ("pt", ArrayList<Int64>([0x4e562665, 0x603ccc7f, 0x94a4d6fc, 0x748ad668])),
                ("ct", ArrayList<Int64>([0x69e179b5, 0x510760cf, 0x26fd7fc9, 0xb2df65b7]))
            ]
        )
    ]
)

class Benchmark {
    func runIteration() {
        for (i in 0..dataArr.size) {
            let item = dataArr[i]
        }
    }
}

main() {
    Benchmark().runIteration()
}
