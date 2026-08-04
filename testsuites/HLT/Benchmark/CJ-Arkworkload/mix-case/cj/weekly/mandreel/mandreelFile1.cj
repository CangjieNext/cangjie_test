/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*
import std.convert.*
import std.math.*

class getChanne {
    var length: Int64 = 0

@OverflowWrapping
func getChannelData(num: Int64): String {
        return num.toString()
    }
}

class webkitAudioContext {
    var destination: String = ""

@OverflowWrapping
func createBuffer(response: String, bool: Bool): Unit {
    }
}

class VariableSet {
    var mandreel_total_pogfile_size: Int64 = 0
    var g_mandreel_timestamp_fs: Int64 = 0
    var preCreatedWebAudioContext: ?webkitAudioContext = Option<webkitAudioContext>.None
    var g_mandreel_fs: ?GmandreelFs = Option<GmandreelFs>.None
}

var webAudioContext: webkitAudioContext = webkitAudioContext()
var webAudioUseMusicFunctions: Bool = true
var webAudioBuffers: ArrayList<String> = ArrayList<String>()
var webAudioChannels: ArrayList<Int64> = ArrayList<Int64>([32])
var webAudioGain: ArrayList<Int64> = ArrayList<Int64>([32])
var wa_mandreel_cache_audio_files_path: String = "";
let variableSet: VariableSet = VariableSet()

class GmandreelFs {
    var root: ?String = "";
}

var g_mandreel_fs: GmandreelFs = GmandreelFs()
var g_mandreel_timestamp_fs: Float32 = 0.0
var webAudioPreloadAudioFiles: ArrayList<String> = ArrayList<String>();
var webAudioPreloadCurrentFile: Int64 = 0
var webAudioPreloadAsync: Bool = false
var wa_mandreel_audio_buffers_num: Int64 = 0
var wa_mandreel_audio_buffers_loaded: Int64 = 0;
var mwebAudioPreloadState: String = "start"
var mwebAudioPreloadAssets: ArrayList<String> = ArrayList<String>()
var mwebAudioCurrentPreloadAsset: Int64 = 0;
var mwebAudioAsyncFiles: ?String = "";
var mwebListAudioAsyncFiles: ?String = "";
var mwebListAudioAsyncFilesPos: Int64 = 0;
var mwebTotalPreloadingFiles: Int64 = 0;
var mwebCurrentPreloadingFiles: Int64 = 0;
var mandreel_total_pogfile_size: Int64 = 0
var wa_mandreelMusicElement: ?MandreelElement = Option<MandreelElement>.None;
var wa_mandreelMusicElementFilename: String = "";

class Navigator {
    var appName: String = ""
    var userAgent: String = ""
}

let navigator: Navigator = Navigator()
var wa_mandreelMusicElementVolume: Float32 = 1.0;
var mandreel_audio_stream_func_ptr: Int64 = 0;
var __Mandreel_Audio_CreateStream_created: Bool = false;
var mandreel_flashaudio_server: ?String = Option<String>.None;
var mandreel_flashaudio_lite: Bool = false;
var mandreel_flashaudio_musicaudiotag: Bool = true;
var mandreel_audio_flash_lastBufferCreated: Int64 = 0;
var mandreel_audio_flash_lastBufferCreatedSwf: Int64 = 0;
var ninjaLoaded: Bool = false;
var maudiotagPreloadState: String = "start";
var maudiotagPreloadAssets: ArrayList<String> = ArrayList<String>();
var maudiotagCurrentPreloadAsset: Int64 = 0;
var maudiotagPreloadAsync: Bool = false;
var maudiotagDurations: ArrayList<Int64> = ArrayList<Int64>();
var maudiotagChannelsCreated: Int64 = 0;
var maudiotagChannelsLoaded: ArrayList<Int64> = ArrayList<Int64>();
var maudiotagAudioSpriteFound: Bool = false;
var audiotagAudioSprite: String = ""
var js_mandreel_flash_socket_swf_loaded: Bool = false;

@OverflowWrapping
func mandreel_start_audio(audioServer: String, audioUrl: String): Unit {
    var webAudioDataAvailable: Bool = false;
    var flashAudioDataAvailable: Bool = false;
    var flashLiteAudioDataAvailable: Bool = false;
    var audiotagsDataAvailable: Bool = false;

    if (flashAudioDataAvailable && commonVariable.MandreelAudioDriver == "null") {
        commonVariable.MandreelAudioDriver = "flash"
        fl_MainAudioDriver(audioServer, audioUrl);
    }

    if (flashLiteAudioDataAvailable && commonVariable.MandreelAudioDriver == "null") {
        commonVariable.MandreelAudioDriver = "flashlite"
        mandreel_flashaudio_lite = true
        fl_MainAudioDriver("", "");
    }

    if (audiotagsDataAvailable && commonVariable.MandreelAudioDriver == "null") {
        commonVariable.MandreelAudioDriver = "audiotag"
        at_MainAudioDriver();
    }

    if (commonVariable.MandreelAudioDriver == "null") {
        null_MainAudioDriver();
    }
    dump("AudioDriver (" + commonVariable.MandreelAudioDriver + ")");
}

@OverflowWrapping
func wa_mandreel_audio_createBuffer(sp: Int64): Unit {
    var spTemp = sp;
    var ptr_fileName = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    var maxChannels = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    var fileName = get_string_from_ptr(Int64(ptr_fileName)).toAsciiLower();
    wa_imp_mandreel_audio_createBuffer(fileName);

    commonVariable.r_g0 = 0
}

@OverflowWrapping
func wa_mandreel_audio_setChannelVolume(sp: Int64): Unit {
    var spTemp = sp;
    let channel = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    let vol = heapClassInst.heapFloat[spTemp >> 2];
    spTemp += 4
    wa_imp_mandreel_audio_setChannelVolume(Int64(channel), Float64(vol));
}

@OverflowWrapping
func wa_mandreel_audio_setChannelPan(sp: Int64): Unit {
    var spTemp = sp;
    let channel = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    var pan = heapClassInst.heapFloat[spTemp >> 2];
    spTemp += 4
}

@OverflowWrapping
func wa_mandreel_audio_setChannelPitch(sp: Int64): Unit {
    var spTemp = sp;
    let channel = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    let pitch = heapClassInst.heapFloat[spTemp >> 2];
    spTemp += 4
    wa_imp_mandreel_audio_setChannelPitch(Int64(channel), Float64(pitch));
}

@OverflowWrapping
func wa_mandreel_audio_useMusicFunctions(sp: Int64): Unit {
    commonVariable.r_g0 = if (webAudioUseMusicFunctions) {
        1
    } else {
        0
    };
}

@OverflowWrapping
func wa_mandreel_audio_playMusic(sp: Int64): Unit {
    var spTemp = sp;
    let ptr_fileName = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    let fileName = get_string_from_ptr(Int64(ptr_fileName)).toAsciiLower();
    wa_imp_mandreel_audio_playMusic(fileName);
}

@OverflowWrapping
func wa_mandreel_audio_stopMusic(sp: Int64): Unit {
    wa_imp_mandreel_audio_stopMusic();
}

@OverflowWrapping
func wa_mandreel_audio_setMusicVol(sp: Int64): Unit {
    var spTemp = sp;
    let vol = heapClassInst.heapFloat[spTemp >> 2];
    spTemp += 4
    wa_imp_mandreel_audio_setMusicVol(vol);
}

var mandreel_audio_init = null_mandreel_audio;
var mandreel_audio_end = null_mandreel_audio;
var mandreel_audio_update = null_mandreel_audio;
var mandreel_audio_createBuffer = null_mandreel_audio;
var mandreel_audio_playChannel = null_mandreel_audio;
var mandreel_audio_stopChannel = null_mandreel_audio;
var mandreel_audio_setChannelVolume = null_mandreel_audio;
var mandreel_audio_setChannelPan = null_mandreel_audio;
var mandreel_audio_setChannelPitch = null_mandreel_audio;
var mandreel_audio_playMusic = null_mandreel_audio;
var mandreel_audio_stopMusic = null_mandreel_audio;
var mandreel_audio_useMusicFunctions = _mandreel_audio_useMusicFunctions;
var mandreel_audio_checkBuffersPending = null_mandreel_audio;
var mandreel_audio_setMusicVol = null_mandreel_audio;

@OverflowWrapping
func wa_initWebAudio(): Unit {
    if (variableSet.preCreatedWebAudioContext.isSome()) {
        webAudioContext = variableSet.preCreatedWebAudioContext.getOrThrow()
    }
}

@OverflowWrapping
func wa_getFileNameNoExt(fileName: String): String {
    var fileNameNoExt = fileName.toAsciiLower();
    return fileNameNoExt;
}

@OverflowWrapping
func wa_imp_mandreel_audio_checkBuffersPending(): Int64 {
    return wa_mandreel_audio_buffers_num - wa_mandreel_audio_buffers_loaded;
}

@OverflowWrapping
func wa_imp_mandreel_audio_createBuffer(fileName: String): Unit {
    if (Some(webAudioContext).isSome()) {
        var fileNameNoExt = wa_getFileNameNoExt(fileName);
        var buffer = webAudioBuffers[Int64.parse(fileNameNoExt)];
        if ( /*buffer == nil &&*/ buffer != "invalid") {
            wa_mandreel_audio_buffers_num += 1
        }
    }
}

@OverflowWrapping
func wa_imp_mandreel_audio_setChannelVolume(channel: Int64, vol: Float64): Unit {
    if (Some(webAudioContext).isSome()) {
        var gain = webAudioGain[Int64(channel)];
        if (Some(gain).isSome()) {
            gain = Int64(vol)
        }
    }
}

@OverflowWrapping
func wa_imp_mandreel_audio_setChannelPitch(channel: Int64, pitch: Float64): Unit {
    if (Some(webAudioContext).isSome()) {
        var chn = webAudioChannels[Int64(channel)];
        if (Some(chn).isSome()) {
            chn = Int64(pitch)
        }
    }
}

@OverflowWrapping
func mwebCallbackAsync(): Unit {
    mwebListAudioAsyncFilesPos += 1
    if (mwebListAudioAsyncFilesPos >= mwebListAudioAsyncFiles.getOrThrow().size) {
        mwebListAudioAsyncFiles = Option<String>.None
        mwebAudioAsyncFiles = Option<String>.None
        return;
    }
}

@OverflowWrapping
func mwebCallbackAsyncPreload(): Unit {
    mwebCurrentPreloadingFiles += 1
}

@OverflowWrapping
func mandreel_webAudio_PreloadAssets(): Unit {
}

@OverflowWrapping
func wa_imp_mandreel_audio_playMusic(fileName: String): Unit {
    var fileNameNoExt = wa_getFileNameNoExt(fileName);
    var fileNameFull = commonVariable.g_mandreel_working_folder + fileNameNoExt + ".ogg";

    if (wa_mandreelMusicElementFilename != fileNameFull) {
        wa_imp_mandreel_audio_stopMusic();
        var audio: MandreelElement = mandreelDocument.createElement("audio");
        wa_mandreelMusicElement = audio
        wa_mandreelMusicElementFilename = fileNameFull
    }
}

@OverflowWrapping
func wa_imp_mandreel_audio_stopMusic(): Unit {
    if (wa_mandreelMusicElement.isSome()) {
        wa_mandreelMusicElement = Option<MandreelElement>.None
        wa_mandreelMusicElementFilename = ""
    }
}

@OverflowWrapping
func wa_imp_mandreel_audio_setMusicVol(vol: Float32): Unit {
    wa_mandreelMusicElementVolume = vol
    if (wa_mandreelMusicElement.isSome()) {
        wa_mandreelMusicElement.getOrThrow().volume = Int64(wa_mandreelMusicElementVolume)
    }
}

@OverflowWrapping
func mandreel_Audio_requestSoundData(soundData: String): Unit {
    var n = soundData.size / 2;
    var offset2 = 0;
    while (n > 0) {
        var n2 = n;
        if (n2 > 1024) {
            n2 = 1024
        }
        var sp = g_stack_pointer + 100 * 1024;
        var ptr = g_stack_pointer + 200 * 1024;
        var _sp = sp >> 2;
        heapClassInst.heap32[_sp] = Int32(ptr)
        heapClassInst.heap32[_sp + 1] = Int32(n2)
        __FUNCTION_TABLE__[(mandreel_audio_stream_func_ptr) >> 2](sp);

        var offset = ptr >> 2;
        var size = n2 * 2;
        offset2 += n2 * 2
        n -= n2
    }
}

@OverflowWrapping
func mandreel_sendmsg_flash(msg: String): Unit {
    if (mandreel_flashaudio_server != "") {
        let iframeWin = mandreelDocument.getElementById("ninja-iframe").getOrThrow().contentWindow;
    }
    return
}

@OverflowWrapping
func fl_mandreel_audio_init(sp: Int64): Unit {
    mandreel_sendmsg_flash("init " + commonVariable.g_mandreel_working_folder);
}

@OverflowWrapping
func mandreel_flashaudiolite_createBuffer(fileName: String): Unit {
    mandreel_audio_flash_lastBufferCreated += 1
    mandreel_sendmsg_flash("createBuffer ${wa_getFileNameNoExt(fileName)} ${mandreel_audio_flash_lastBufferCreated}");
}

@OverflowWrapping
func fl_mandreel_audio_createBuffer(sp: Int64): Unit {
    var spTemp = sp;
    let ptr_fileName = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    let fileName = get_string_from_ptr(Int64(ptr_fileName)).toAsciiLower();
    mandreel_flashaudiolite_createBuffer(fileName);
}

@OverflowWrapping
func fl_internal_mandreel_audio_checkBuffersPending(): Bool {
    return mandreel_flashaudio_lite && (mandreel_audio_flash_lastBufferCreatedSwf !=
        mandreel_audio_flash_lastBufferCreated);
}

@OverflowWrapping
func fl_mandreel_audio_checkBuffersPending(sp: Int64): Unit {
    commonVariable.r_g0 = 0
    if (fl_internal_mandreel_audio_checkBuffersPending()) {
        commonVariable.r_g0 = 1
    }
    dump(
        "fl_mandreel_audio_checkBuffersPending (${commonVariable.r_g0}) (${mandreel_audio_flash_lastBufferCreatedSwf}) (${mandreel_audio_flash_lastBufferCreated})"
    );
}

@OverflowWrapping
func fl_mandreel_audio_playChannel(sp: Int64): Unit {
    var spTemp = sp;
    let ptr_fileName = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    let channel = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    let vol = heapClassInst.heapFloat[spTemp >> 2];
    spTemp += 4
    let loop = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    let pitch = heapClassInst.heapFloat[spTemp >> 2];
    spTemp += 4
    let fileName = get_string_from_ptr(Int64(ptr_fileName)).toAsciiLower();
    mandreel_sendmsg_flash("playChannel ${fileName} ${channel} ${loop} ${vol} ${pitch}");
    commonVariable.r_g0 = 0
}

@OverflowWrapping
func fl_mandreel_audio_stopChannel(sp: Int64): Unit {
    var spTemp = sp;
    let ptr_fileName = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    let channel = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    let index = heapClassInst.heapFloat[spTemp >> 2];
    spTemp += 4

    mandreel_sendmsg_flash("stopChannel ${channel}");
}

@OverflowWrapping
func fl_mandreel_audio_setChannelVolume(sp: Int64): Unit {
    var spTemp = sp;
    let channel = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    let vol = heapClassInst.heapFloat[spTemp >> 2];
    spTemp += 4

    mandreel_sendmsg_flash("setChannelVolume ${channel} ${vol}");
}

@OverflowWrapping
func fl_mandreel_audio_setChannelPan(sp: Int64): Unit {
    var spTemp = sp;
    let channel = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    let pan = heapClassInst.heapFloat[spTemp >> 2];
    spTemp += 4
    mandreel_sendmsg_flash("setChannelPan ${channel} ${pan}");
}

@OverflowWrapping
func fl_mandreel_audio_setChannelPitch(sp: Int64): Unit {
    var spTemp = sp;
    let channel = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    let pitch = heapClassInst.heapFloat[spTemp >> 2];
    spTemp += 4
    mandreel_sendmsg_flash("setChannelPitch ${channel} ${pitch}");
}

@OverflowWrapping
func fl_MainAudioDriver(audioServer: String, audioUrl: String): Unit {
    mandreel_flashaudio_server = audioServer
    if (mandreel_flashaudio_lite) {
        mandreel_flashaudio_server = ""
    }
}

@OverflowWrapping
func fl_map_mandreel_audio_functions(): Unit {
    mandreel_audio_init = fl_mandreel_audio_init
    mandreel_audio_createBuffer = fl_mandreel_audio_createBuffer
    mandreel_audio_playChannel = fl_mandreel_audio_playChannel
    mandreel_audio_stopChannel = fl_mandreel_audio_stopChannel
    mandreel_audio_setChannelVolume = fl_mandreel_audio_setChannelVolume
    mandreel_audio_setChannelPan = fl_mandreel_audio_setChannelPan
    mandreel_audio_setChannelPitch = fl_mandreel_audio_setChannelPitch
    if (mandreel_flashaudio_musicaudiotag) {
        mandreel_audio_useMusicFunctions = wa_mandreel_audio_useMusicFunctions
        mandreel_audio_playMusic = wa_mandreel_audio_playMusic
        mandreel_audio_stopMusic = wa_mandreel_audio_stopMusic
        mandreel_audio_setMusicVol = wa_mandreel_audio_setMusicVol
    } else {
        dump("WARNING: flash music functions not supported");
    }
    mandreel_audio_checkBuffersPending = fl_mandreel_audio_checkBuffersPending
}

@OverflowWrapping
func receiveMessage2(event: String): Unit {
    ninjaLoaded = true
    fl_map_mandreel_audio_functions();
}

@OverflowWrapping
func flashReady(): Unit {
    fl_map_mandreel_audio_functions();
}

@OverflowWrapping
func null_MainAudioDriver(): Unit {
    mandreel_audio_init = null_mandreel_audio
    mandreel_audio_end = null_mandreel_audio
    mandreel_audio_update = null_mandreel_audio
    mandreel_audio_createBuffer = null_mandreel_audio
    mandreel_audio_playChannel = null_mandreel_audio
    mandreel_audio_stopChannel = null_mandreel_audio
    mandreel_audio_setChannelVolume = null_mandreel_audio
    mandreel_audio_setChannelPan = null_mandreel_audio
    mandreel_audio_setChannelPitch = null_mandreel_audio
    mandreel_audio_useMusicFunctions = wa_mandreel_audio_useMusicFunctions
    mandreel_audio_playMusic = wa_mandreel_audio_playMusic
    mandreel_audio_stopMusic = wa_mandreel_audio_stopMusic
    mandreel_audio_setMusicVol = wa_mandreel_audio_setMusicVol
}

@OverflowWrapping
func at_mandreel_audio_checkBuffersPending(sp: Int64): Unit {
    commonVariable.r_g0 = 0
}

@OverflowWrapping
func at_mandreel_audio_createBuffer(sp: Int64): Unit {
    var spTemp = sp;
    let ptr_fileName = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    let maxChannels = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    var fileName = get_string_from_ptr(Int64(ptr_fileName)).toAsciiLower();
    commonVariable.r_g0 = 0
}

@OverflowWrapping
func at_mandreel_audio_playChannel(sp: Int64): Unit {
    var spTemp = sp;
    var ptr_fileName = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    var channel = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    var vol = heapClassInst.heapFloat[spTemp >> 2];
    spTemp += 4
    var loop = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    var pitch = heapClassInst.heapFloat[spTemp >> 2];
    spTemp += 4
    var fileName = get_string_from_ptr(Int64(ptr_fileName)).toAsciiLower();
    commonVariable.r_g0 = 0
}

@OverflowWrapping
func at_mandreel_audio_stopChannel(sp: Int64): Unit {
    var spTemp = sp;
    var ptr_fileName = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    var channel = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    var index = heapClassInst.heapFloat[spTemp >> 2];
    spTemp += 4
}

@OverflowWrapping
func at_mandreel_audio_setChannelVolume(sp: Int64): Unit {
    var spTemp = sp;
    var channel = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    var vol = heapClassInst.heapFloat[spTemp >> 2];
    spTemp += 4
}

@OverflowWrapping
func at_mandreel_audio_setChannelPan(sp: Int64): Unit {
    var spTemp = sp;
    var channel = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    var pan = heapClassInst.heapFloat[spTemp >> 2];
    spTemp += 4
}

@OverflowWrapping
func at_mandreel_audio_setChannelPitch(sp: Int64): Unit {
    var spTemp = sp;
    var channel = heapClassInst.heap32[spTemp >> 2];
    spTemp += 4
    var pitch = heapClassInst.heapFloat[spTemp >> 2];
    spTemp += 4
}

@OverflowWrapping
func at_mandreel_audio_useMusicFunctions(sp: Int64): Unit {
    commonVariable.r_g0 = 1
}

@OverflowWrapping
func at_MainAudioDriver(): Unit {
    mandreel_audio_createBuffer = at_mandreel_audio_createBuffer
    mandreel_audio_playChannel = at_mandreel_audio_playChannel
    mandreel_audio_stopChannel = at_mandreel_audio_stopChannel
    mandreel_audio_setChannelVolume = at_mandreel_audio_setChannelVolume
    mandreel_audio_setChannelPan = at_mandreel_audio_setChannelPan
    mandreel_audio_setChannelPitch = at_mandreel_audio_setChannelPitch
    mandreel_audio_useMusicFunctions = at_mandreel_audio_useMusicFunctions
    mandreel_audio_playMusic = wa_mandreel_audio_playMusic
    mandreel_audio_stopMusic = wa_mandreel_audio_stopMusic
    mandreel_audio_checkBuffersPending = at_mandreel_audio_checkBuffersPending
    mandreel_audio_setMusicVol = wa_mandreel_audio_setMusicVol
}

@OverflowWrapping
func js_mandreel_flash_socket_ready(): Unit {
    js_mandreel_flash_socket_swf_loaded = true
}

@OverflowWrapping
func js_mandreel_flash_socket_onError(message: Int64): Unit {
    let id = Int64(message);

    let sp = g_stack_pointer + 512 * 1024;

    dump("on error ${id}");

    heapClassInst.heap32[sp >> 2] = Int32(id)
    mandreel_flash_tcp_onError(sp);
}

@OverflowWrapping
func _GLOBAL__I_Landscape02Vtx(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = _ZL10raycastBar
    heapClassInst.heap32[(g0)] = 8
    r0 = r0 >> 2
    _Znwj(i7);
    heapClassInst.heap32[(r0 + 10006)] = Int32(commonVariable.r_g0)
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
    heapClassInst.heap32[(g0 + 1)] = 0
    gettimeofday(i7);
    heapClassInst.heap32[(r0 + 10001)] = 0
    heapClassInst.heap32[(r0 + 10005)] = 0
    heapClassInst.heap32[(r0 + 10004)] = 9999
    heapClassInst.heap32[(r0 + 10003)] = 0
    heapClassInst.heap32[(r0 + 10002)] = 0
    return;
}

@OverflowWrapping
func _GLOBAL__D_Landscape02Vtx(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = _ZL10raycastBar
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0 + 10006)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

@OverflowWrapping
func _ZN17btTypedConstraint21setupSolverConstraintER20btAlignedObjectArrayI18btSolverConstraintEiif(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

@OverflowWrapping
func _ZN17btTypedConstraint23solveConstraintObsoleteER11btRigidBodyS1_f(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

@OverflowWrapping
func _ZN13BenchmarkDemo10createWallERK9btVector3iS2_(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-96)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = gNumAlignedAllocs
    r0 = r0 >> 2
    r1 = r1 >> 2
    r2 = Int64(heapClassInst.heap32[(r1)])
    f0 = Float64(heapClassInst.heapFloat[(r0 + 2)])
    f1 = Float64(heapClassInst.heapFloat[(r0 + 1)])
    f2 = Float64(heapClassInst.heapFloat[(r0)])
    r2 = (r2 + 1) | 0
    heapClassInst.heap32[(r1)] = Int32(r2)
    heapClassInst.heap32[(g0)] = 71
    mallocNew(i7);
    r1 = commonVariable.r_g0
    r2 = Int64(heapClassInst.heap32[(fp)])
    if (r1 != 0) {
        r3 = 0
        r4 = (r1 + 4) | 0
        r3 = (r3 - r4) | 0
        r3 = r3 & 15
        r3 = (r1 + r3) | 0
        r4 = (r3 + 4) | 0
        r3 = r3 >> 2
        heapClassInst.heap32[(r3)] = Int32(r1)
        r1 = r4
    }
    r3 = r1 >> 2
    heapClassInst.heap32[(r3 + 2)] = 0
    heapClassInst.heap32[(r3 + 3)] = 1065353216
    heapClassInst.heap32[(r3 + 4)] = 1065353216
    heapClassInst.heap32[(r3 + 5)] = 1065353216
    r4 = _ZTV10btBoxShape
    heapClassInst.heap32[(r3 + 6)] = 0
    r4 = (r4 + 8) | 0
    heapClassInst.heap32[(r3 + 11)] = 1025758986
    heapClassInst.heap32[(r3)] = Int32(r4)
    f3 = -0.039999999105930328
    f2 = f2 + f3
    heapClassInst.heap32[(r3 + 1)] = 0
    f1 = f1 + f3
    heapClassInst.heapFloat[(r3 + 7)] = Float32(f2)
    f0 = f0 + f3
    heapClassInst.heapFloat[(r3 + 8)] = Float32(f1)
    heapClassInst.heapFloat[(r3 + 9)] = Float32(f0)
    r4 = sp + (-16)
    heapClassInst.heap32[(r3 + 10)] = 0
    r3 = r4 >> 2
    heapClassInst.heap32[(fp + (-4))] = 0
    heapClassInst.heap32[(r3 + 1)] = 0
    heapClassInst.heap32[(r3 + 2)] = 0
    heapClassInst.heap32[(r3 + 3)] = 0
    heapClassInst.heap32[(g0)] = Int32(r1)
    heapClassInst.heap32[(g0 + 1)] = 1065353216
    heapClassInst.heap32[(g0 + 2)] = Int32(r4)
    _ZNK10btBoxShape21calculateLocalInertiaEfR9btVector3(i7);
    f4 = Float64(heapClassInst.heapFloat[(r0 + 1)])
    f0 = Float64(heapClassInst.heapFloat[(r0 + 2)])
    r0 = sp + (-80)
    r3 = r0 >> 2
    heapClassInst.heap32[(fp + (-20))] = 1065353216
    heapClassInst.heap32[(r3 + 1)] = 0
    heapClassInst.heap32[(r3 + 2)] = 0
    heapClassInst.heap32[(r3 + 3)] = 0
    heapClassInst.heap32[(r3 + 4)] = 0
    heapClassInst.heap32[(r3 + 5)] = 1065353216
    heapClassInst.heap32[(r3 + 6)] = 0
    heapClassInst.heap32[(r3 + 7)] = 0
    heapClassInst.heap32[(r3 + 8)] = 0
    heapClassInst.heap32[(r3 + 9)] = 0
    heapClassInst.heap32[(r3 + 10)] = 1065353216
    heapClassInst.heap32[(r3 + 11)] = 0
    f1 = f0 + f0
    f2 = (-12.0)
    heapClassInst.heap32[(r3 + 12)] = 0
    heapClassInst.heap32[(r3 + 13)] = 0
    f2 = f1 * f2
    f3 = 0.5
    f3 = f2 * f3
    f2 = f4 + f4
    r5 = 12
    heapClassInst.heap32[(r3 + 14)] = 0
    heapClassInst.heap32[(r3 + 15)] = 0
    while (true) {
        if (!(r5 < 1)) {
            r4 = 0
            while (true) {
                r6 = r2 >> 2
                f5 = Float64(r4)
                f6 = 0.0
                f7 = Float64(heapClassInst.heapFloat[(r6)])
                f8 = Float64(heapClassInst.heapFloat[(r6 + 2)])
                f9 = Float64(heapClassInst.heapFloat[(r6 + 1)])
                f5 = f5 * f1
                f6 = f7 + f6
                f5 = f5 + f3
                f7 = f9 + f4
                heapClassInst.heapFloat[(r3 + 12)] = Float32(f6)
                f5 = f8 + f5
                heapClassInst.heapFloat[(r3 + 13)] = Float32(f7)
                r6 = _ZL14benchmarkDemo4
                heapClassInst.heapFloat[(r3 + 14)] = Float32(f5)
                r7 = r6 >> 2
                heapClassInst.heap32[(r3 + 15)] = 0
                r7 = Int64(heapClassInst.heap32[(r7)])
                r7 = r7 >> 2
                r7 = Int64(heapClassInst.heap32[(r7 + 2)])
                heapClassInst.heap32[(g0)] = Int32(r6)
                heapClassInst.heap32[(g0 + 1)] = 1065353216
                heapClassInst.heap32[(g0 + 2)] = Int32(r0)
                heapClassInst.heap32[(g0 + 3)] = Int32(r1)
                r4 = (r4 + 1) | 0
                __FUNCTION_TABLE__[(r7) >> 2](i7);
                if (r5 != r4) {
                    continue
                } else {
                    break
                }
            }
        }
        r5 = (r5 + (-1)) | 0
        f4 = f4 + f2
        f3 = f3 + f0
        if (r5 == 0) {
            break
        } else {
            continue
        }
    }
    return;
}

@OverflowWrapping
func _ZN13BenchmarkDemo19createLargeMeshBodyEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-80)
    var g0 = i7 >> 2;
    r0 = sp + (-64)
    r1 = r0 >> 2
    heapClassInst.heap32[(fp + (-16))] = 1065353216
    heapClassInst.heap32[(r1 + 1)] = 0
    heapClassInst.heap32[(r1 + 2)] = 0
    heapClassInst.heap32[(r1 + 3)] = 0
    heapClassInst.heap32[(r1 + 4)] = 0
    heapClassInst.heap32[(r1 + 5)] = 1065353216
    heapClassInst.heap32[(r1 + 6)] = 0
    heapClassInst.heap32[(r1 + 7)] = 0
    heapClassInst.heap32[(r1 + 8)] = 0
    heapClassInst.heap32[(r1 + 9)] = 0
    heapClassInst.heap32[(r1 + 10)] = 1065353216
    heapClassInst.heap32[(r1 + 11)] = 0
    heapClassInst.heap32[(r1 + 12)] = 0
    heapClassInst.heap32[(r1 + 13)] = 0
    r2 = 0
    heapClassInst.heap32[(r1 + 14)] = 0
    heapClassInst.heap32[(r1 + 15)] = 0
    while (true) {
        r3 = gNumAlignedAllocs
        r3 = r3 >> 2
        r4 = Int64(heapClassInst.heap32[(r3)])
        r5 = (r4 + 1) | 0
        heapClassInst.heap32[(r3)] = Int32(r5)
        heapClassInst.heap32[(g0)] = 103
        mallocNew(i7);
        r5 = commonVariable.r_g0
        if (r5 != 0) {
            r6 = 0
            r7 = (r5 + 4) | 0
            r6 = (r6 - r7) | 0
            r6 = r6 & 15
            r6 = (r5 + r6) | 0
            r7 = (r6 + 4) | 0
            r6 = r6 >> 2
            heapClassInst.heap32[(r6)] = Int32(r5)
            r5 = r7
        }
        r6 = r5 >> 2
        heapClassInst.heap32[(r6 + 1)] = 1065353216
        heapClassInst.heap32[(r6 + 2)] = 1065353216
        r7 = _ZTV26btTriangleIndexVertexArray
        heapClassInst.heap32[(r6 + 3)] = 1065353216
        r7 = (r7 + 8) | 0
        heapClassInst.heap32[(r6 + 4)] = 0
        r8 = 1
        heapClassInst.heap32[(r6)] = Int32(r7)
        heapClassInst.heap8[r5 + 36] = Int8(r8)
        heapClassInst.heap32[(r6 + 8)] = 0
        heapClassInst.heap32[(r6 + 6)] = 0
        r7 = LandscapeVtx
        r9 = r2 << 2
        r10 = LandscapeVtxCount
        r11 = LandscapeIdx
        r12 = LandscapeIdxCount
        r7 = (r7 + r9) | 0
        r10 = (r10 + r9) | 0
        r11 = (r11 + r9) | 0
        r9 = (r12 + r9) | 0
        heapClassInst.heap32[(r6 + 7)] = 0
        r7 = r7 >> 2
        heapClassInst.heap32[(r6 + 12)] = 0
        r10 = r10 >> 2
        r11 = r11 >> 2
        r9 = r9 >> 2
        r7 = Int64(heapClassInst.heap32[(r7)])
        r10 = Int64(heapClassInst.heap32[(r10)])
        r11 = Int64(heapClassInst.heap32[(r11)])
        r9 = Int64(heapClassInst.heap32[(r9)])
        r12 = (r4 + 2) | 0
        heapClassInst.heap32[(r3)] = Int32(r12)
        heapClassInst.heap32[(g0)] = 51
        mallocNew(i7);
        r12 = commonVariable.r_g0
        r9 = (r9 / 3) | 0
        if (r12 != 0) {
            r13 = 0
            r14 = (r12 + 4) | 0
            r13 = (r13 - r14) | 0
            r13 = r13 & 15
            r13 = (r12 + r13) | 0
            r14 = (r13 + 4) | 0
            r13 = r13 >> 2
            heapClassInst.heap32[(r13)] = Int32(r12)
            r12 = r14
        }
        heapClassInst.heap8[r5 + 36] = Int8(r8)
        heapClassInst.heap32[(r6 + 8)] = Int32(r12)
        heapClassInst.heap32[(r6 + 7)] = 1
        r13 = Int64(heapClassInst.heap32[(r6 + 6)])
        r13 = r13 << 5
        r12 = (r12 + r13) | 0
        r12 = r12 >> 2
        heapClassInst.heap32[(r12)] = Int32(r9)
        heapClassInst.heap32[(r12 + 1)] = Int32(r11)
        heapClassInst.heap32[(r12 + 2)] = 6
        heapClassInst.heap32[(r12 + 3)] = Int32(r10)
        heapClassInst.heap32[(r12 + 4)] = Int32(r7)
        heapClassInst.heap32[(r12 + 5)] = 12
        heapClassInst.heap32[(r12 + 6)] = 3
        heapClassInst.heap32[(r12 + 7)] = 0
        r7 = Int64(heapClassInst.heap32[(r6 + 6)])
        r9 = (r7 + 1) | 0
        heapClassInst.heap32[(r6 + 6)] = Int32(r9)
        r7 = r7 << 5
        r9 = Int64(heapClassInst.heap32[(r6 + 8)])
        r7 = (r9 + r7) | 0
        r7 = r7 >> 2
        r4 = (r4 + 3) | 0
        heapClassInst.heap32[(r7 + 6)] = 3
        heapClassInst.heap32[(r3)] = Int32(r4)
        heapClassInst.heap32[(g0)] = 95
        mallocNew(i7);
        r3 = commonVariable.r_g0
        if (r3 != 0) {
            r4 = 0
            r7 = (r3 + 4) | 0
            r4 = (r4 - r7) | 0
            r4 = r4 & 15
            r4 = (r3 + r4) | 0
            r7 = (r4 + 4) | 0
            r4 = r4 >> 2
            heapClassInst.heap32[(r4)] = Int32(r3)
            r3 = r7
        }
        r4 = r3 >> 2
        r7 = _ZTV19btTriangleMeshShape
        heapClassInst.heap32[(r4 + 2)] = 0
        r7 = (r7 + 8) | 0
        heapClassInst.heap32[(r4 + 3)] = 0
        heapClassInst.heap32[(r4)] = Int32(r7)
        heapClassInst.heap32[(r4 + 12)] = Int32(r5)
        heapClassInst.heap32[(r4 + 1)] = 21
        r7 = Int64(heapClassInst.heap32[(r6)])
        r7 = r7 >> 2
        r7 = Int64(heapClassInst.heap32[(r7 + 10)])
        heapClassInst.heap32[(g0)] = Int32(r5)
        __FUNCTION_TABLE__[(r7) >> 2](i7);
        r7 = commonVariable.r_g0
        if (r7 == 0) {
            heapClassInst.heap32[(g0)] = Int32(r3)
            _ZN19btTriangleMeshShape15recalcLocalAabbEv(i7);
        } else {
            r6 = Int64(heapClassInst.heap32[(r6)])
            r6 = r6 >> 2
            r6 = Int64(heapClassInst.heap32[(r6 + 12)])
            r7 = (r3 + 16) | 0
            r9 = (r3 + 32) | 0
            heapClassInst.heap32[(g0)] = Int32(r5)
            heapClassInst.heap32[(g0 + 1)] = Int32(r7)
            heapClassInst.heap32[(g0 + 2)] = Int32(r9)
            __FUNCTION_TABLE__[(r6) >> 2](i7);
        }
        r5 = _ZTV22btBvhTriangleMeshShape
        r5 = (r5 + 8) | 0
        heapClassInst.heap32[(r4)] = Int32(r5)
        heapClassInst.heap32[(r4 + 13)] = 0
        heapClassInst.heap32[(r4 + 14)] = 0
        r5 = 0
        heapClassInst.heap8[r3 + 60] = Int8(r8)
        heapClassInst.heap8[r3 + 61] = Int8(r5)
        heapClassInst.heap32[(r4 + 1)] = 21
        heapClassInst.heap32[(g0)] = Int32(r3)
        _ZN22btBvhTriangleMeshShape17buildOptimizedBvhEv(i7);
        heapClassInst.heap32[(r1 + 12)] = 0
        heapClassInst.heap32[(r1 + 13)] = (-1043857408)
        r4 = _ZL14benchmarkDemo4
        heapClassInst.heap32[(r1 + 14)] = 0
        r5 = r4 >> 2
        heapClassInst.heap32[(r1 + 15)] = 0
        r5 = Int64(heapClassInst.heap32[(r5)])
        r5 = r5 >> 2
        r5 = Int64(heapClassInst.heap32[(r5 + 2)])
        heapClassInst.heap32[(g0)] = Int32(r4)
        heapClassInst.heap32[(g0 + 1)] = 0
        heapClassInst.heap32[(g0 + 2)] = Int32(r0)
        heapClassInst.heap32[(g0 + 3)] = Int32(r3)
        __FUNCTION_TABLE__[(r5) >> 2](i7);
        r2 = (r2 + 1) | 0
        r3 = commonVariable.r_g0 >> 2
        heapClassInst.heap32[(r3 + 56)] = 1063675494
        if (r2 != 8) {
            continue
        } else {
            break
        }
    }
    return;
}

@OverflowWrapping
func _ZN13BenchmarkDemo11createTest6Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-112)
    var g0 = i7 >> 2;
    r0 = gNumAlignedAllocs
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0)])
    r1 = (r1 + 1) | 0
    heapClassInst.heap32[(r0)] = Int32(r1)
    heapClassInst.heap32[(g0)] = 127
    mallocNew(i7);
    r0 = commonVariable.r_g0
    if (r0 != 0) {
        r1 = 0
        r2 = (r0 + 4) | 0
        r1 = (r1 - r2) | 0
        r1 = r1 & 15
        r1 = (r0 + r1) | 0
        r2 = (r1 + 4) | 0
        r1 = r1 >> 2
        heapClassInst.heap32[(r1)] = Int32(r0)
        r0 = r2
    }
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = 0
    heapClassInst.heap32[(g0 + 2)] = 0
    r1 = 0
    _ZN17btConvexHullShapeC1EPKfii(i7);
    while (true) {
        r2 = (r1 * (-3)) | 0
        r3 = _ZL7TaruVtx
        r2 = r2 << 2
        r2 = (r3 + r2) | 0
        r3 = sp + (-96)
        r2 = r2 >> 2
        r4 = r3 >> 2
        heapClassInst.heap32[(fp + (-24))] = heapClassInst.heap32[(r2)]
        heapClassInst.heap32[(r4 + 1)] = heapClassInst.heap32[(r2 + 1)]
        heapClassInst.heap32[(r4 + 2)] = heapClassInst.heap32[(r2 + 2)]
        heapClassInst.heap32[(r4 + 3)] = 0
        heapClassInst.heap32[(g0)] = Int32(r0)
        heapClassInst.heap32[(g0 + 1)] = Int32(r3)
        r1 = (r1 + (-1)) | 0
        _ZN17btConvexHullShape8addPointERK9btVector3(i7);
        if (r1 == (-43)) {
            break
        } else {
            continue
        }
    }
    r1 = sp + (-64)
    r2 = r1 >> 2
    heapClassInst.heap32[(fp + (-16))] = 1065353216
    heapClassInst.heap32[(r2 + 1)] = 0
    heapClassInst.heap32[(r2 + 2)] = 0
    heapClassInst.heap32[(r2 + 3)] = 0
    heapClassInst.heap32[(r2 + 4)] = 0
    heapClassInst.heap32[(r2 + 5)] = 1065353216
    heapClassInst.heap32[(r2 + 6)] = 0
    heapClassInst.heap32[(r2 + 7)] = 0
    heapClassInst.heap32[(r2 + 8)] = 0
    heapClassInst.heap32[(r2 + 9)] = 0
    heapClassInst.heap32[(r2 + 10)] = 1065353216
    heapClassInst.heap32[(r2 + 11)] = 0
    heapClassInst.heap32[(r2 + 12)] = 0
    heapClassInst.heap32[(r2 + 13)] = 0
    heapClassInst.heap32[(r2 + 14)] = 0
    r3 = sp + (-80)
    heapClassInst.heap32[(r2 + 15)] = 0
    r4 = r3 >> 2
    heapClassInst.heap32[(fp + (-20))] = 0
    heapClassInst.heap32[(r4 + 1)] = 0
    heapClassInst.heap32[(r4 + 2)] = 0
    r5 = r0 >> 2
    heapClassInst.heap32[(r4 + 3)] = 0
    r4 = Int64(heapClassInst.heap32[(r5)])
    r4 = r4 >> 2
    r4 = Int64(heapClassInst.heap32[(r4 + 8)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = 1065353216
    heapClassInst.heap32[(g0 + 2)] = Int32(r3)
    r3 = 10
    f0 = 20.0
    f1 = 2.0
    f2 = (-25.0)
    __FUNCTION_TABLE__[(r4) >> 2](i7);
    r7 = _ZL14benchmarkDemo4
    while (true) {
        f3 = 3.0
        f4 = 25.0
        f5 = f1 + f3
        f4 = f0 + f4
        r4 = 0
        r5 = r4
        while (true) {
            f6 = Float64(r5)
            f6 = f6 * f5
            f6 = f6 + f2
            f7 = 5.0
            f6 = f6 * f7
            f8 = 0.0
            f6 = f6 + f8
            r6 = r4
            while (true) {
                f9 = Float64(r6)
                f9 = f9 * f5
                f9 = f9 + f2
                f9 = f9 * f7
                f9 = f9 + f8
                heapClassInst.heapFloat[(r2 + 12)] = Float32(f9)
                heapClassInst.heapFloat[(r2 + 13)] = Float32(f4)
                heapClassInst.heapFloat[(r2 + 14)] = Float32(f6)
                r8 = r7 >> 2
                heapClassInst.heap32[(r2 + 15)] = 0
                r8 = Int64(heapClassInst.heap32[(r8)])
                r8 = r8 >> 2
                r8 = Int64(heapClassInst.heap32[(r8 + 2)])
                heapClassInst.heap32[(g0)] = Int32(r7)
                heapClassInst.heap32[(g0 + 1)] = 1065353216
                heapClassInst.heap32[(g0 + 2)] = Int32(r1)
                heapClassInst.heap32[(g0 + 3)] = Int32(r0)
                r6 = (r6 + 1) | 0
                __FUNCTION_TABLE__[(r8) >> 2](i7);
                if (r6 != 10) {
                    continue
                } else {
                    break
                }
            }
            r5 = (r5 + 1) | 0
            if (r5 != 10) {
                continue
            } else {
                break
            }
        }
        f4 = 1.1000000238418579
        f5 = -0.05000000074505806
        f4 = f1 * f4
        f1 = f1 * f5
        f5 = 9.0
        f3 = f4 + f3
        f1 = f1 * f5
        r3 = (r3 + (-1)) | 0
        f0 = f0 + f3
        f2 = f1 + f2
        f1 = f4
        if (r3 == 0) {
            break
        } else {
            continue
        }
    }
    _ZN13BenchmarkDemo19createLargeMeshBodyEv(i7);
    return;
}

@OverflowWrapping
func _ZN7RagDoll20localCreateRigidBodyEfRK11btTransformP16btCollisionShape(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-168)
    var g0 = i7 >> 2;
    r0 = sp + (-16)
    r1 = r0 >> 2
    heapClassInst.heap32[(fp + (-4))] = 0
    heapClassInst.heap32[(r1 + 1)] = 0
    r2 = Int64(heapClassInst.heap32[(fp + 2)])
    heapClassInst.heap32[(r1 + 2)] = 0
    r3 = r2 >> 2
    heapClassInst.heap32[(r1 + 3)] = 0
    r3 = Int64(heapClassInst.heap32[(r3)])
    r3 = r3 >> 2
    r3 = Int64(heapClassInst.heap32[(r3 + 8)])
    heapClassInst.heap32[(g0)] = Int32(r2)
    heapClassInst.heap32[(g0 + 1)] = 1065353216
    heapClassInst.heap32[(g0 + 2)] = Int32(r0)
    r0 = _ZGVZN11btTransform11getIdentityEvE17identityTransform
    __FUNCTION_TABLE__[(r3) >> 2](i7);
    r3 = Int64(heapClassInst.heapU8[r0])
    if (!(r3 != 0)) {
        r3 = _ZGVZN11btMatrix3x311getIdentityEvE14identityMatrix
        r4 = Int64(heapClassInst.heapU8[r3])
        if (!(r4 != 0)) {
            r4 = _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_0_2E_0_2E_0
            r5 = _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_1_2E_0_2E_1
            r4 = r4 >> 2
            r6 = _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_2_2E_0_2E_2
            r5 = r5 >> 2
            heapClassInst.heap32[(r4)] = 1065353216
            r4 = r6 >> 2
            heapClassInst.heap32[(r5)] = 1065353216
            r5 = 1
            heapClassInst.heap32[(r4)] = 1065353216
            heapClassInst.heap8[r3] = Int8(r5)
        }
        r3 = _ZZN11btTransform11getIdentityEvE17identityTransform
        r4 = _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_0_2E_0_2E_0
        r3 = r3 >> 2
        r4 = r4 >> 2
        heapClassInst.heap32[(r3)] = heapClassInst.heap32[(r4)]
        heapClassInst.heap32[(r3 + 1)] = 0
        heapClassInst.heap32[(r3 + 2)] = 0
        r4 = _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_1_2E_0_2E_1
        heapClassInst.heap32[(r3 + 3)] = 0
        r4 = r4 >> 2
        heapClassInst.heap32[(r3 + 4)] = 0
        heapClassInst.heap32[(r3 + 5)] = heapClassInst.heap32[(r4)]
        heapClassInst.heap32[(r3 + 6)] = 0
        heapClassInst.heap32[(r3 + 7)] = 0
        r4 = _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_2_2E_0_2E_2
        heapClassInst.heap32[(r3 + 8)] = 0
        r4 = r4 >> 2
        heapClassInst.heap32[(r3 + 9)] = 0
        heapClassInst.heap32[(r3 + 10)] = heapClassInst.heap32[(r4)]
        heapClassInst.heap32[(r3 + 11)] = 0
        heapClassInst.heap32[(r3 + 12)] = 0
        heapClassInst.heap32[(r3 + 13)] = 0
        heapClassInst.heap32[(r3 + 14)] = 0
        r4 = 1
        heapClassInst.heap32[(r3 + 15)] = 0
        heapClassInst.heap8[r0] = Int8(r4)
    }
    r0 = Int64(heapClassInst.heap32[(fp)])
    r3 = Int64(heapClassInst.heap32[(fp + 1)])
    heapClassInst.heap32[(g0)] = 200
    r4 = _ZTV20btDefaultMotionState
    _Znwj(i7);
    r6 = commonVariable.r_g0 >> 2
    r4 = (r4 + 8) | 0
    r3 = r3 >> 2
    heapClassInst.heap32[(r6)] = Int32(r4)
    heapClassInst.heap32[(r6 + 1)] = heapClassInst.heap32[(r3)]
    heapClassInst.heap32[(r6 + 2)] = heapClassInst.heap32[(r3 + 1)]
    heapClassInst.heap32[(r6 + 3)] = heapClassInst.heap32[(r3 + 2)]
    heapClassInst.heap32[(r6 + 4)] = heapClassInst.heap32[(r3 + 3)]
    heapClassInst.heap32[(r6 + 5)] = heapClassInst.heap32[(r3 + 4)]
    heapClassInst.heap32[(r6 + 6)] = heapClassInst.heap32[(r3 + 5)]
    heapClassInst.heap32[(r6 + 7)] = heapClassInst.heap32[(r3 + 6)]
    heapClassInst.heap32[(r6 + 8)] = heapClassInst.heap32[(r3 + 7)]
    heapClassInst.heap32[(r6 + 9)] = heapClassInst.heap32[(r3 + 8)]
    heapClassInst.heap32[(r6 + 10)] = heapClassInst.heap32[(r3 + 9)]
    heapClassInst.heap32[(r6 + 11)] = heapClassInst.heap32[(r3 + 10)]
    heapClassInst.heap32[(r6 + 12)] = heapClassInst.heap32[(r3 + 11)]
    heapClassInst.heap32[(r6 + 13)] = heapClassInst.heap32[(r3 + 12)]
    heapClassInst.heap32[(r6 + 14)] = heapClassInst.heap32[(r3 + 13)]
    r4 = _ZZN11btTransform11getIdentityEvE17identityTransform
    heapClassInst.heap32[(r6 + 15)] = heapClassInst.heap32[(r3 + 14)]
    r4 = r4 >> 2
    heapClassInst.heap32[(r6 + 16)] = heapClassInst.heap32[(r3 + 15)]
    heapClassInst.heap32[(r6 + 17)] = heapClassInst.heap32[(r4)]
    heapClassInst.heap32[(r6 + 18)] = heapClassInst.heap32[(r4 + 1)]
    heapClassInst.heap32[(r6 + 19)] = heapClassInst.heap32[(r4 + 2)]
    heapClassInst.heap32[(r6 + 20)] = heapClassInst.heap32[(r4 + 3)]
    heapClassInst.heap32[(r6 + 21)] = heapClassInst.heap32[(r4 + 4)]
    heapClassInst.heap32[(r6 + 22)] = heapClassInst.heap32[(r4 + 5)]
    heapClassInst.heap32[(r6 + 23)] = heapClassInst.heap32[(r4 + 6)]
    heapClassInst.heap32[(r6 + 24)] = heapClassInst.heap32[(r4 + 7)]
    heapClassInst.heap32[(r6 + 25)] = heapClassInst.heap32[(r4 + 8)]
    heapClassInst.heap32[(r6 + 26)] = heapClassInst.heap32[(r4 + 9)]
    heapClassInst.heap32[(r6 + 27)] = heapClassInst.heap32[(r4 + 10)]
    heapClassInst.heap32[(r6 + 28)] = heapClassInst.heap32[(r4 + 11)]
    heapClassInst.heap32[(r6 + 29)] = heapClassInst.heap32[(r4 + 12)]
    heapClassInst.heap32[(r6 + 30)] = heapClassInst.heap32[(r4 + 13)]
    heapClassInst.heap32[(r6 + 31)] = heapClassInst.heap32[(r4 + 14)]
    heapClassInst.heap32[(r6 + 32)] = heapClassInst.heap32[(r4 + 15)]
    heapClassInst.heap32[(r6 + 33)] = heapClassInst.heap32[(r3)]
    heapClassInst.heap32[(r6 + 34)] = heapClassInst.heap32[(r3 + 1)]
    heapClassInst.heap32[(r6 + 35)] = heapClassInst.heap32[(r3 + 2)]
    heapClassInst.heap32[(r6 + 36)] = heapClassInst.heap32[(r3 + 3)]
    heapClassInst.heap32[(r6 + 37)] = heapClassInst.heap32[(r3 + 4)]
    heapClassInst.heap32[(r6 + 38)] = heapClassInst.heap32[(r3 + 5)]
    heapClassInst.heap32[(r6 + 39)] = heapClassInst.heap32[(r3 + 6)]
    heapClassInst.heap32[(r6 + 40)] = heapClassInst.heap32[(r3 + 7)]
    heapClassInst.heap32[(r6 + 41)] = heapClassInst.heap32[(r3 + 8)]
    heapClassInst.heap32[(r6 + 42)] = heapClassInst.heap32[(r3 + 9)]
    heapClassInst.heap32[(r6 + 43)] = heapClassInst.heap32[(r3 + 10)]
    heapClassInst.heap32[(r6 + 44)] = heapClassInst.heap32[(r3 + 11)]
    heapClassInst.heap32[(r6 + 45)] = heapClassInst.heap32[(r3 + 12)]
    heapClassInst.heap32[(r6 + 46)] = heapClassInst.heap32[(r3 + 13)]
    heapClassInst.heap32[(r6 + 47)] = heapClassInst.heap32[(r3 + 14)]
    heapClassInst.heap32[(r6 + 48)] = heapClassInst.heap32[(r3 + 15)]
    r3 = sp + (-152)
    heapClassInst.heap32[(r6 + 49)] = 0
    r4 = r3 >> 2
    heapClassInst.heap32[(fp + (-38))] = 1065353216
    heapClassInst.heap32[(r4 + 1)] = Int32(commonVariable.r_g0)
    heapClassInst.heap32[(r4 + 18)] = Int32(r2)
    heapClassInst.heap32[(r4 + 19)] = heapClassInst.heap32[(fp + (-4))]
    heapClassInst.heap32[(r4 + 20)] = heapClassInst.heap32[(r1 + 1)]
    heapClassInst.heap32[(r4 + 21)] = heapClassInst.heap32[(r1 + 2)]
    heapClassInst.heap32[(r4 + 22)] = heapClassInst.heap32[(r1 + 3)]
    heapClassInst.heap32[(r4 + 23)] = 0
    heapClassInst.heap32[(r4 + 24)] = 0
    heapClassInst.heap32[(r4 + 25)] = 1056964608
    heapClassInst.heap32[(r4 + 26)] = 0
    heapClassInst.heap32[(r4 + 27)] = 1061997773
    r1 = 0
    heapClassInst.heap32[(r4 + 28)] = 1065353216
    heapClassInst.heap8[sp + (-36)] = Int8(r1)
    heapClassInst.heap32[(r4 + 30)] = 1000593162
    heapClassInst.heap32[(r4 + 31)] = 1008981770
    heapClassInst.heap32[(r4 + 32)] = 1008981770
    heapClassInst.heap32[(r4 + 33)] = 1008981770
    heapClassInst.heap32[(r4 + 2)] = 1065353216
    heapClassInst.heap32[(r4 + 3)] = 0
    heapClassInst.heap32[(r4 + 4)] = 0
    heapClassInst.heap32[(r4 + 5)] = 0
    heapClassInst.heap32[(r4 + 6)] = 0
    heapClassInst.heap32[(r4 + 7)] = 1065353216
    heapClassInst.heap32[(r4 + 8)] = 0
    heapClassInst.heap32[(r4 + 9)] = 0
    heapClassInst.heap32[(r4 + 10)] = 0
    heapClassInst.heap32[(r4 + 11)] = 0
    heapClassInst.heap32[(r4 + 12)] = 1065353216
    heapClassInst.heap32[(r4 + 13)] = 0
    heapClassInst.heap32[(r4 + 14)] = 0
    heapClassInst.heap32[(r4 + 15)] = 0
    r2 = gNumAlignedAllocs
    heapClassInst.heap32[(r4 + 16)] = 0
    r2 = r2 >> 2
    heapClassInst.heap32[(r4 + 17)] = 0
    r4 = Int64(heapClassInst.heap32[(r2)])
    r4 = (r4 + 1) | 0
    heapClassInst.heap32[(r2)] = Int32(r4)
    heapClassInst.heap32[(g0)] = 627
    mallocNew(i7);
    r2 = commonVariable.r_g0
    if (r2 != 0) {
        r4 = (r2 + 4) | 0
        r1 = (r1 - r4) | 0
        r1 = r1 & 15
        r1 = (r2 + r1) | 0
        r4 = (r1 + 4) | 0
        r1 = r1 >> 2
        heapClassInst.heap32[(r1)] = Int32(r2)
        r2 = r4
    }
    r1 = r2 >> 2
    heapClassInst.heap32[(r1 + 41)] = 1065353216
    heapClassInst.heap32[(r1 + 42)] = 1065353216
    heapClassInst.heap32[(r1 + 43)] = 1065353216
    heapClassInst.heap32[(r1 + 44)] = 0
    heapClassInst.heap32[(r1 + 45)] = 0
    heapClassInst.heap32[(r1 + 46)] = 1566444395
    heapClassInst.heap32[(r1 + 47)] = 0
    heapClassInst.heap32[(r1 + 48)] = 0
    heapClassInst.heap32[(r1 + 49)] = 0
    heapClassInst.heap32[(r1 + 50)] = 0
    heapClassInst.heap32[(r1 + 51)] = 1
    heapClassInst.heap32[(r1 + 52)] = (-1)
    heapClassInst.heap32[(r1 + 53)] = (-1)
    heapClassInst.heap32[(r1 + 54)] = 1
    heapClassInst.heap32[(r1 + 55)] = 0
    heapClassInst.heap32[(r1 + 56)] = 1056964608
    heapClassInst.heap32[(r1 + 57)] = 0
    heapClassInst.heap32[(r1 + 58)] = 1
    heapClassInst.heap32[(r1 + 59)] = 0
    heapClassInst.heap32[(r1 + 60)] = 1065353216
    heapClassInst.heap32[(r1 + 61)] = 0
    heapClassInst.heap32[(r1 + 62)] = 0
    heapClassInst.heap32[(r1 + 63)] = 0
    heapClassInst.heap32[(r1 + 1)] = 1065353216
    heapClassInst.heap32[(r1 + 2)] = 0
    heapClassInst.heap32[(r1 + 3)] = 0
    heapClassInst.heap32[(r1 + 4)] = 0
    heapClassInst.heap32[(r1 + 5)] = 0
    heapClassInst.heap32[(r1 + 6)] = 1065353216
    heapClassInst.heap32[(r1 + 7)] = 0
    heapClassInst.heap32[(r1 + 8)] = 0
    heapClassInst.heap32[(r1 + 9)] = 0
    heapClassInst.heap32[(r1 + 10)] = 0
    heapClassInst.heap32[(r1 + 11)] = 1065353216
    heapClassInst.heap32[(r1 + 12)] = 0
    heapClassInst.heap32[(r1 + 13)] = 0
    heapClassInst.heap32[(r1 + 14)] = 0
    r4 = _ZTV11btRigidBody
    heapClassInst.heap32[(r1 + 15)] = 0
    r4 = (r4 + 8) | 0
    heapClassInst.heap32[(r1 + 16)] = 0
    r5 = 1
    heapClassInst.heap32[(r1)] = Int32(r4)
    heapClassInst.heap8[r2 + 492] = Int8(r5)
    heapClassInst.heap32[(r1 + 122)] = 0
    heapClassInst.heap32[(r1 + 120)] = 0
    heapClassInst.heap32[(r1 + 121)] = 0
    heapClassInst.heap32[(g0)] = Int32(r2)
    heapClassInst.heap32[(g0 + 1)] = Int32(r3)
    _ZN11btRigidBody14setupRigidBodyERKNS_27btRigidBodyConstructionInfoE(i7);
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0 + 1)])
    r1 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r1)])
    r1 = r1 >> 2
    r1 = Int64(heapClassInst.heap32[(r1 + 20)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r2)
    __FUNCTION_TABLE__[(r1) >> 2](i7);
    commonVariable.r_g0 = r2
    return;
}

@OverflowWrapping
func _ZN13BenchmarkDemo11initPhysicsEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
    var f12: Float64 = 0.0
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var f16: Float64 = 0.0
    var f17: Float64 = 0.0
    var f18: Float64 = 0.0
    var f19: Float64 = 0.0
    var f20: Float64 = 0.0
    var f21: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-41432)
    var g0 = i7 >> 2;
    heapClassInst.heap32[(g0)] = 88
    _Znwj(i7);
    r0 = commonVariable.r_g0
    r1 = _ZTV31btDefaultCollisionConfiguration
    r2 = gNumAlignedAllocs
    r3 = r0 >> 2
    r1 = (r1 + 8) | 0
    r2 = r2 >> 2
    heapClassInst.heap32[(r3)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2)])
    r3 = (r1 + 1) | 0
    heapClassInst.heap32[(r2)] = Int32(r3)
    heapClassInst.heap32[(g0)] = 379
    mallocNew(i7);
    r3 = commonVariable.r_g0
    if (r3 != 0) {
        r4 = 0
        r5 = (r3 + 4) | 0
        r4 = (r4 - r5) | 0
        r4 = r4 & 15
        r4 = (r3 + r4) | 0
        r5 = (r4 + 4) | 0
        r4 = r4 >> 2
        heapClassInst.heap32[(r4)] = Int32(r3)
        r3 = r5
    }
    r4 = r3 >> 2
    heapClassInst.heap32[(r4 + 77)] = 953267991
    r4 = Int64(heapClassInst.heapU8[r3 + 332])
    r4 = r4 & 240
    r5 = r0 >> 2
    heapClassInst.heap8[r3 + 332] = Int8(r4)
    r4 = (r1 + 2) | 0
    heapClassInst.heap32[(r5 + 8)] = Int32(r3)
    heapClassInst.heap32[(r2)] = Int32(r4)
    heapClassInst.heap32[(g0)] = 23
    mallocNew(i7);
    r3 = commonVariable.r_g0
    if (r3 != 0) {
        r4 = 0
        r6 = (r3 + 4) | 0
        r4 = (r4 - r6) | 0
        r4 = r4 & 15
        r4 = (r3 + r4) | 0
        r6 = (r4 + 4) | 0
        r4 = r4 >> 2
        heapClassInst.heap32[(r4)] = Int32(r3)
        r3 = r6
    }
    r4 = _ZTV30btGjkEpaPenetrationDepthSolver
    r6 = r3 >> 2
    r4 = (r4 + 8) | 0
    heapClassInst.heap32[(r6)] = Int32(r4)
    r4 = (r1 + 3) | 0
    heapClassInst.heap32[(r5 + 9)] = Int32(r3)
    heapClassInst.heap32[(r2)] = Int32(r4)
    heapClassInst.heap32[(g0)] = 43
    mallocNew(i7);
    r4 = commonVariable.r_g0
    if (r4 != 0) {
        r3 = 0
        r6 = (r4 + 4) | 0
        r3 = (r3 - r6) | 0
        r3 = r3 & 15
        r3 = (r4 + r3) | 0
        r6 = r3 >> 2
        heapClassInst.heap32[(r6)] = Int32(r4)
        r4 = (r3 + 4) | 0
        r3 = Int64(heapClassInst.heap32[(r5 + 9)])
    }
    r6 = _ZTVN23btConvexConvexAlgorithm10CreateFuncE
    r7 = Int64(heapClassInst.heap32[(r5 + 8)])
    r8 = 0
    r9 = r4 >> 2
    r6 = (r6 + 8) | 0
    heapClassInst.heap8[r4 + 4] = Int8(r8)
    heapClassInst.heap32[(r9)] = Int32(r6)
    heapClassInst.heap32[(r9 + 4)] = 0
    heapClassInst.heap32[(r9 + 5)] = 3
    heapClassInst.heap32[(r9 + 3)] = Int32(r7)
    heapClassInst.heap32[(r9 + 2)] = Int32(r3)
    r3 = (r1 + 4) | 0
    heapClassInst.heap32[(r5 + 10)] = Int32(r4)
    heapClassInst.heap32[(r2)] = Int32(r3)
    heapClassInst.heap32[(g0)] = 27
    mallocNew(i7);
    r3 = commonVariable.r_g0
    if (r3 != 0) {
        r4 = (r3 + 4) | 0
        r4 = (r8 - r4) | 0
        r4 = r4 & 15
        r4 = (r3 + r4) | 0
        r6 = (r4 + 4) | 0
        r4 = r4 >> 2
        heapClassInst.heap32[(r4)] = Int32(r3)
        r3 = r6
    }
    r4 = _ZTVN33btConvexConcaveCollisionAlgorithm10CreateFuncE
    r6 = r3 >> 2
    r4 = (r4 + 8) | 0
    heapClassInst.heap8[r3 + 4] = Int8(r8)
    heapClassInst.heap32[(r6)] = Int32(r4)
    r4 = (r1 + 5) | 0
    heapClassInst.heap32[(r5 + 11)] = Int32(r3)
    heapClassInst.heap32[(r2)] = Int32(r4)
    heapClassInst.heap32[(g0)] = 27
    mallocNew(i7);
    r3 = commonVariable.r_g0
    if (r3 != 0) {
        r4 = (r3 + 4) | 0
        r4 = (r8 - r4) | 0
        r4 = r4 & 15
        r4 = (r3 + r4) | 0
        r6 = (r4 + 4) | 0
        r4 = r4 >> 2
        heapClassInst.heap32[(r4)] = Int32(r3)
        r3 = r6
    }
    r4 = _ZTVN33btConvexConcaveCollisionAlgorithm17SwappedCreateFuncE
    r6 = r3 >> 2
    r4 = (r4 + 8) | 0
    heapClassInst.heap8[r3 + 4] = Int8(r8)
    heapClassInst.heap32[(r6)] = Int32(r4)
    r4 = (r1 + 6) | 0
    heapClassInst.heap32[(r5 + 12)] = Int32(r3)
    heapClassInst.heap32[(r2)] = Int32(r4)
    heapClassInst.heap32[(g0)] = 27
    mallocNew(i7);
    r3 = commonVariable.r_g0
    if (r3 != 0) {
        r4 = (r3 + 4) | 0
        r4 = (r8 - r4) | 0
        r4 = r4 & 15
        r4 = (r3 + r4) | 0
        r6 = (r4 + 4) | 0
        r4 = r4 >> 2
        heapClassInst.heap32[(r4)] = Int32(r3)
        r3 = r6
    }
    r4 = _ZTVN28btCompoundCollisionAlgorithm10CreateFuncE
    r6 = r3 >> 2
    r4 = (r4 + 8) | 0
    heapClassInst.heap8[r3 + 4] = Int8(r8)
    heapClassInst.heap32[(r6)] = Int32(r4)
    r4 = (r1 + 7) | 0
    heapClassInst.heap32[(r5 + 13)] = Int32(r3)
    heapClassInst.heap32[(r2)] = Int32(r4)
    heapClassInst.heap32[(g0)] = 27
    mallocNew(i7);
    r3 = commonVariable.r_g0
    if (r3 != 0) {
        r4 = (r3 + 4) | 0
        r4 = (r8 - r4) | 0
        r4 = r4 & 15
        r4 = (r3 + r4) | 0
        r6 = (r4 + 4) | 0
        r4 = r4 >> 2
        heapClassInst.heap32[(r4)] = Int32(r3)
        r3 = r6
    }
    r4 = _ZTVN28btCompoundCollisionAlgorithm17SwappedCreateFuncE
    r6 = r3 >> 2
    r4 = (r4 + 8) | 0
    heapClassInst.heap8[r3 + 4] = Int8(r8)
    heapClassInst.heap32[(r6)] = Int32(r4)
    r4 = (r1 + 8) | 0
    heapClassInst.heap32[(r5 + 14)] = Int32(r3)
    heapClassInst.heap32[(r2)] = Int32(r4)
    heapClassInst.heap32[(g0)] = 27
    mallocNew(i7);
    r3 = commonVariable.r_g0
    if (r3 != 0) {
        r4 = (r3 + 4) | 0
        r4 = (r8 - r4) | 0
        r4 = r4 & 15
        r4 = (r3 + r4) | 0
        r6 = (r4 + 4) | 0
        r4 = r4 >> 2
        heapClassInst.heap32[(r4)] = Int32(r3)
        r3 = r6
    }
    r4 = _ZTVN16btEmptyAlgorithm10CreateFuncE
    r6 = r3 >> 2
    r4 = (r4 + 8) | 0
    heapClassInst.heap8[r3 + 4] = Int8(r8)
    heapClassInst.heap32[(r6)] = Int32(r4)
    r4 = (r1 + 9) | 0
    heapClassInst.heap32[(r5 + 15)] = Int32(r3)
    heapClassInst.heap32[(r2)] = Int32(r4)
    heapClassInst.heap32[(g0)] = 27
    mallocNew(i7);
    r3 = commonVariable.r_g0
    if (r3 != 0) {
        r4 = (r3 + 4) | 0
        r4 = (r8 - r4) | 0
        r4 = r4 & 15
        r4 = (r3 + r4) | 0
        r6 = (r4 + 4) | 0
        r4 = r4 >> 2
        heapClassInst.heap32[(r4)] = Int32(r3)
        r3 = r6
    }
    r4 = _ZTVN32btSphereSphereCollisionAlgorithm10CreateFuncE
    r6 = r3 >> 2
    r4 = (r4 + 8) | 0
    heapClassInst.heap8[r3 + 4] = Int8(r8)
    heapClassInst.heap32[(r6)] = Int32(r4)
    r4 = (r1 + 10) | 0
    heapClassInst.heap32[(r5 + 16)] = Int32(r3)
    heapClassInst.heap32[(r2)] = Int32(r4)
    heapClassInst.heap32[(g0)] = 27
    mallocNew(i7);
    r3 = commonVariable.r_g0
    if (r3 != 0) {
        r4 = (r3 + 4) | 0
        r4 = (r8 - r4) | 0
        r4 = r4 & 15
        r4 = (r3 + r4) | 0
        r6 = (r4 + 4) | 0
        r4 = r4 >> 2
        heapClassInst.heap32[(r4)] = Int32(r3)
        r3 = r6
    }
    r4 = _ZTVN34btSphereTriangleCollisionAlgorithm10CreateFuncE
    r6 = r3 >> 2
    r4 = (r4 + 8) | 0
    heapClassInst.heap8[r3 + 4] = Int8(r8)
    heapClassInst.heap32[(r6)] = Int32(r4)
    r6 = (r1 + 11) | 0
    heapClassInst.heap32[(r5 + 18)] = Int32(r3)
    heapClassInst.heap32[(r2)] = Int32(r6)
    heapClassInst.heap32[(g0)] = 27
    mallocNew(i7);
    r3 = commonVariable.r_g0
    if (r3 != 0) {
        r6 = (r3 + 4) | 0
        r6 = (r8 - r6) | 0
        r6 = r6 & 15
        r6 = (r3 + r6) | 0
        r7 = (r6 + 4) | 0
        r6 = r6 >> 2
        heapClassInst.heap32[(r6)] = Int32(r3)
        r3 = r7
    }
    r6 = r3 >> 2
    heapClassInst.heap8[r3 + 4] = Int8(r8)
    heapClassInst.heap32[(r6)] = Int32(r4)
    r4 = 1
    heapClassInst.heap32[(r5 + 19)] = Int32(r3)
    r6 = (r1 + 12) | 0
    heapClassInst.heap8[r3 + 4] = Int8(r4)
    heapClassInst.heap32[(r2)] = Int32(r6)
    heapClassInst.heap32[(g0)] = 27
    mallocNew(i7);
    r3 = commonVariable.r_g0
    if (r3 != 0) {
        r6 = (r3 + 4) | 0
        r6 = (r8 - r6) | 0
        r6 = r6 & 15
        r6 = (r3 + r6) | 0
        r7 = (r6 + 4) | 0
        r6 = r6 >> 2
        heapClassInst.heap32[(r6)] = Int32(r3)
        r3 = r7
    }
    r6 = _ZTVN26btBoxBoxCollisionAlgorithm10CreateFuncE
    r7 = r3 >> 2
    r6 = (r6 + 8) | 0
    heapClassInst.heap8[r3 + 4] = Int8(r8)
    heapClassInst.heap32[(r7)] = Int32(r6)
    r6 = (r1 + 13) | 0
    heapClassInst.heap32[(r5 + 17)] = Int32(r3)
    heapClassInst.heap32[(r2)] = Int32(r6)
    heapClassInst.heap32[(g0)] = 35
    mallocNew(i7);
    r3 = commonVariable.r_g0
    if (r3 != 0) {
        r6 = (r3 + 4) | 0
        r6 = (r8 - r6) | 0
        r6 = r6 & 15
        r6 = (r3 + r6) | 0
        r7 = (r6 + 4) | 0
        r6 = r6 >> 2
        heapClassInst.heap32[(r6)] = Int32(r3)
        r3 = r7
    }
    r6 = _ZTVN31btConvexPlaneCollisionAlgorithm10CreateFuncE
    r7 = r3 >> 2
    r6 = (r6 + 8) | 0
    heapClassInst.heap8[r3 + 4] = Int8(r8)
    heapClassInst.heap32[(r7)] = Int32(r6)
    heapClassInst.heap32[(r7 + 2)] = 1
    heapClassInst.heap32[(r7 + 3)] = 1
    r7 = (r1 + 14) | 0
    heapClassInst.heap32[(r5 + 21)] = Int32(r3)
    heapClassInst.heap32[(r2)] = Int32(r7)
    heapClassInst.heap32[(g0)] = 35
    mallocNew(i7);
    r3 = commonVariable.r_g0
    if (r3 != 0) {
        r7 = (r3 + 4) | 0
        r7 = (r8 - r7) | 0
        r7 = r7 & 15
        r7 = (r3 + r7) | 0
        r9 = (r7 + 4) | 0
        r7 = r7 >> 2
        heapClassInst.heap32[(r7)] = Int32(r3)
        r3 = r9
    }
    r7 = r3 >> 2
    heapClassInst.heap8[r3 + 4] = Int8(r8)
    heapClassInst.heap32[(r7)] = Int32(r6)
    heapClassInst.heap32[(r7 + 2)] = 1
    heapClassInst.heap32[(r7 + 3)] = 1
    heapClassInst.heap32[(r5 + 20)] = Int32(r3)
    heapClassInst.heap8[r3 + 4] = Int8(r4)
    r3 = (r1 + 15) | 0
    heapClassInst.heap8[r0 + 12] = Int8(r4)
    heapClassInst.heap32[(r2)] = Int32(r3)
    heapClassInst.heap32[(g0)] = 39
    mallocNew(i7);
    r3 = commonVariable.r_g0
    if (r3 != 0) {
        r6 = (r3 + 4) | 0
        r6 = (r8 - r6) | 0
        r6 = r6 & 15
        r6 = (r3 + r6) | 0
        r7 = (r6 + 4) | 0
        r6 = r6 >> 2
        heapClassInst.heap32[(r6)] = Int32(r3)
        r3 = r7
    }
    r6 = r3 >> 2
    heapClassInst.heap32[(r6 + 1)] = 0
    heapClassInst.heap32[(r6 + 3)] = 0
    heapClassInst.heap8[r3 + 16] = Int8(r8)
    heapClassInst.heap32[(r6)] = 0
    r7 = (r1 + 16) | 0
    heapClassInst.heap32[(r6 + 2)] = 0
    heapClassInst.heap32[(r2)] = Int32(r7)
    heapClassInst.heap32[(g0)] = 19
    mallocNew(i7);
    r7 = commonVariable.r_g0
    if (r7 != 0) {
        r9 = (r7 + 4) | 0
        r9 = (r8 - r9) | 0
        r9 = r9 & 15
        r9 = (r7 + r9) | 0
        r10 = (r9 + 4) | 0
        r9 = r9 >> 2
        heapClassInst.heap32[(r9)] = Int32(r7)
        r7 = r10
    }
    heapClassInst.heap32[(r6)] = Int32(r7)
    heapClassInst.heap32[(r6 + 1)] = 0
    heapClassInst.heap32[(r5 + 2)] = Int32(r3)
    r3 = (r1 + 17) | 0
    heapClassInst.heap8[r0 + 20] = Int8(r4)
    heapClassInst.heap32[(r2)] = Int32(r3)
    heapClassInst.heap32[(g0)] = 39
    mallocNew(i7);
    r3 = commonVariable.r_g0
    if (r3 != 0) {
        r6 = (r3 + 4) | 0
        r6 = (r8 - r6) | 0
        r6 = r6 & 15
        r6 = (r3 + r6) | 0
        r7 = (r6 + 4) | 0
        r6 = r6 >> 2
        heapClassInst.heap32[(r6)] = Int32(r3)
        r3 = r7
    }
    r6 = r3 >> 2
    heapClassInst.heap32[(r6)] = 1140
    r7 = (r1 + 18) | 0
    heapClassInst.heap32[(r6 + 1)] = 4096
    heapClassInst.heap32[(r2)] = Int32(r7)
    heapClassInst.heap32[(g0)] = 4669459
    mallocNew(i7);
    r7 = commonVariable.r_g0
    if (r7 != 0) {
        r9 = (r7 + 4) | 0
        r9 = (r8 - r9) | 0
        r9 = r9 & 15
        r9 = (r7 + r9) | 0
        r10 = (r9 + 4) | 0
        r9 = r9 >> 2
        heapClassInst.heap32[(r9)] = Int32(r7)
        r7 = r10
    }
    heapClassInst.heap32[(r6 + 4)] = Int32(r7)
    r9 = 4095
    r10 = 1140
    heapClassInst.heap32[(r6 + 3)] = Int32(r7)
    heapClassInst.heap32[(r6 + 2)] = 4096
    r11 = r7
    while (true) {
        r7 = r7 >> 2
        r10 = (r11 + r10) | 0
        heapClassInst.heap32[(r7)] = Int32(r10)
        r10 = Int64(heapClassInst.heap32[(r6)])
        r7 = (r11 + r10) | 0
        r9 = (r9 + (-1)) | 0
        r11 = r7
        if (r9 != 0) {
            continue
        } else {
            break
        }
    }
    r6 = r7 >> 2
    heapClassInst.heap32[(r6)] = 0
    heapClassInst.heap32[(r5 + 4)] = Int32(r3)
    r3 = (r1 + 19) | 0
    heapClassInst.heap8[r0 + 28] = Int8(r4)
    heapClassInst.heap32[(r2)] = Int32(r3)
    heapClassInst.heap32[(g0)] = 39
    mallocNew(i7);
    r3 = commonVariable.r_g0
    if (r3 != 0) {
        r6 = (r3 + 4) | 0
        r6 = (r8 - r6) | 0
        r6 = r6 & 15
        r6 = (r3 + r6) | 0
        r7 = (r6 + 4) | 0
        r6 = r6 >> 2
        heapClassInst.heap32[(r6)] = Int32(r3)
        r3 = r7
    }
    r6 = r3 >> 2
    heapClassInst.heap32[(r6)] = 80
    r1 = (r1 + 20) | 0
    heapClassInst.heap32[(r6 + 1)] = 4096
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = 327699
    mallocNew(i7);
    r1 = commonVariable.r_g0
    if (r1 != 0) {
        r7 = (r1 + 4) | 0
        r7 = (r8 - r7) | 0
        r7 = r7 & 15
        r7 = (r1 + r7) | 0
        r9 = (r7 + 4) | 0
        r7 = r7 >> 2
        heapClassInst.heap32[(r7)] = Int32(r1)
        r1 = r9
    }
    heapClassInst.heap32[(r6 + 4)] = Int32(r1)
    r7 = 4095
    r9 = 80
    heapClassInst.heap32[(r6 + 3)] = Int32(r1)
    heapClassInst.heap32[(r6 + 2)] = 4096
    r10 = r1
    while (true) {
        r1 = r1 >> 2
        r9 = (r10 + r9) | 0
        heapClassInst.heap32[(r1)] = Int32(r9)
        r9 = Int64(heapClassInst.heap32[(r6)])
        r1 = (r10 + r9) | 0
        r7 = (r7 + (-1)) | 0
        r10 = r1
        if (r7 != 0) {
            continue
        } else {
            break
        }
    }
    r1 = r1 >> 2
    r6 = _ZL14benchmarkDemo4
    heapClassInst.heap32[(r1)] = 0
    r1 = r6 >> 2
    heapClassInst.heap32[(r5 + 6)] = Int32(r3)
    heapClassInst.heap32[(r1 + 16)] = Int32(r0)
    heapClassInst.heap32[(g0)] = 5388
    _Znwj(i7);
    r0 = commonVariable.r_g0
    r3 = _ZTV21btCollisionDispatcher
    r5 = Int64(heapClassInst.heap32[(r1 + 16)])
    r3 = (r3 + 8) | 0
    r7 = r0 >> 2
    heapClassInst.heap32[(r7)] = Int32(r3)
    heapClassInst.heap32[(r7 + 1)] = 2
    heapClassInst.heap8[r0 + 24] = Int8(r4)
    heapClassInst.heap32[(r7 + 5)] = 0
    r3 = _ZTV16btManifoldResult
    heapClassInst.heap32[(r7 + 3)] = 0
    r3 = (r3 + 8) | 0
    heapClassInst.heap32[(r7 + 4)] = 0
    heapClassInst.heap32[(r7 + 7)] = Int32(r3)
    r3 = swrite_Index.
        _ZN21btCollisionDispatcher19defaultNearCallbackER16btBroadphasePairRS_RK16btDispatcherInfo__index__
    heapClassInst.heap32[(r7 + 1346)] = Int32(r5)
    heapClassInst.heap32[(r7 + 47)] = Int32(r3)
    r3 = r5 >> 2
    r9 = Int64(heapClassInst.heap32[(r3)])
    r9 = r9 >> 2
    r9 = Int64(heapClassInst.heap32[(r9 + 3)])
    heapClassInst.heap32[(g0)] = Int32(r5)
    __FUNCTION_TABLE__[(r9) >> 2](i7);
    heapClassInst.heap32[(r7 + 48)] = Int32(commonVariable.r_g0)
    r3 = Int64(heapClassInst.heap32[(r3)])
    r3 = r3 >> 2
    r3 = Int64(heapClassInst.heap32[(r3 + 2)])
    heapClassInst.heap32[(g0)] = Int32(r5)
    __FUNCTION_TABLE__[(r3) >> 2](i7);
    r5 = (r0 + 200) | 0
    heapClassInst.heap32[(r7 + 49)] = Int32(commonVariable.r_g0)
    var break_flag = 0
    while (true) {
        if (r8 > 35) {
            __label__ = 52
            break
        } else {
            r3 = 0
            while (true) {
                if (r3 < 36) {
                    r7 = r0 >> 2
                    r7 = Int64(heapClassInst.heap32[(r7 + 1346)])
                    r9 = r7 >> 2
                    r9 = Int64(heapClassInst.heap32[(r9)])
                    r9 = r9 >> 2
                    r9 = Int64(heapClassInst.heap32[(r9 + 5)])
                    r10 = r3 << 2
                    heapClassInst.heap32[(g0)] = Int32(r7)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r8)
                    heapClassInst.heap32[(g0 + 2)] = Int32(r3)
                    r7 = (r5 + r10) | 0
                    r7 = r7 >> 2
                    __FUNCTION_TABLE__[(r9) >> 2](i7);
                    r9 = commonVariable.r_g0
                    heapClassInst.heap32[(r7)] = Int32(r9)
                    if (r9 != 0) {
                        r3 = (r3 + 1) | 0
                    } else {
                        __label__ = 46
                        break_flag = 1
                        break
                    }
                } else {
                    break
                }
            }
            if (break_flag == 1) {
                break
            }
            r8 = (r8 + 1) | 0
            r5 = (r5 + 144) | 0
            continue
        }
    }
    match (__label__) {
        case 52 =>
            heapClassInst.heap32[(r1 + 14)] = Int32(r0)
            heapClassInst.heap32[(g0)] = 76
            _Znwj(i7);
            r0 = commonVariable.r_g0
            heapClassInst.heap32[(g0)] = Int32(r0)
            _ZN28btHashedOverlappingPairCacheC1Ev(i7);
            r3 = Int64(heapClassInst.heap32[(r2)])
            r5 = (r3 + 1) | 0
            heapClassInst.heap32[(r2)] = Int32(r5)
            heapClassInst.heap32[(g0)] = 135
            mallocNew(i7);
            r7 = commonVariable.r_g0
            if (r7 != 0) {
                r8 = 0
                r9 = (r7 + 4) | 0
                r8 = (r8 - r9) | 0
                r8 = r8 & 15
                r8 = (r7 + r8) | 0
                r9 = (r8 + 4) | 0
                r8 = r8 >> 2
                heapClassInst.heap32[(r8)] = Int32(r7)
                r7 = r9
            }
            r8 = _ZTV20btAxisSweep3InternalItE
            r9 = r7 >> 2
            r8 = (r8 + 8) | 0
            r10 = (-2)
            heapClassInst.heap32[(r9)] = Int32(r8)
            r8 = (-1)
            heapClassInst.heap16[(r7 + 4) >> 1] = Int16(r10)
            heapClassInst.heap16[(r7 + 6) >> 1] = Int16(r8)
            heapClassInst.heap32[(r9 + 23)] = Int32(r0)
            r8 = 0
            heapClassInst.heap32[(r9 + 24)] = 0
            heapClassInst.heap8[r7 + 100] = Int8(r8)
            heapClassInst.heap32[(r9 + 26)] = 0
            heapClassInst.heap32[(r9 + 27)] = 0
            if (r0 == 0) {
                r5 = (r3 + 2) | 0
                heapClassInst.heap32[(r2)] = Int32(r5)
                heapClassInst.heap32[(g0)] = 95
                mallocNew(i7);
                r5 = commonVariable.r_g0
                if (r5 != 0) {
                    r0 = 0
                    r3 = (r5 + 4) | 0
                    r0 = (r0 - r3) | 0
                    r0 = r0 & 15
                    r0 = (r5 + r0) | 0
                    r3 = (r0 + 4) | 0
                    r0 = r0 >> 2
                    heapClassInst.heap32[(r0)] = Int32(r5)
                    r5 = r3
                }
                heapClassInst.heap32[(g0)] = Int32(r5)
                _ZN28btHashedOverlappingPairCacheC1Ev(i7);
                heapClassInst.heap32[(r9 + 23)] = Int32(r5)
                heapClassInst.heap8[r7 + 100] = Int8(r4)
                r5 = Int64(heapClassInst.heap32[(r2)])
            }
            r0 = (r5 + 1) | 0
            heapClassInst.heap32[(r2)] = Int32(r0)
            heapClassInst.heap32[(g0)] = 43
            mallocNew(i7);
            r0 = commonVariable.r_g0
            if (r0 != 0) {
                r3 = (r0 + 4) | 0
                r3 = (r8 - r3) | 0
                r3 = r3 & 15
                r3 = (r0 + r3) | 0
                r10 = (r3 + 4) | 0
                r3 = r3 >> 2
                heapClassInst.heap32[(r3)] = Int32(r0)
                r0 = r10
            }
            r3 = _ZTV15btNullPairCache
            r10 = r0 >> 2
            r3 = (r3 + 8) | 0
            heapClassInst.heap32[(r10)] = Int32(r3)
            heapClassInst.heap8[r0 + 20] = Int8(r4)
            heapClassInst.heap32[(r10 + 4)] = 0
            heapClassInst.heap32[(r10 + 2)] = 0
            heapClassInst.heap32[(r10 + 3)] = 0
            r3 = (r5 + 2) | 0
            heapClassInst.heap32[(r9 + 28)] = Int32(r0)
            heapClassInst.heap32[(r2)] = Int32(r3)
            heapClassInst.heap32[(g0)] = 175
            mallocNew(i7);
            r10 = commonVariable.r_g0
            if (r10 != 0) {
                r11 = (r10 + 4) | 0
                r11 = (r8 - r11) | 0
                r11 = r11 & 15
                r11 = (r10 + r11) | 0
                r12 = (r11 + 4) | 0
                r11 = r11 >> 2
                heapClassInst.heap32[(r11)] = Int32(r10)
                r10 = r12
            }
            r11 = _ZTV16btDbvtBroadphase
            r12 = r10 >> 2
            r11 = (r11 + 8) | 0
            heapClassInst.heap32[(r12)] = Int32(r11)
            while (true) {
                r11 = (r10 + r8) | 0
                r13 = r11 >> 2
                heapClassInst.heap8[r11 + 40] = Int8(r4)
                heapClassInst.heap32[(r13 + 9)] = 0
                heapClassInst.heap32[(r13 + 7)] = 0
                heapClassInst.heap32[(r13 + 8)] = 0
                heapClassInst.heap32[(r13 + 1)] = 0
                heapClassInst.heap32[(r13 + 2)] = 0
                heapClassInst.heap32[(r13 + 3)] = (-1)
                r8 = (r8 + 40) | 0
                heapClassInst.heap32[(r13 + 4)] = 0
                heapClassInst.heap32[(r13 + 5)] = 0
                if (r8 != 80) {
                    continue
                } else {
                    break
                }
            }
            r8 = 0
            r11 = if (r0 == r8) {
                1
            } else {
                0
            };
            heapClassInst.heap8[r10 + 153] = Int8(r8)
            r11 = r11 & 1
            heapClassInst.heap8[r10 + 154] = Int8(r4)
            heapClassInst.heap8[r10 + 152] = Int8(r11)
            heapClassInst.heap32[(r12 + 25)] = 0
            heapClassInst.heap32[(r12 + 26)] = 0
            heapClassInst.heap32[(r12 + 31)] = 0
            heapClassInst.heap32[(r12 + 27)] = 1
            heapClassInst.heap32[(r12 + 28)] = 0
            heapClassInst.heap32[(r12 + 29)] = 10
            heapClassInst.heap32[(r12 + 30)] = 1
            heapClassInst.heap32[(r12 + 32)] = 0
            heapClassInst.heap32[(r12 + 33)] = 0
            heapClassInst.heap32[(r12 + 34)] = 0
            if (r0 == 0) {
                r0 = (r5 + 3) | 0
                heapClassInst.heap32[(r2)] = Int32(r0)
                heapClassInst.heap32[(g0)] = 95
                mallocNew(i7);
                r0 = commonVariable.r_g0
                if (r0 != 0) {
                    r3 = 0
                    r5 = (r0 + 4) | 0
                    r3 = (r3 - r5) | 0
                    r3 = r3 & 15
                    r3 = (r0 + r3) | 0
                    r5 = (r3 + 4) | 0
                    r3 = r3 >> 2
                    heapClassInst.heap32[(r3)] = Int32(r0)
                    r0 = r5
                }
                heapClassInst.heap32[(g0)] = Int32(r0)
                _ZN28btHashedOverlappingPairCacheC1Ev(i7);
                r3 = Int64(heapClassInst.heap32[(r2)])
            }
            heapClassInst.heap32[(r12 + 24)] = Int32(r0)
            heapClassInst.heap32[(r12 + 37)] = 0
            heapClassInst.heap32[(r12 + 35)] = 0
            heapClassInst.heap32[(r12 + 36)] = 0
            heapClassInst.heap32[(r12 + 21)] = 0
            heapClassInst.heap32[(r12 + 22)] = 0
            heapClassInst.heap32[(r12 + 23)] = 0
            heapClassInst.heap32[(r9 + 27)] = Int32(r10)
            heapClassInst.heap8[r10 + 153] = Int8(r4)
            heapClassInst.heap32[(r9 + 2)] = (-998637568)
            heapClassInst.heap32[(r9 + 3)] = (-998637568)
            heapClassInst.heap32[(r9 + 4)] = (-998637568)
            heapClassInst.heap32[(r9 + 5)] = 0
            heapClassInst.heap32[(r9 + 6)] = 1148846080
            heapClassInst.heap32[(r9 + 7)] = 1148846080
            heapClassInst.heap32[(r9 + 8)] = 1148846080
            heapClassInst.heap32[(r9 + 9)] = 0
            r0 = Int64(heapClassInst.heapU16[(r7 + 6) >> 1])
            f0 = Float64(`UIntNative`(r0))
            f1 = 2000.0
            f0 = f0 / f1
            heapClassInst.heapFloat[(r9 + 10)] = Float32(f0)
            heapClassInst.heapFloat[(r9 + 11)] = Float32(f0)
            heapClassInst.heapFloat[(r9 + 12)] = Float32(f0)
            r0 = (r3 + 1) | 0
            heapClassInst.heap32[(r9 + 13)] = 0
            heapClassInst.heap32[(r2)] = Int32(r0)
            heapClassInst.heap32[(g0)] = 224083
            mallocNew(i7);
            r0 = commonVariable.r_g0
            if (r0 != 0) {
                r5 = (r0 + 4) | 0
                r5 = (r8 - r5) | 0
                r5 = r5 & 15
                r5 = (r0 + r5) | 0
                r10 = (r5 + 4) | 0
                r5 = r5 >> 2
                heapClassInst.heap32[(r5)] = Int32(r0)
                r0 = r10
            }
            while (true) {
                r5 = r8 << 6
                r5 = (r0 - r5) | 0
                r5 = r5 >> 2
                r8 = (r8 + (-1)) | 0
                heapClassInst.heap32[(r5)] = 0
                heapClassInst.heap32[(r5 + 2)] = 0
                if (r8 != (-3501)) {
                    continue
                } else {
                    break
                }
            }
            r5 = 3501
            heapClassInst.heap32[(r9 + 15)] = Int32(r0)
            r8 = 0
            heapClassInst.heap16[(r7 + 58) >> 1] = Int16(r5)
            r5 = (-112)
            r10 = 2
            heapClassInst.heap16[(r7 + 56) >> 1] = Int16(r8)
            heapClassInst.heap16[(r7 + 64) >> 1] = Int16(r4)
            while (true) {
                r0 = (r0 - r5) | 0
                heapClassInst.heap16[(r0) >> 1] = Int16(r10)
                r5 = (r5 + (-64)) | 0
                r0 = Int64(heapClassInst.heap32[(r9 + 15)])
                r10 = (r10 + 1) | 0
                if (r5 != (-224112)) {
                    continue
                } else {
                    break
                }
            }
            r3 = (r3 + 2) | 0
            heapClassInst.heap16[(r0 + 224048) >> 1] = Int16(r8)
            while (true) {
                r0 = (r3 + r8) | 0
                heapClassInst.heap32[(r2)] = Int32(r0)
                heapClassInst.heap32[(g0)] = 28027
                mallocNew(i7);
                r0 = commonVariable.r_g0
                if (r0 != 0) {
                    r5 = 0
                    r10 = (r0 + 4) | 0
                    r5 = (r5 - r10) | 0
                    r5 = r5 & 15
                    r5 = (r0 + r5) | 0
                    r10 = (r5 + 4) | 0
                    r5 = r5 >> 2
                    heapClassInst.heap32[(r5)] = Int32(r0)
                    r0 = r10
                }
                r5 = r8 << 2
                r5 = (r7 + r5) | 0
                r5 = r5 >> 2
                r8 = (r8 + 1) | 0
                heapClassInst.heap32[(r5 + 20)] = Int32(r0)
                heapClassInst.heap32[(r5 + 17)] = Int32(r0)
                if (r8 != 3) {
                    continue
                } else {
                    break
                }
            }
            r0 = Int64(heapClassInst.heap32[(r9 + 15)])
            r0 = r0 >> 2
            heapClassInst.heap32[(r0)] = 0
            r0 = Int64(heapClassInst.heap32[(r9 + 15)])
            r3 = 0
            heapClassInst.heap16[(r0 + 48) >> 1] = Int16(r3)
            r0 = Int64(heapClassInst.heap32[(r9 + 15)])
            heapClassInst.heap16[(r0 + 54) >> 1] = Int16(r4)
            r0 = Int64(heapClassInst.heap32[(r9 + 17)])
            heapClassInst.heap16[(r0) >> 1] = Int16(r3)
            r0 = Int64(heapClassInst.heap32[(r9 + 17)])
            heapClassInst.heap16[(r0 + 2) >> 1] = Int16(r3)
            r0 = Int64(heapClassInst.heap32[(r9 + 17)])
            r5 = Int64(heapClassInst.heapU16[(r7 + 6) >> 1])
            heapClassInst.heap16[(r0 + 4) >> 1] = Int16(r5)
            r0 = Int64(heapClassInst.heap32[(r9 + 17)])
            heapClassInst.heap16[(r0 + 6) >> 1] = Int16(r3)
            r0 = Int64(heapClassInst.heap32[(r9 + 15)])
            heapClassInst.heap16[(r0 + 50) >> 1] = Int16(r3)
            r0 = Int64(heapClassInst.heap32[(r9 + 15)])
            heapClassInst.heap16[(r0 + 56) >> 1] = Int16(r4)
            r0 = Int64(heapClassInst.heap32[(r9 + 18)])
            heapClassInst.heap16[(r0) >> 1] = Int16(r3)
            r0 = Int64(heapClassInst.heap32[(r9 + 18)])
            heapClassInst.heap16[(r0 + 2) >> 1] = Int16(r3)
            r0 = Int64(heapClassInst.heap32[(r9 + 18)])
            r5 = Int64(heapClassInst.heapU16[(r7 + 6) >> 1])
            heapClassInst.heap16[(r0 + 4) >> 1] = Int16(r5)
            r0 = Int64(heapClassInst.heap32[(r9 + 18)])
            heapClassInst.heap16[(r0 + 6) >> 1] = Int16(r3)
            r0 = Int64(heapClassInst.heap32[(r9 + 15)])
            heapClassInst.heap16[(r0 + 52) >> 1] = Int16(r3)
            r0 = Int64(heapClassInst.heap32[(r9 + 15)])
            heapClassInst.heap16[(r0 + 58) >> 1] = Int16(r4)
            r0 = Int64(heapClassInst.heap32[(r9 + 19)])
            heapClassInst.heap16[(r0) >> 1] = Int16(r3)
            r0 = Int64(heapClassInst.heap32[(r9 + 19)])
            heapClassInst.heap16[(r0 + 2) >> 1] = Int16(r3)
            r0 = Int64(heapClassInst.heap32[(r9 + 19)])
            r5 = Int64(heapClassInst.heapU16[(r7 + 6) >> 1])
            heapClassInst.heap16[(r0 + 4) >> 1] = Int16(r5)
            r0 = Int64(heapClassInst.heap32[(r9 + 19)])
            r5 = _ZTV12btAxisSweep3
            r5 = (r5 + 8) | 0
            heapClassInst.heap16[(r0 + 6) >> 1] = Int16(r3)
            heapClassInst.heap32[(r9)] = Int32(r5)
            heapClassInst.heap32[(r1 + 13)] = Int32(r7)
            heapClassInst.heap32[(g0)] = 128
            r0 = _ZTV35btSequentialImpulseConstraintSolver
            _Znwj(i7);
            r7 = commonVariable.r_g0 >> 2
            r0 = (r0 + 8) | 0
            heapClassInst.heap32[(r7)] = Int32(r0)
            heapClassInst.heap8[commonVariable.r_g0 + 20] = Int8(r4)
            heapClassInst.heap32[(r7 + 4)] = 0
            heapClassInst.heap32[(r7 + 2)] = 0
            heapClassInst.heap32[(r7 + 3)] = 0
            heapClassInst.heap8[commonVariable.r_g0 + 40] = Int8(r4)
            heapClassInst.heap32[(r7 + 9)] = 0
            heapClassInst.heap32[(r7 + 7)] = 0
            heapClassInst.heap32[(r7 + 8)] = 0
            heapClassInst.heap8[commonVariable.r_g0 + 60] = Int8(r4)
            heapClassInst.heap32[(r7 + 14)] = 0
            heapClassInst.heap32[(r7 + 12)] = 0
            heapClassInst.heap32[(r7 + 13)] = 0
            heapClassInst.heap8[commonVariable.r_g0 + 80] = Int8(r4)
            heapClassInst.heap32[(r7 + 19)] = 0
            heapClassInst.heap32[(r7 + 17)] = 0
            heapClassInst.heap32[(r7 + 18)] = 0
            heapClassInst.heap8[commonVariable.r_g0 + 100] = Int8(r4)
            heapClassInst.heap32[(r7 + 24)] = 0
            heapClassInst.heap32[(r7 + 22)] = 0
            heapClassInst.heap32[(r7 + 23)] = 0
            heapClassInst.heap8[commonVariable.r_g0 + 120] = Int8(r4)
            heapClassInst.heap32[(r7 + 29)] = 0
            heapClassInst.heap32[(r7 + 27)] = 0
            heapClassInst.heap32[(r7 + 28)] = 0
            heapClassInst.heap32[(r7 + 31)] = 0
            heapClassInst.heap32[(r1 + 15)] = Int32(commonVariable.r_g0)
            heapClassInst.heap32[(g0)] = 272
            _Znwj(i7);
            r5 = commonVariable.r_g0
            r7 = Int64(heapClassInst.heap32[(r1 + 16)])
            r8 = _ZTV16btCollisionWorld
            r9 = Int64(heapClassInst.heap32[(r1 + 15)])
            r10 = Int64(heapClassInst.heap32[(r1 + 13)])
            r11 = Int64(heapClassInst.heap32[(r1 + 14)])
            r8 = (r8 + 8) | 0
            r12 = r5 >> 2
            heapClassInst.heap32[(r12)] = Int32(r8)
            heapClassInst.heap8[r5 + 20] = Int8(r4)
            heapClassInst.heap32[(r12 + 4)] = 0
            heapClassInst.heap32[(r12 + 2)] = 0
            heapClassInst.heap32[(r12 + 3)] = 0
            heapClassInst.heap32[(r12 + 6)] = Int32(r11)
            heapClassInst.heap32[(r12 + 7)] = 0
            heapClassInst.heap32[(r12 + 8)] = 0
            heapClassInst.heap32[(r12 + 9)] = 1
            heapClassInst.heap32[(r12 + 10)] = 1065353216
            heapClassInst.heap8[r5 + 44] = Int8(r3)
            heapClassInst.heap32[(r12 + 12)] = 0
            heapClassInst.heap8[r5 + 52] = Int8(r3)
            heapClassInst.heap8[r5 + 53] = Int8(r4)
            heapClassInst.heap8[r5 + 54] = Int8(r4)
            heapClassInst.heap32[(r12 + 14)] = 1025758986
            heapClassInst.heap8[r5 + 60] = Int8(r3)
            heapClassInst.heap32[(r12 + 16)] = 0
            heapClassInst.heap8[r5 + 68] = Int8(r3)
            heapClassInst.heap32[(r12 + 18)] = 0
            heapClassInst.heap32[(r12 + 20)] = Int32(r10)
            heapClassInst.heap32[(r12 + 21)] = 0
            r8 = r7 >> 2
            heapClassInst.heap8[r5 + 88] = Int8(r4)
            r8 = Int64(heapClassInst.heap32[(r8)])
            r8 = r8 >> 2
            r8 = Int64(heapClassInst.heap32[(r8 + 4)])
            heapClassInst.heap32[(g0)] = Int32(r7)
            __FUNCTION_TABLE__[(r8) >> 2](i7);
            heapClassInst.heap32[(r12 + 19)] = Int32(commonVariable.r_g0)
            heapClassInst.heap32[(r12 + 18)] = Int32(commonVariable.r_g0)
            heapClassInst.heap32[(r12 + 23)] = 0
            heapClassInst.heap32[(r12 + 24)] = 0
            heapClassInst.heap32[(r12 + 25)] = 0
            heapClassInst.heap32[(r12 + 26)] = 1058642330
            heapClassInst.heap32[(r12 + 27)] = 1065353216
            heapClassInst.heap32[(r12 + 28)] = 1050253722
            heapClassInst.heap32[(r12 + 30)] = 0
            heapClassInst.heap32[(r12 + 32)] = 1101004800
            heapClassInst.heap32[(r12 + 31)] = 10
            heapClassInst.heap32[(r12 + 34)] = 1045220557
            heapClassInst.heap32[(r12 + 35)] = 1036831949
            heapClassInst.heap32[(r12 + 36)] = 0
            heapClassInst.heap32[(r12 + 33)] = 1065353216
            heapClassInst.heap32[(r12 + 37)] = 0
            heapClassInst.heap32[(r12 + 38)] = (-1130113270)
            heapClassInst.heap32[(r12 + 39)] = 0
            heapClassInst.heap32[(r12 + 40)] = 1062836634
            heapClassInst.heap32[(r12 + 41)] = 260
            r7 = _ZTV23btDiscreteDynamicsWorld
            heapClassInst.heap32[(r12 + 42)] = 2
            r7 = (r7 + 8) | 0
            heapClassInst.heap32[(r12 + 43)] = 128
            heapClassInst.heap32[(r12)] = Int32(r7)
            heapClassInst.heap32[(r12 + 44)] = Int32(r9)
            heapClassInst.heap8[r5 + 200] = Int8(r4)
            heapClassInst.heap32[(r12 + 49)] = 0
            heapClassInst.heap32[(r12 + 47)] = 0
            heapClassInst.heap32[(r12 + 48)] = 0
            heapClassInst.heap8[r5 + 220] = Int8(r4)
            heapClassInst.heap32[(r12 + 54)] = 0
            heapClassInst.heap32[(r12 + 52)] = 0
            heapClassInst.heap32[(r12 + 53)] = 0
            heapClassInst.heap32[(r12 + 56)] = 0
            heapClassInst.heap32[(r12 + 57)] = (-1054867456)
            heapClassInst.heap32[(r12 + 58)] = 0
            heapClassInst.heap32[(r12 + 59)] = 0
            heapClassInst.heap32[(r12 + 60)] = 0
            heapClassInst.heap8[r5 + 246] = Int8(r3)
            heapClassInst.heap8[r5 + 264] = Int8(r4)
            heapClassInst.heap32[(r12 + 65)] = 0
            heapClassInst.heap32[(r12 + 63)] = 0
            heapClassInst.heap32[(r12 + 64)] = 0
            heapClassInst.heap32[(r12 + 67)] = 0
            if (r9 != 0) {
                heapClassInst.heap8[r5 + 245] = Int8(r3)
                r7 = Int64(heapClassInst.heap32[(r2)])
            } else {
                r7 = Int64(heapClassInst.heap32[(r2)])
                r7 = (r7 + 1) | 0
                heapClassInst.heap32[(r2)] = Int32(r7)
                heapClassInst.heap32[(g0)] = 147
                mallocNew(i7);
                r8 = commonVariable.r_g0
                if (r8 != 0) {
                    r9 = 0
                    r10 = (r8 + 4) | 0
                    r9 = (r9 - r10) | 0
                    r9 = r9 & 15
                    r9 = (r8 + r9) | 0
                    r10 = (r9 + 4) | 0
                    r9 = r9 >> 2
                    heapClassInst.heap32[(r9)] = Int32(r8)
                    r8 = r10
                }
                r9 = r8 >> 2
                heapClassInst.heap32[(r9)] = Int32(r0)
                heapClassInst.heap8[r8 + 20] = Int8(r4)
                heapClassInst.heap32[(r9 + 4)] = 0
                heapClassInst.heap32[(r9 + 2)] = 0
                heapClassInst.heap32[(r9 + 3)] = 0
                heapClassInst.heap8[r8 + 40] = Int8(r4)
                heapClassInst.heap32[(r9 + 9)] = 0
                heapClassInst.heap32[(r9 + 7)] = 0
                heapClassInst.heap32[(r9 + 8)] = 0
                heapClassInst.heap8[r8 + 60] = Int8(r4)
                heapClassInst.heap32[(r9 + 14)] = 0
                heapClassInst.heap32[(r9 + 12)] = 0
                heapClassInst.heap32[(r9 + 13)] = 0
                heapClassInst.heap8[r8 + 80] = Int8(r4)
                heapClassInst.heap32[(r9 + 19)] = 0
                heapClassInst.heap32[(r9 + 17)] = 0
                heapClassInst.heap32[(r9 + 18)] = 0
                heapClassInst.heap8[r8 + 100] = Int8(r4)
                heapClassInst.heap32[(r9 + 24)] = 0
                heapClassInst.heap32[(r9 + 22)] = 0
                heapClassInst.heap32[(r9 + 23)] = 0
                heapClassInst.heap8[r8 + 120] = Int8(r4)
                heapClassInst.heap32[(r9 + 29)] = 0
                heapClassInst.heap32[(r9 + 27)] = 0
                heapClassInst.heap32[(r9 + 28)] = 0
                r0 = r5 >> 2
                heapClassInst.heap32[(r9 + 31)] = 0
                heapClassInst.heap32[(r0 + 44)] = Int32(r8)
                heapClassInst.heap8[r5 + 245] = Int8(r4)
            }
            r0 = (r7 + 1) | 0
            heapClassInst.heap32[(r2)] = Int32(r0)
            heapClassInst.heap32[(g0)] = 87
            mallocNew(i7);
            r0 = commonVariable.r_g0
            if (r0 != 0) {
                r7 = (r0 + 4) | 0
                r7 = (r3 - r7) | 0
                r7 = r7 & 15
                r7 = (r0 + r7) | 0
                r8 = (r7 + 4) | 0
                r7 = r7 >> 2
                heapClassInst.heap32[(r7)] = Int32(r0)
                r0 = r8
            }
            r7 = _ZTV25btSimulationIslandManager
            r8 = r0 >> 2
            r7 = (r7 + 8) | 0
            heapClassInst.heap32[(r8)] = Int32(r7)
            heapClassInst.heap8[r0 + 20] = Int8(r4)
            heapClassInst.heap32[(r8 + 4)] = 0
            heapClassInst.heap32[(r8 + 2)] = 0
            heapClassInst.heap32[(r8 + 3)] = 0
            heapClassInst.heap8[r0 + 40] = Int8(r4)
            heapClassInst.heap32[(r8 + 9)] = 0
            heapClassInst.heap32[(r8 + 7)] = 0
            heapClassInst.heap32[(r8 + 8)] = 0
            heapClassInst.heap8[r0 + 60] = Int8(r4)
            heapClassInst.heap32[(r8 + 14)] = 0
            heapClassInst.heap32[(r8 + 12)] = 0
            heapClassInst.heap32[(r8 + 13)] = 0
            r7 = r5 >> 2
            heapClassInst.heap8[r0 + 64] = Int8(r4)
            heapClassInst.heap32[(r7 + 45)] = Int32(r0)
            heapClassInst.heap8[r5 + 244] = Int8(r4)
            heapClassInst.heap32[(r1 + 1)] = Int32(r5)
            r0 = Int64(heapClassInst.heap32[(r7 + 41)])
            r0 = r0 | 32
            heapClassInst.heap32[(r7 + 41)] = Int32(r0)
            heapClassInst.heap32[(r7 + 31)] = 5
            heapClassInst.heap32[(r1 + 2)] = 0
            r0 = Int64(heapClassInst.heap32[(r1 + 1)])
            r5 = r0 >> 2
            r5 = Int64(heapClassInst.heap32[(r5)])
            r5 = r5 >> 2
            r5 = Int64(heapClassInst.heap32[(r5 + 17)])
            r7 = sp + (-41280)
            r8 = r7 >> 2
            heapClassInst.heap32[(fp + (-10320))] = 0
            heapClassInst.heap32[(r8 + 1)] = (-1054867456)
            heapClassInst.heap32[(r8 + 2)] = 0
            heapClassInst.heap32[(r8 + 3)] = 0
            heapClassInst.heap32[(g0)] = Int32(r0)
            heapClassInst.heap32[(g0 + 1)] = Int32(r7)
            __FUNCTION_TABLE__[(r5) >> 2](i7);
            r0 = Int64(heapClassInst.heap32[(r1 + 17)])
            if (r0 < 5) {
                r0 = Int64(heapClassInst.heap32[(r2)])
                r5 = (r0 + 1) | 0
                heapClassInst.heap32[(r2)] = Int32(r5)
                heapClassInst.heap32[(g0)] = 71
                mallocNew(i7);
                r5 = commonVariable.r_g0
                if (r5 != 0) {
                    r7 = 0
                    r8 = (r5 + 4) | 0
                    r7 = (r7 - r8) | 0
                    r7 = r7 & 15
                    r7 = (r5 + r7) | 0
                    r8 = (r7 + 4) | 0
                    r7 = r7 >> 2
                    heapClassInst.heap32[(r7)] = Int32(r5)
                    r5 = r8
                }
                r7 = r5 >> 2
                heapClassInst.heap32[(r7 + 2)] = 0
                heapClassInst.heap32[(r7 + 3)] = 1065353216
                heapClassInst.heap32[(r7 + 4)] = 1065353216
                heapClassInst.heap32[(r7 + 5)] = 1065353216
                r8 = _ZTV10btBoxShape
                heapClassInst.heap32[(r7 + 6)] = 0
                r8 = (r8 + 8) | 0
                heapClassInst.heap32[(r7 + 11)] = 1025758986
                heapClassInst.heap32[(r7)] = Int32(r8)
                heapClassInst.heap32[(r7 + 1)] = 0
                heapClassInst.heap32[(r7 + 7)] = 1132066243
                heapClassInst.heap32[(r7 + 8)] = 1112004362
                heapClassInst.heap32[(r7 + 9)] = 1132066243
                heapClassInst.heap32[(r7 + 10)] = 0
                r7 = Int64(heapClassInst.heap32[(r1 + 5)])
                r8 = Int64(heapClassInst.heap32[(r1 + 4)])
                if (r7 == r8) {
                    r9 = r8 << 1
                    r9 = if (r8 == 0) {
                        r4
                    } else {
                        r9
                    };
                    if (!(r7 >= r9)) {
                        if (r9 != 0) {
                            r7 = r9 << 2
                            r0 = (r0 + 2) | 0
                            r7 = r7 | 3
                            heapClassInst.heap32[(r2)] = Int32(r0)
                            r0 = (r7 + 16) | 0
                            heapClassInst.heap32[(g0)] = Int32(r0)
                            mallocNew(i7);
                            r0 = commonVariable.r_g0
                            if (r0 != 0) {
                                r7 = 0
                                r10 = (r0 + 4) | 0
                                r7 = (r7 - r10) | 0
                                r7 = r7 & 15
                                r7 = (r0 + r7) | 0
                                r10 = (r7 + 4) | 0
                                r7 = r7 >> 2
                                heapClassInst.heap32[(r7)] = Int32(r0)
                                r0 = r10
                            }
                        } else {
                            r0 = 0
                        }
                        do {
                            if (r8 < 1) {
                                r10 = Int64(heapClassInst.heap32[(r1 + 6)])
                            } else {
                                r7 = 0
                                while (true) {
                                    r10 = Int64(heapClassInst.heap32[(r1 + 6)])
                                    r11 = r7 << 2
                                    r12 = (r10 + r11) | 0
                                    r12 = r12 >> 2
                                    r11 = (r0 + r11) | 0
                                    r12 = Int64(heapClassInst.heap32[(r12)])
                                    r7 = (r7 + 1) | 0
                                    r11 = r11 >> 2
                                    heapClassInst.heap32[(r11)] = Int32(r12)
                                    if (!(r8 != r7)) {
                                        break
                                    }
                                }
                            }
                        } while (false);
                        if (r10 != 0) {
                            r7 = Int64(heapClassInst.heapU8[r6 + 28])
                            if (r7 != 0) {
                                r8 = gNumAlignedFree
                                r8 = r8 >> 2
                                r7 = Int64(heapClassInst.heap32[(r8)])
                                r7 = (r7 + 1) | 0
                                r10 = r10 >> 2
                                heapClassInst.heap32[(r8)] = Int32(r7)
                                r8 = Int64(heapClassInst.heap32[(r10 + (-1))])
                                heapClassInst.heap32[(g0)] = Int32(r8)
                                free(i7);
                                r8 = Int64(heapClassInst.heap32[(r1 + 4)])
                            }
                            heapClassInst.heap32[(r1 + 6)] = 0
                        }
                        heapClassInst.heap8[r6 + 28] = Int8(r4)
                        heapClassInst.heap32[(r1 + 6)] = Int32(r0)
                        heapClassInst.heap32[(r1 + 5)] = Int32(r9)
                    }
                }
                r0 = r8 << 2
                r7 = Int64(heapClassInst.heap32[(r1 + 6)])
                r0 = (r7 + r0) | 0
                r0 = r0 >> 2
                heapClassInst.heap32[(r0)] = Int32(r5)
                r0 = Int64(heapClassInst.heap32[(r1 + 4)])
                r0 = (r0 + 1) | 0
                r7 = _ZGVZN11btTransform11getIdentityEvE17identityTransform
                heapClassInst.heap32[(r1 + 4)] = Int32(r0)
                r0 = Int64(heapClassInst.heapU8[r7])
                if (!(r0 != 0)) {
                    r0 = _ZGVZN11btMatrix3x311getIdentityEvE14identityMatrix
                    r8 = Int64(heapClassInst.heapU8[r0])
                    if (!(r8 != 0)) {
                        r8 = _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_0_2E_0_2E_0
                        r9 = _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_1_2E_0_2E_1
                        r8 = r8 >> 2
                        r10 = _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_2_2E_0_2E_2
                        r9 = r9 >> 2
                        heapClassInst.heap32[(r8)] = 1065353216
                        r8 = r10 >> 2
                        heapClassInst.heap32[(r9)] = 1065353216
                        heapClassInst.heap32[(r8)] = 1065353216
                        heapClassInst.heap8[r0] = Int8(r4)
                    }
                    r0 = _ZZN11btTransform11getIdentityEvE17identityTransform
                    r8 = _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_0_2E_0_2E_0
                    r0 = r0 >> 2
                    r8 = r8 >> 2
                    heapClassInst.heap32[(r0)] = heapClassInst.heap32[(r8)]
                    heapClassInst.heap32[(r0 + 1)] = 0
                    heapClassInst.heap32[(r0 + 2)] = 0
                    r8 = _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_1_2E_0_2E_1
                    heapClassInst.heap32[(r0 + 3)] = 0
                    r8 = r8 >> 2
                    heapClassInst.heap32[(r0 + 4)] = 0
                    heapClassInst.heap32[(r0 + 5)] = heapClassInst.heap32[(r8)]
                    heapClassInst.heap32[(r0 + 6)] = 0
                    heapClassInst.heap32[(r0 + 7)] = 0
                    r8 = _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_2_2E_0_2E_2
                    heapClassInst.heap32[(r0 + 8)] = 0
                    r8 = r8 >> 2
                    heapClassInst.heap32[(r0 + 9)] = 0
                    heapClassInst.heap32[(r0 + 10)] = heapClassInst.heap32[(r8)]
                    heapClassInst.heap32[(r0 + 11)] = 0
                    heapClassInst.heap32[(r0 + 12)] = 0
                    heapClassInst.heap32[(r0 + 13)] = 0
                    heapClassInst.heap32[(r0 + 14)] = 0
                    heapClassInst.heap32[(r0 + 15)] = 0
                    heapClassInst.heap8[r7] = Int8(r4)
                }
                heapClassInst.heap32[(g0)] = 200
                r0 = _ZTV20btDefaultMotionState
                _Znwj(i7);
                r8 = commonVariable.r_g0 >> 2
                r0 = (r0 + 8) | 0
                heapClassInst.heap32[(r8)] = Int32(r0)
                heapClassInst.heap32[(r8 + 1)] = 1065353216
                heapClassInst.heap32[(r8 + 2)] = 0
                heapClassInst.heap32[(r8 + 3)] = 0
                heapClassInst.heap32[(r8 + 4)] = 0
                heapClassInst.heap32[(r8 + 5)] = 0
                heapClassInst.heap32[(r8 + 6)] = 1065353216
                heapClassInst.heap32[(r8 + 7)] = 0
                heapClassInst.heap32[(r8 + 8)] = 0
                heapClassInst.heap32[(r8 + 9)] = 0
                heapClassInst.heap32[(r8 + 10)] = 0
                heapClassInst.heap32[(r8 + 11)] = 1065353216
                heapClassInst.heap32[(r8 + 12)] = 0
                heapClassInst.heap32[(r8 + 13)] = 0
                heapClassInst.heap32[(r8 + 14)] = (-1035468800)
                r0 = _ZZN11btTransform11getIdentityEvE17identityTransform
                heapClassInst.heap32[(r8 + 15)] = 0
                r0 = r0 >> 2
                heapClassInst.heap32[(r8 + 16)] = 0
                heapClassInst.heap32[(r8 + 17)] = heapClassInst.heap32[(r0)]
                heapClassInst.heap32[(r8 + 18)] = heapClassInst.heap32[(r0 + 1)]
                heapClassInst.heap32[(r8 + 19)] = heapClassInst.heap32[(r0 + 2)]
                heapClassInst.heap32[(r8 + 20)] = heapClassInst.heap32[(r0 + 3)]
                heapClassInst.heap32[(r8 + 21)] = heapClassInst.heap32[(r0 + 4)]
                heapClassInst.heap32[(r8 + 22)] = heapClassInst.heap32[(r0 + 5)]
                heapClassInst.heap32[(r8 + 23)] = heapClassInst.heap32[(r0 + 6)]
                heapClassInst.heap32[(r8 + 24)] = heapClassInst.heap32[(r0 + 7)]
                heapClassInst.heap32[(r8 + 25)] = heapClassInst.heap32[(r0 + 8)]
                heapClassInst.heap32[(r8 + 26)] = heapClassInst.heap32[(r0 + 9)]
                heapClassInst.heap32[(r8 + 27)] = heapClassInst.heap32[(r0 + 10)]
                heapClassInst.heap32[(r8 + 28)] = heapClassInst.heap32[(r0 + 11)]
                heapClassInst.heap32[(r8 + 29)] = heapClassInst.heap32[(r0 + 12)]
                heapClassInst.heap32[(r8 + 30)] = heapClassInst.heap32[(r0 + 13)]
                heapClassInst.heap32[(r8 + 31)] = heapClassInst.heap32[(r0 + 14)]
                heapClassInst.heap32[(r8 + 32)] = heapClassInst.heap32[(r0 + 15)]
                heapClassInst.heap32[(r8 + 33)] = 1065353216
                heapClassInst.heap32[(r8 + 34)] = 0
                heapClassInst.heap32[(r8 + 35)] = 0
                heapClassInst.heap32[(r8 + 36)] = 0
                heapClassInst.heap32[(r8 + 37)] = 0
                heapClassInst.heap32[(r8 + 38)] = 1065353216
                heapClassInst.heap32[(r8 + 39)] = 0
                heapClassInst.heap32[(r8 + 40)] = 0
                heapClassInst.heap32[(r8 + 41)] = 0
                heapClassInst.heap32[(r8 + 42)] = 0
                heapClassInst.heap32[(r8 + 43)] = 1065353216
                heapClassInst.heap32[(r8 + 44)] = 0
                heapClassInst.heap32[(r8 + 45)] = 0
                heapClassInst.heap32[(r8 + 46)] = (-1035468800)
                heapClassInst.heap32[(r8 + 47)] = 0
                heapClassInst.heap32[(r8 + 48)] = 0
                r0 = sp + (-41416)
                heapClassInst.heap32[(r8 + 49)] = 0
                r8 = r0 >> 2
                heapClassInst.heap32[(fp + (-10354))] = 0
                heapClassInst.heap32[(r8 + 1)] = Int32(commonVariable.r_g0)
                heapClassInst.heap32[(r8 + 18)] = Int32(r5)
                heapClassInst.heap32[(r8 + 19)] = 0
                heapClassInst.heap32[(r8 + 20)] = 0
                heapClassInst.heap32[(r8 + 21)] = 0
                heapClassInst.heap32[(r8 + 22)] = 0
                heapClassInst.heap32[(r8 + 23)] = 0
                heapClassInst.heap32[(r8 + 24)] = 0
                heapClassInst.heap32[(r8 + 25)] = 1056964608
                heapClassInst.heap32[(r8 + 26)] = 0
                heapClassInst.heap32[(r8 + 27)] = 1061997773
                r5 = 0
                heapClassInst.heap32[(r8 + 28)] = 1065353216
                heapClassInst.heap8[sp + (-41300)] = Int8(r5)
                heapClassInst.heap32[(r8 + 30)] = 1000593162
                heapClassInst.heap32[(r8 + 31)] = 1008981770
                heapClassInst.heap32[(r8 + 32)] = 1008981770
                heapClassInst.heap32[(r8 + 33)] = 1008981770
                heapClassInst.heap32[(r8 + 2)] = 1065353216
                heapClassInst.heap32[(r8 + 3)] = 0
                heapClassInst.heap32[(r8 + 4)] = 0
                heapClassInst.heap32[(r8 + 5)] = 0
                heapClassInst.heap32[(r8 + 6)] = 0
                heapClassInst.heap32[(r8 + 7)] = 1065353216
                heapClassInst.heap32[(r8 + 8)] = 0
                heapClassInst.heap32[(r8 + 9)] = 0
                heapClassInst.heap32[(r8 + 10)] = 0
                heapClassInst.heap32[(r8 + 11)] = 0
                heapClassInst.heap32[(r8 + 12)] = 1065353216
                heapClassInst.heap32[(r8 + 13)] = 0
                heapClassInst.heap32[(r8 + 14)] = 0
                heapClassInst.heap32[(r8 + 15)] = 0
                heapClassInst.heap32[(r8 + 16)] = 0
                heapClassInst.heap32[(r8 + 17)] = 0
                r7 = Int64(heapClassInst.heap32[(r2)])
                r7 = (r7 + 1) | 0
                heapClassInst.heap32[(r2)] = Int32(r7)
                heapClassInst.heap32[(g0)] = 627
                mallocNew(i7);
                r7 = commonVariable.r_g0
                if (r7 != 0) {
                    r8 = (r7 + 4) | 0
                    r5 = (r5 - r8) | 0
                    r5 = r5 & 15
                    r5 = (r7 + r5) | 0
                    r8 = (r5 + 4) | 0
                    r5 = r5 >> 2
                    heapClassInst.heap32[(r5)] = Int32(r7)
                    r7 = r8
                }
                r5 = r7 >> 2
                heapClassInst.heap32[(r5 + 41)] = 1065353216
                heapClassInst.heap32[(r5 + 42)] = 1065353216
                heapClassInst.heap32[(r5 + 43)] = 1065353216
                heapClassInst.heap32[(r5 + 44)] = 0
                heapClassInst.heap32[(r5 + 45)] = 0
                heapClassInst.heap32[(r5 + 46)] = 1566444395
                heapClassInst.heap32[(r5 + 47)] = 0
                heapClassInst.heap32[(r5 + 48)] = 0
                heapClassInst.heap32[(r5 + 49)] = 0
                heapClassInst.heap32[(r5 + 50)] = 0
                heapClassInst.heap32[(r5 + 51)] = 1
                heapClassInst.heap32[(r5 + 52)] = (-1)
                heapClassInst.heap32[(r5 + 53)] = (-1)
                heapClassInst.heap32[(r5 + 54)] = 1
                heapClassInst.heap32[(r5 + 55)] = 0
                heapClassInst.heap32[(r5 + 56)] = 1056964608
                heapClassInst.heap32[(r5 + 57)] = 0
                heapClassInst.heap32[(r5 + 58)] = 1
                heapClassInst.heap32[(r5 + 59)] = 0
                heapClassInst.heap32[(r5 + 60)] = 1065353216
                heapClassInst.heap32[(r5 + 61)] = 0
                heapClassInst.heap32[(r5 + 62)] = 0
                heapClassInst.heap32[(r5 + 63)] = 0
                heapClassInst.heap32[(r5 + 1)] = 1065353216
                heapClassInst.heap32[(r5 + 2)] = 0
                heapClassInst.heap32[(r5 + 3)] = 0
                heapClassInst.heap32[(r5 + 4)] = 0
                heapClassInst.heap32[(r5 + 5)] = 0
                heapClassInst.heap32[(r5 + 6)] = 1065353216
                heapClassInst.heap32[(r5 + 7)] = 0
                heapClassInst.heap32[(r5 + 8)] = 0
                heapClassInst.heap32[(r5 + 9)] = 0
                heapClassInst.heap32[(r5 + 10)] = 0
                heapClassInst.heap32[(r5 + 11)] = 1065353216
                heapClassInst.heap32[(r5 + 12)] = 0
                heapClassInst.heap32[(r5 + 13)] = 0
                heapClassInst.heap32[(r5 + 14)] = 0
                r8 = _ZTV11btRigidBody
                heapClassInst.heap32[(r5 + 15)] = 0
                r8 = (r8 + 8) | 0
                heapClassInst.heap32[(r5 + 16)] = 0
                heapClassInst.heap32[(r5)] = Int32(r8)
                heapClassInst.heap8[r7 + 492] = Int8(r4)
                heapClassInst.heap32[(r5 + 122)] = 0
                heapClassInst.heap32[(r5 + 120)] = 0
                heapClassInst.heap32[(r5 + 121)] = 0
                heapClassInst.heap32[(g0)] = Int32(r7)
                heapClassInst.heap32[(g0 + 1)] = Int32(r0)
                _ZN11btRigidBody14setupRigidBodyERKNS_27btRigidBodyConstructionInfoE(i7);
                r0 = Int64(heapClassInst.heap32[(r1 + 1)])
                r5 = r0 >> 2
                r5 = Int64(heapClassInst.heap32[(r5)])
                r5 = r5 >> 2
                r5 = Int64(heapClassInst.heap32[(r5 + 20)])
                heapClassInst.heap32[(g0)] = Int32(r0)
                heapClassInst.heap32[(g0 + 1)] = Int32(r7)
                __FUNCTION_TABLE__[(r5) >> 2](i7);
                r0 = Int64(heapClassInst.heap32[(r1 + 17)])
            }
            do {
                if (r0 > 3) {
                    if (r0 > 5) {
                        if (r0 == 6) {
                            _ZN13BenchmarkDemo11createTest6Ev(i7);
                            return;
                        } else {
                            if (r0 == 7) {
                                _ZN13BenchmarkDemo11createTest6Ev(i7);
                                r0 = sp + (-41264)
                                heapClassInst.heap32[(g0)] = 8
                                r1 = r0 >> 2
                                _Znwj(i7);
                                heapClassInst.heap32[(r1 + 10006)] = Int32(commonVariable.r_g0)
                                heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                heapClassInst.heap32[(g0 + 1)] = 0
                                gettimeofday(i7);
                                heapClassInst.heap32[(r1 + 10000)] = 0
                                heapClassInst.heap32[(r1 + 10001)] = 0
                                heapClassInst.heap32[(r1 + 10005)] = 0
                                heapClassInst.heap32[(r1 + 10004)] = 9999
                                heapClassInst.heap32[(r1 + 10003)] = 0
                                heapClassInst.heap32[(r1 + 10002)] = 0
                                heapClassInst.heap32[(r1 + 10007)] = 1092616192
                                heapClassInst.heap32[(r1 + 10008)] = 0
                                heapClassInst.heap32[(r1 + 10009)] = 0
                                heapClassInst.heap32[(r1 + 10010)] = 1112014848
                                heapClassInst.heap32[(r1 + 10011)] = 1065353216
                                f3 = 0.0
                                while (true) {
                                    f0 = Float64(r3)
                                    f1 = 0.025132741779088974
                                    f0 = f0 * f1
                                    f1 = 0.5
                                    f0 = f0 * f1
                                    heapClassInst.heapFloat[(g0)] = Float32(f0)
                                    sinf(i7);
                                    f2 = 1.0
                                    f1 = commonVariable.f_g0 / f2
                                    f2 = f1 * f3
                                    heapClassInst.heapFloat[(g0)] = Float32(f0)
                                    cosf(i7);
                                    f4 = -f2
                                    f5 = commonVariable.f_g0 * f3
                                    f6 = f2 * f3
                                    f7 = f4 - f2
                                    f8 = commonVariable.f_g0 + f2
                                    f8 = f8 - f6
                                    f7 = f7 - f6
                                    f9 = f5 + f2
                                    f9 = f9 - f6
                                    f5 = f5 + f6
                                    f6 = f7 * f4
                                    f10 = f8 * commonVariable.f_g0
                                    f5 = f5 - f1
                                    f11 = f9 * commonVariable.f_g0
                                    f7 = f7 * f1
                                    f10 = f6 + f10
                                    f4 = f9 * f4
                                    r2 = r3 << 4
                                    f0 = f5 * commonVariable.f_g0
                                    f7 = f11 - f7
                                    f9 = f5 * f2
                                    f10 = f10 + f4
                                    f5 = f5 * f1
                                    r2 = (r0 + r2) | 0
                                    f0 = f6 + f0
                                    f1 = f8 * f1
                                    f6 = f7 - f9
                                    f2 = f8 * f2
                                    f5 = f10 + f5
                                    f7 = 2500.0
                                    f0 = f0 - f1
                                    f1 = f6 + f2
                                    r2 = r2 >> 2
                                    f2 = f5 * f7
                                    f0 = f0 - f4
                                    f1 = f1 * f7
                                    heapClassInst.heapFloat[(r2 + 4000)] = Float32(f2)
                                    f0 = f0 * f7
                                    heapClassInst.heapFloat[(r2 + 4001)] = Float32(f1)
                                    heapClassInst.heapFloat[(r2 + 4002)] = Float32(f0)
                                    heapClassInst.heap32[(r2 + 4003)] = 0
                                    f1 = Float64(heapClassInst.heapFloat[(r1 + 10008)])
                                    heapClassInst.heapFloat[(r2)] = Float32(f1)
                                    heapClassInst.heap32[(r2 + 1)] = 1112014848
                                    heapClassInst.heap32[(r2 + 2)] = 0
                                    f1 = f1 + f2
                                    heapClassInst.heap32[(r2 + 3)] = 0
                                    f0 = f0 + f3
                                    heapClassInst.heapFloat[(r2 + 2000)] = Float32(f1)
                                    heapClassInst.heapFloat[(r2 + 2002)] = Float32(f0)
                                    heapClassInst.heap32[(r2 + 2003)] = 0
                                    heapClassInst.heap32[(r2 + 2001)] = (-998637568)
                                    heapClassInst.heap32[(r2 + 8000)] = 1065353216
                                    heapClassInst.heap32[(r2 + 8001)] = 0
                                    r3 = (r3 + 1) | 0
                                    heapClassInst.heap32[(r2 + 8002)] = 0
                                    heapClassInst.heap32[(r2 + 8003)] = 0
                                    if (!(r3 != 500)) {
                                        break
                                    }
                                }
                                r2 = _ZL10raycastBar
                                heapClassInst.heap32[(g0)] = Int32(r2)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r0)
                                heapClassInst.heap32[(g0 + 2)] = 8000
                                memcpy(i7);
                                r3 = (r2 + 8000) | 0
                                r4 = (r0 + 8000) | 0
                                heapClassInst.heap32[(g0)] = Int32(r3)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r4)
                                heapClassInst.heap32[(g0 + 2)] = 8000
                                memcpy(i7);
                                r3 = (r2 + 16000) | 0
                                r4 = (r0 + 16000) | 0
                                heapClassInst.heap32[(g0)] = Int32(r3)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r4)
                                heapClassInst.heap32[(g0 + 2)] = 8000
                                memcpy(i7);
                                r3 = (r2 + 24000) | 0
                                r4 = (r0 + 24000) | 0
                                heapClassInst.heap32[(g0)] = Int32(r3)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r4)
                                heapClassInst.heap32[(g0 + 2)] = 8000
                                memcpy(i7);
                                r3 = (r2 + 32000) | 0
                                r0 = (r0 + 32000) | 0
                                heapClassInst.heap32[(g0)] = Int32(r3)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r0)
                                heapClassInst.heap32[(g0 + 2)] = 8000
                                memcpy(i7);
                                r0 = r2 >> 2
                                r2 = Int64(heapClassInst.heap32[(r1 + 10000)])
                                heapClassInst.heap32[(r0 + 10000)] = Int32(r2)
                                r2 = Int64(heapClassInst.heap32[(r1 + 10001)])
                                heapClassInst.heap32[(r0 + 10001)] = Int32(r2)
                                r2 = Int64(heapClassInst.heap32[(r1 + 10002)])
                                heapClassInst.heap32[(r0 + 10002)] = Int32(r2)
                                r2 = Int64(heapClassInst.heap32[(r1 + 10003)])
                                heapClassInst.heap32[(r0 + 10003)] = Int32(r2)
                                r2 = Int64(heapClassInst.heap32[(r1 + 10004)])
                                heapClassInst.heap32[(r0 + 10004)] = Int32(r2)
                                r2 = Int64(heapClassInst.heap32[(r1 + 10005)])
                                heapClassInst.heap32[(r0 + 10005)] = Int32(r2)
                                r2 = Int64(heapClassInst.heap32[(r1 + 10006)])
                                r2 = r2 >> 2
                                r3 = Int64(heapClassInst.heap32[(r0 + 10006)])
                                r4 = Int64(heapClassInst.heap32[(r2 + 1)])
                                r2 = Int64(heapClassInst.heap32[(r2)])
                                r3 = r3 >> 2
                                heapClassInst.heap32[(r3)] = Int32(r2)
                                heapClassInst.heap32[(r3 + 1)] = Int32(r4)
                                heapClassInst.heap32[(r0 + 10007)] = heapClassInst.heap32[(r1 + 10007)]
                                heapClassInst.heap32[(r0 + 10008)] = heapClassInst.heap32[(r1 + 10008)]
                                heapClassInst.heap32[(r0 + 10009)] = heapClassInst.heap32[(r1 + 10009)]
                                heapClassInst.heap32[(r0 + 10010)] = heapClassInst.heap32[(r1 + 10010)]
                                heapClassInst.heap32[(r0 + 10011)] = heapClassInst.heap32[(r1 + 10011)]
                                r0 = Int64(heapClassInst.heap32[(r1 + 10006)])
                                heapClassInst.heap32[(g0)] = Int32(r0)
                                _ZdlPv(i7);
                                return;
                            } else {
                                break
                            }
                        }
                    } else {
                        if (r0 == 4) {
                            r3 = Int64(heapClassInst.heap32[(r2)])
                            r3 = (r3 + 1) | 0
                            heapClassInst.heap32[(r2)] = Int32(r3)
                            heapClassInst.heap32[(g0)] = 127
                            mallocNew(i7);
                            r2 = commonVariable.r_g0
                            if (r2 != 0) {
                                r3 = 0
                                r4 = (r2 + 4) | 0
                                r3 = (r3 - r4) | 0
                                r3 = r3 & 15
                                r3 = (r2 + r3) | 0
                                r4 = (r3 + 4) | 0
                                r3 = r3 >> 2
                                heapClassInst.heap32[(r3)] = Int32(r2)
                                r2 = r4
                            }
                            heapClassInst.heap32[(g0)] = Int32(r2)
                            heapClassInst.heap32[(g0 + 1)] = 0
                            heapClassInst.heap32[(g0 + 2)] = 0
                            r3 = r2 >> 2
                            _ZN17btConvexHullShapeC1EPKfii(i7);
                            r4 = Int64(heapClassInst.heap32[(r3)])
                            r4 = r4 >> 2
                            r4 = Int64(heapClassInst.heap32[(r4 + 6)])
                            r0 = sp + (-96)
                            r5 = r0 >> 2
                            heapClassInst.heap32[(fp + (-24))] = 1065353216
                            heapClassInst.heap32[(r5 + 1)] = 1065353216
                            heapClassInst.heap32[(r5 + 2)] = 1065353216
                            heapClassInst.heap32[(r5 + 3)] = 0
                            heapClassInst.heap32[(g0)] = Int32(r2)
                            heapClassInst.heap32[(g0 + 1)] = Int32(r0)
                            r0 = 0
                            __FUNCTION_TABLE__[(r4) >> 2](i7);
                            while (true) {
                                r4 = (r0 * (-3)) | 0
                                r5 = _ZL7TaruVtx
                                r4 = r4 << 2
                                r4 = (r5 + r4) | 0
                                r5 = sp + (-80)
                                r4 = r4 >> 2
                                r7 = r5 >> 2
                                heapClassInst.heap32[(fp + (-20))] = heapClassInst.heap32[(r4)]
                                heapClassInst.heap32[(r7 + 1)] = heapClassInst.heap32[(r4 + 1)]
                                heapClassInst.heap32[(r7 + 2)] = heapClassInst.heap32[(r4 + 2)]
                                heapClassInst.heap32[(r7 + 3)] = 0
                                heapClassInst.heap32[(g0)] = Int32(r2)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r5)
                                r0 = (r0 + (-1)) | 0
                                _ZN17btConvexHullShape8addPointERK9btVector3(i7);
                                if (r0 == (-43)) {
                                    break
                                }
                            }
                            r4 = sp + (-160)
                            r0 = r4 >> 2
                            heapClassInst.heap32[(fp + (-40))] = 1065353216
                            heapClassInst.heap32[(r0 + 1)] = 0
                            heapClassInst.heap32[(r0 + 2)] = 0
                            heapClassInst.heap32[(r0 + 3)] = 0
                            heapClassInst.heap32[(r0 + 4)] = 0
                            heapClassInst.heap32[(r0 + 5)] = 1065353216
                            heapClassInst.heap32[(r0 + 6)] = 0
                            heapClassInst.heap32[(r0 + 7)] = 0
                            heapClassInst.heap32[(r0 + 8)] = 0
                            heapClassInst.heap32[(r0 + 9)] = 0
                            heapClassInst.heap32[(r0 + 10)] = 1065353216
                            heapClassInst.heap32[(r0 + 11)] = 0
                            heapClassInst.heap32[(r0 + 12)] = 0
                            heapClassInst.heap32[(r0 + 13)] = 0
                            heapClassInst.heap32[(r0 + 14)] = 0
                            r5 = sp + (-176)
                            heapClassInst.heap32[(r0 + 15)] = 0
                            r7 = r5 >> 2
                            heapClassInst.heap32[(fp + (-44))] = 0
                            heapClassInst.heap32[(r7 + 1)] = 0
                            heapClassInst.heap32[(r7 + 2)] = 0
                            heapClassInst.heap32[(r7 + 3)] = 0
                            r3 = Int64(heapClassInst.heap32[(r3)])
                            r3 = r3 >> 2
                            r7 = Int64(heapClassInst.heap32[(r3 + 8)])
                            heapClassInst.heap32[(g0)] = Int32(r2)
                            heapClassInst.heap32[(g0 + 1)] = 1065353216
                            heapClassInst.heap32[(g0 + 2)] = Int32(r5)
                            r3 = 15
                            f0 = 3.0
                            f2 = (-18.0)
                            f3 = 1.5
                            __FUNCTION_TABLE__[(r7) >> 2](i7);
                            f1 = f0
                            while (true) {
                                f4 = f3 + f0
                                r5 = 0
                                r7 = r5
                                while (true) {
                                    f5 = Float64(r7)
                                    f5 = f5 * f4
                                    f5 = f5 + f2
                                    r8 = r5
                                    while (true) {
                                        f6 = Float64(r8)
                                        f6 = f6 * f4
                                        f6 = f6 + f2
                                        heapClassInst.heapFloat[(r0 + 12)] = Float32(f6)
                                        heapClassInst.heapFloat[(r0 + 13)] = Float32(f1)
                                        heapClassInst.heapFloat[(r0 + 14)] = Float32(f5)
                                        heapClassInst.heap32[(r0 + 15)] = 0
                                        r9 = Int64(heapClassInst.heap32[(r1)])
                                        r9 = r9 >> 2
                                        r9 = Int64(heapClassInst.heap32[(r9 + 2)])
                                        heapClassInst.heap32[(g0)] = Int32(r6)
                                        heapClassInst.heap32[(g0 + 1)] = 1065353216
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r4)
                                        heapClassInst.heap32[(g0 + 3)] = Int32(r2)
                                        r8 = (r8 + 1) | 0
                                        __FUNCTION_TABLE__[(r9) >> 2](i7);
                                        if (!(r8 != 8)) {
                                            break
                                        }
                                    }
                                    r7 = (r7 + 1) | 0
                                    if (!(r7 != 8)) {
                                        break
                                    }
                                }
                                f4 = 1.0099999904632568
                                f5 = -0.05000000074505806
                                f4 = f3 * f4
                                f6 = 3.0
                                f3 = f3 * f5
                                f5 = 7.0
                                f6 = f4 + f6
                                f3 = f3 * f5
                                r3 = (r3 + (-1)) | 0
                                f1 = f1 + f6
                                f2 = f3 + f2
                                f3 = f4
                                if (r3 == 0) {
                                    break
                                } else {
                                    continue
                                }
                            }
                        } else {
                            if (r0 == 5) {
                                r3 = 10
                                f0 = 20.0
                                f1 = 2.0
                                f2 = (-25.0)
                                while (true) {
                                    f3 = 3.0
                                    f4 = 25.0
                                    f5 = f1 + f3
                                    f4 = f0 + f4
                                    r0 = 0
                                    r5 = r0
                                    while (true) {
                                        f6 = Float64(r5)
                                        f6 = f6 * f5
                                        f6 = f6 + f2
                                        f7 = 5.0
                                        f6 = f6 * f7
                                        f8 = 0.0
                                        f6 = f6 + f8
                                        r7 = r0
                                        while (true) {
                                            r8 = _ZL8nextRand
                                            r8 = r8 >> 2
                                            r9 = Int64(heapClassInst.heap32[(r8)])
                                            r9 = (r9 * 214013) | 0
                                            r9 = (r9 + 2531011) | 0
                                            r10 = sp + (-64)
                                            heapClassInst.heap32[(r8)] = Int32(r9)
                                            r8 = r10 >> 2
                                            heapClassInst.heap32[(fp + (-16))] = 1065353216
                                            heapClassInst.heap32[(r8 + 1)] = 0
                                            heapClassInst.heap32[(r8 + 2)] = 0
                                            heapClassInst.heap32[(r8 + 3)] = 0
                                            heapClassInst.heap32[(r8 + 4)] = 0
                                            heapClassInst.heap32[(r8 + 5)] = 1065353216
                                            heapClassInst.heap32[(r8 + 6)] = 0
                                            heapClassInst.heap32[(r8 + 7)] = 0
                                            f9 = Float64(r7)
                                            heapClassInst.heap32[(r8 + 8)] = 0
                                            f9 = f9 * f5
                                            heapClassInst.heap32[(r8 + 9)] = 0
                                            f9 = f9 + f2
                                            heapClassInst.heap32[(r8 + 10)] = 1065353216
                                            f9 = f9 * f7
                                            f9 = f9 + f8
                                            heapClassInst.heap32[(r8 + 11)] = 0
                                            r9 = r9 >> 16
                                            heapClassInst.heapFloat[(r8 + 12)] = Float32(f9)
                                            r9 = r9 & 32767
                                            heapClassInst.heapFloat[(r8 + 13)] = Float32(f4)
                                            r9 = Int64(floor(Float64(`UIntNative`(r9) % `UIntNative`(9))))
                                            heapClassInst.heapFloat[(r8 + 14)] = Float32(f6)
                                            heapClassInst.heap32[(r8 + 15)] = 0
                                            if (!(`UIntNative`(r9) > `UIntNative`(8))) {
                                                r8 = r4 << r9
                                                r11 = r8 & 7
                                                if (r11 != 0) {
                                                    r8 = Int64(heapClassInst.heap32[(r2)])
                                                    r8 = (r8 + 1) | 0
                                                    heapClassInst.heap32[(r2)] = Int32(r8)
                                                    r9 = (r9 + 1) | 0
                                                    f9 = Float64(r9)
                                                    f10 = 0.5
                                                    heapClassInst.heap32[(g0)] = 71
                                                    f9 = f9 * f10
                                                    f10 = 1.5
                                                    mallocNew(i7);
                                                    r9 = commonVariable.r_g0
                                                    f10 = f9 * f10
                                                    if (r9 != 0) {
                                                        r8 = 0
                                                        r11 = (r9 + 4) | 0
                                                        r8 = (r8 - r11) | 0
                                                        r8 = r8 & 15
                                                        r8 = (r9 + r8) | 0
                                                        r11 = (r8 + 4) | 0
                                                        r8 = r8 >> 2
                                                        heapClassInst.heap32[(r8)] = Int32(r9)
                                                        r9 = r11
                                                    }
                                                    r8 = r9 >> 2
                                                    heapClassInst.heap32[(r8 + 2)] = 0
                                                    heapClassInst.heap32[(r8 + 3)] = 1065353216
                                                    heapClassInst.heap32[(r8 + 4)] = 1065353216
                                                    heapClassInst.heap32[(r8 + 5)] = 1065353216
                                                    r11 = _ZTV10btBoxShape
                                                    heapClassInst.heap32[(r8 + 6)] = 0
                                                    r11 = (r11 + 8) | 0
                                                    heapClassInst.heap32[(r8 + 11)] = 1025758986
                                                    heapClassInst.heap32[(r8)] = Int32(r11)
                                                    f11 = -0.039999999105930328
                                                    f10 = f10 + f11
                                                    heapClassInst.heap32[(r8 + 1)] = 0
                                                    heapClassInst.heapFloat[(r8 + 7)] = Float32(f10)
                                                    heapClassInst.heapFloat[(r8 + 8)] = Float32(f10)
                                                    heapClassInst.heapFloat[(r8 + 9)] = Float32(f10)
                                                    heapClassInst.heap32[(r8 + 10)] = 0
                                                    r8 = Int64(heapClassInst.heap32[(r1)])
                                                    r8 = r8 >> 2
                                                    r8 = Int64(heapClassInst.heap32[(r8 + 2)])
                                                    heapClassInst.heap32[(g0)] = Int32(r6)
                                                    heapClassInst.heapFloat[(g0 + 1)] = Float32(f9)
                                                    heapClassInst.heap32[(g0 + 2)] = Int32(r10)
                                                    heapClassInst.heap32[(g0 + 3)] = Int32(r9)
                                                    __FUNCTION_TABLE__[(r8) >> 2](i7);
                                                } else {
                                                    r11 = r8 & 56
                                                    if (r11 != 0) {
                                                        r8 = Int64(heapClassInst.heap32[(r2)])
                                                        r8 = (r8 + 1) | 0
                                                        heapClassInst.heap32[(r2)] = Int32(r8)
                                                        r9 = (r9 + (-2)) | 0
                                                        heapClassInst.heap32[(g0)] = 71
                                                        f9 = Float64(r9)
                                                        f10 = 0.5
                                                        mallocNew(i7);
                                                        r9 = commonVariable.r_g0
                                                        f9 = f9 * f10
                                                        if (r9 != 0) {
                                                            r8 = 0
                                                            r11 = (r9 + 4) | 0
                                                            r8 = (r8 - r11) | 0
                                                            r8 = r8 & 15
                                                            r8 = (r9 + r8) | 0
                                                            r11 = (r8 + 4) | 0
                                                            r8 = r8 >> 2
                                                            heapClassInst.heap32[(r8)] = Int32(r9)
                                                            r9 = r11
                                                        }
                                                        r8 = r9 >> 2
                                                        heapClassInst.heap32[(r8 + 2)] = 0
                                                        heapClassInst.heap32[(r8 + 3)] = 1065353216
                                                        heapClassInst.heap32[(r8 + 4)] = 1065353216
                                                        r11 = _ZTV13btSphereShape
                                                        heapClassInst.heap32[(r8 + 5)] = 1065353216
                                                        r11 = (r11 + 8) | 0
                                                        heapClassInst.heap32[(r8 + 6)] = 0
                                                        heapClassInst.heap32[(r8)] = Int32(r11)
                                                        f10 = 1.5
                                                        f10 = f9 * f10
                                                        heapClassInst.heap32[(r8 + 1)] = 8
                                                        heapClassInst.heapFloat[(r8 + 7)] = Float32(f10)
                                                        heapClassInst.heapFloat[(r8 + 11)] = Float32(f10)
                                                        r8 = Int64(heapClassInst.heap32[(r1)])
                                                        r8 = r8 >> 2
                                                        r8 = Int64(heapClassInst.heap32[(r8 + 2)])
                                                        heapClassInst.heap32[(g0)] = Int32(r6)
                                                        heapClassInst.heapFloat[(g0 + 1)] = Float32(f9)
                                                        heapClassInst.heap32[(g0 + 2)] = Int32(r10)
                                                        heapClassInst.heap32[(g0 + 3)] = Int32(r9)
                                                        __FUNCTION_TABLE__[(r8) >> 2](i7);
                                                    } else {
                                                        r8 = r8 & 448
                                                        if (r8 != 0) {
                                                            r8 = Int64(heapClassInst.heap32[(r2)])
                                                            r8 = (r8 + 1) | 0
                                                            heapClassInst.heap32[(r2)] = Int32(r8)
                                                            r8 = (r9 + (-5)) | 0
                                                            heapClassInst.heap32[(g0)] = 75
                                                            f9 = Float64(r8)
                                                            f10 = 0.5
                                                            mallocNew(i7);
                                                            r8 = commonVariable.r_g0
                                                            f9 = f9 * f10
                                                            if (r8 != 0) {
                                                                r9 = 0
                                                                r11 = (r8 + 4) | 0
                                                                r9 = (r9 - r11) | 0
                                                                r9 = r9 & 15
                                                                r9 = (r8 + r9) | 0
                                                                r11 = (r9 + 4) | 0
                                                                r9 = r9 >> 2
                                                                heapClassInst.heap32[(r9)] = Int32(r8)
                                                                r8 = r11
                                                            }
                                                            r9 = r8 >> 2
                                                            heapClassInst.heap32[(r9 + 2)] = 0
                                                            heapClassInst.heap32[(r9 + 3)] = 1065353216
                                                            heapClassInst.heap32[(r9 + 4)] = 1065353216
                                                            heapClassInst.heap32[(r9 + 5)] = 1065353216
                                                            r11 = _ZTV14btCapsuleShape
                                                            heapClassInst.heap32[(r9 + 6)] = 0
                                                            r11 = (r11 + 8) | 0
                                                            heapClassInst.heap32[(r9 + 11)] = 1025758986
                                                            heapClassInst.heap32[(r9)] = Int32(r11)
                                                            heapClassInst.heap32[(r9 + 1)] = 10
                                                            heapClassInst.heap32[(r9 + 13)] = 1
                                                            f11 = f9 + f9
                                                            f10 = f11 * f10
                                                            heapClassInst.heapFloat[(r9 + 7)] = Float32(f9)
                                                            heapClassInst.heapFloat[(r9 + 8)] = Float32(f10)
                                                            heapClassInst.heapFloat[(r9 + 9)] = Float32(f9)
                                                            heapClassInst.heap32[(r9 + 10)] = 0
                                                            r9 = Int64(heapClassInst.heap32[(r1)])
                                                            r9 = r9 >> 2
                                                            r9 = Int64(heapClassInst.heap32[(r9 + 2)])
                                                            heapClassInst.heap32[(g0)] = Int32(r6)
                                                            heapClassInst.heapFloat[(g0 + 1)] = Float32(f9)
                                                            heapClassInst.heap32[(g0 + 2)] = Int32(r10)
                                                            heapClassInst.heap32[(g0 + 3)] = Int32(r8)
                                                            __FUNCTION_TABLE__[(r9) >> 2](i7);
                                                        }
                                                    }
                                                }
                                            }
                                            r7 = (r7 + 1) | 0
                                            if (!(r7 != 10)) {
                                                break
                                            }
                                        }
                                        r5 = (r5 + 1) | 0
                                        if (!(r5 != 10)) {
                                            break
                                        }
                                    }
                                    f4 = 1.1000000238418579
                                    f5 = -0.05000000074505806
                                    f4 = f1 * f4
                                    f1 = f1 * f5
                                    f5 = 9.0
                                    f3 = f4 + f3
                                    f1 = f1 * f5
                                    r3 = (r3 + (-1)) | 0
                                    f0 = f0 + f3
                                    f2 = f1 + f2
                                    f1 = f4
                                    if (!(r3 != 0)) {
                                        break
                                    }
                                }
                                _ZN13BenchmarkDemo19createLargeMeshBodyEv(i7);
                                return;
                            } else {
                                break
                            }
                        }
                    }
                } else {
                    if (r0 == 1) {
                        r3 = Int64(heapClassInst.heap32[(r2)])
                        r3 = (r3 + 1) | 0
                        heapClassInst.heap32[(r2)] = Int32(r3)
                        heapClassInst.heap32[(g0)] = 71
                        mallocNew(i7);
                        r2 = commonVariable.r_g0
                        if (r2 != 0) {
                            r3 = 0
                            r4 = (r2 + 4) | 0
                            r3 = (r3 - r4) | 0
                            r3 = r3 & 15
                            r3 = (r2 + r3) | 0
                            r4 = (r3 + 4) | 0
                            r3 = r3 >> 2
                            heapClassInst.heap32[(r3)] = Int32(r2)
                            r2 = r4
                        }
                        r3 = r2 >> 2
                        heapClassInst.heap32[(r3 + 2)] = 0
                        heapClassInst.heap32[(r3 + 3)] = 1065353216
                        heapClassInst.heap32[(r3 + 4)] = 1065353216
                        heapClassInst.heap32[(r3 + 5)] = 1065353216
                        r4 = _ZTV10btBoxShape
                        heapClassInst.heap32[(r3 + 6)] = 0
                        r4 = (r4 + 8) | 0
                        heapClassInst.heap32[(r3 + 11)] = 1025758986
                        heapClassInst.heap32[(r3)] = Int32(r4)
                        heapClassInst.heap32[(r3 + 1)] = 0
                        heapClassInst.heap32[(r3 + 7)] = 1064682127
                        heapClassInst.heap32[(r3 + 8)] = 1064682127
                        heapClassInst.heap32[(r3 + 9)] = 1064682127
                        r4 = sp + (-1152)
                        heapClassInst.heap32[(r3 + 10)] = 0
                        r3 = r4 >> 2
                        heapClassInst.heap32[(fp + (-288))] = 0
                        heapClassInst.heap32[(r3 + 1)] = 0
                        heapClassInst.heap32[(r3 + 2)] = 0
                        heapClassInst.heap32[(r3 + 3)] = 0
                        heapClassInst.heap32[(g0)] = Int32(r2)
                        heapClassInst.heap32[(g0 + 1)] = 1073741824
                        heapClassInst.heap32[(g0 + 2)] = Int32(r4)
                        _ZNK10btBoxShape21calculateLocalInertiaEfR9btVector3(i7);
                        r3 = sp + (-1216)
                        r4 = r3 >> 2
                        heapClassInst.heap32[(fp + (-304))] = 1065353216
                        heapClassInst.heap32[(r4 + 1)] = 0
                        heapClassInst.heap32[(r4 + 2)] = 0
                        heapClassInst.heap32[(r4 + 3)] = 0
                        heapClassInst.heap32[(r4 + 4)] = 0
                        heapClassInst.heap32[(r4 + 5)] = 1065353216
                        heapClassInst.heap32[(r4 + 6)] = 0
                        heapClassInst.heap32[(r4 + 7)] = 0
                        heapClassInst.heap32[(r4 + 8)] = 0
                        heapClassInst.heap32[(r4 + 9)] = 0
                        heapClassInst.heap32[(r4 + 10)] = 1065353216
                        heapClassInst.heap32[(r4 + 11)] = 0
                        heapClassInst.heap32[(r4 + 12)] = 0
                        heapClassInst.heap32[(r4 + 13)] = 0
                        r0 = 47
                        f0 = (-12.0)
                        f1 = 2.0
                        heapClassInst.heap32[(r4 + 14)] = 0
                        heapClassInst.heap32[(r4 + 15)] = 0
                        while (true) {
                            r5 = 0
                            r7 = r5
                            while (true) {
                                f2 = Float64(r7)
                                f3 = 3.0
                                f2 = f2 * f3
                                f2 = f2 + f0
                                r8 = r5
                                while (true) {
                                    f4 = Float64(r8)
                                    f4 = f4 * f3
                                    f4 = f4 + f0
                                    heapClassInst.heapFloat[(r4 + 12)] = Float32(f4)
                                    heapClassInst.heapFloat[(r4 + 13)] = Float32(f1)
                                    heapClassInst.heapFloat[(r4 + 14)] = Float32(f2)
                                    heapClassInst.heap32[(r4 + 15)] = 0
                                    r9 = Int64(heapClassInst.heap32[(r1)])
                                    r9 = r9 >> 2
                                    r9 = Int64(heapClassInst.heap32[(r9 + 2)])
                                    heapClassInst.heap32[(g0)] = Int32(r6)
                                    heapClassInst.heap32[(g0 + 1)] = 1073741824
                                    heapClassInst.heap32[(g0 + 2)] = Int32(r3)
                                    heapClassInst.heap32[(g0 + 3)] = Int32(r2)
                                    r8 = (r8 + 1) | 0
                                    __FUNCTION_TABLE__[(r9) >> 2](i7);
                                    if (!(r8 != 8)) {
                                        break
                                    }
                                }
                                r7 = (r7 + 1) | 0
                                if (!(r7 != 8)) {
                                    break
                                }
                            }
                            f2 = -0.34999999403953552
                            r0 = (r0 + (-1)) | 0
                            f1 = f1 + f3
                            f0 = f0 + f2
                            if (r0 == 0) {
                                break
                            } else {
                                continue
                            }
                        }
                    } else {
                        if (r0 == 2) {
                            r3 = Int64(heapClassInst.heap32[(r2)])
                            r3 = (r3 + 1) | 0
                            heapClassInst.heap32[(r2)] = Int32(r3)
                            heapClassInst.heap32[(g0)] = 71
                            mallocNew(i7);
                            r3 = commonVariable.r_g0
                            if (r3 != 0) {
                                r4 = 0
                                r0 = (r3 + 4) | 0
                                r4 = (r4 - r0) | 0
                                r4 = r4 & 15
                                r4 = (r3 + r4) | 0
                                r0 = (r4 + 4) | 0
                                r4 = r4 >> 2
                                heapClassInst.heap32[(r4)] = Int32(r3)
                                r3 = r0
                            }
                            r4 = r3 >> 2
                            heapClassInst.heap32[(r4 + 2)] = 0
                            heapClassInst.heap32[(r4 + 3)] = 1065353216
                            heapClassInst.heap32[(r4 + 4)] = 1065353216
                            heapClassInst.heap32[(r4 + 5)] = 1065353216
                            r0 = _ZTV10btBoxShape
                            heapClassInst.heap32[(r4 + 6)] = 0
                            r0 = (r0 + 8) | 0
                            heapClassInst.heap32[(r4 + 11)] = 1025758986
                            heapClassInst.heap32[(r4)] = Int32(r0)
                            heapClassInst.heap32[(r4 + 1)] = 0
                            heapClassInst.heap32[(r4 + 7)] = 1064682127
                            heapClassInst.heap32[(r4 + 8)] = 1064682127
                            heapClassInst.heap32[(r4 + 9)] = 1064682127
                            r5 = sp + (-1024)
                            heapClassInst.heap32[(r4 + 10)] = 0
                            r4 = r5 >> 2
                            heapClassInst.heap32[(fp + (-256))] = 1065353216
                            heapClassInst.heap32[(r4 + 1)] = 0
                            heapClassInst.heap32[(r4 + 2)] = 0
                            heapClassInst.heap32[(r4 + 3)] = 0
                            heapClassInst.heap32[(r4 + 4)] = 0
                            heapClassInst.heap32[(r4 + 5)] = 1065353216
                            heapClassInst.heap32[(r4 + 6)] = 0
                            heapClassInst.heap32[(r4 + 7)] = 0
                            heapClassInst.heap32[(r4 + 8)] = 0
                            heapClassInst.heap32[(r4 + 9)] = 0
                            heapClassInst.heap32[(r4 + 10)] = 1065353216
                            heapClassInst.heap32[(r4 + 11)] = 0
                            heapClassInst.heap32[(r4 + 12)] = 0
                            heapClassInst.heap32[(r4 + 13)] = 0
                            heapClassInst.heap32[(r4 + 14)] = 0
                            r7 = sp + (-1040)
                            heapClassInst.heap32[(r4 + 15)] = 0
                            r8 = r7 >> 2
                            heapClassInst.heap32[(fp + (-260))] = 0
                            heapClassInst.heap32[(r8 + 1)] = 0
                            heapClassInst.heap32[(r8 + 2)] = 0
                            heapClassInst.heap32[(r8 + 3)] = 0
                            heapClassInst.heap32[(g0)] = Int32(r3)
                            heapClassInst.heap32[(g0 + 1)] = 1065353216
                            heapClassInst.heap32[(g0 + 2)] = Int32(r7)
                            r7 = 12
                            f0 = -12.240598678588867
                            f1 = 1.0
                            _ZNK10btBoxShape21calculateLocalInertiaEfR9btVector3(i7);
                            f2 = f0
                            f8 = (-20.0)
                            while (true) {
                                if (!(r7 < 1)) {
                                    f4 = 0.0
                                    f3 = f1 + f4
                                    r8 = 0
                                    r9 = r8
                                    while (true) {
                                        f5 = Float64(r9)
                                        f6 = 2.0400998592376709
                                        f5 = f5 * f6
                                        f5 = f5 + f0
                                        f5 = f5 + f4
                                        r10 = r8
                                        while (true) {
                                            f7 = Float64(r10)
                                            f7 = f7 * f6
                                            f7 = f7 + f2
                                            f7 = f7 + f8
                                            heapClassInst.heapFloat[(r4 + 12)] = Float32(f7)
                                            heapClassInst.heapFloat[(r4 + 13)] = Float32(f3)
                                            heapClassInst.heapFloat[(r4 + 14)] = Float32(f5)
                                            heapClassInst.heap32[(r4 + 15)] = 0
                                            r11 = Int64(heapClassInst.heap32[(r1)])
                                            r11 = r11 >> 2
                                            r11 = Int64(heapClassInst.heap32[(r11 + 2)])
                                            heapClassInst.heap32[(g0)] = Int32(r6)
                                            heapClassInst.heap32[(g0 + 1)] = 1065353216
                                            heapClassInst.heap32[(g0 + 2)] = Int32(r5)
                                            heapClassInst.heap32[(g0 + 3)] = Int32(r3)
                                            r10 = (r10 + 1) | 0
                                            __FUNCTION_TABLE__[(r11) >> 2](i7);
                                            if (!(r7 != r10)) {
                                                break
                                            }
                                        }
                                        r9 = (r9 + 1) | 0
                                        if (!(r7 != r9)) {
                                            break
                                        }
                                    }
                                }
                                f3 = 2.0400998592376709
                                f4 = 1.0199999809265137
                                r7 = (r7 + (-1)) | 0
                                f1 = f1 + f3
                                f0 = f0 + f4
                                f2 = f2 + f4
                                if (r7 == 0) {
                                    break
                                }
                            }
                            r3 = sp + (-1136)
                            r4 = r3 >> 2
                            heapClassInst.heap32[(fp + (-284))] = 1065353216
                            heapClassInst.heap32[(r4 + 1)] = 1065353216
                            heapClassInst.heap32[(r4 + 2)] = 1065353216
                            r5 = sp + (-1120)
                            heapClassInst.heap32[(r4 + 3)] = 0
                            r4 = r5 >> 2
                            heapClassInst.heap32[(fp + (-280))] = (-1073741824)
                            heapClassInst.heap32[(r4 + 1)] = 0
                            heapClassInst.heap32[(r4 + 2)] = 0
                            heapClassInst.heap32[(r4 + 3)] = 0
                            heapClassInst.heap32[(g0)] = Int32(r5)
                            heapClassInst.heap32[(g0 + 1)] = Int32(r3)
                            r3 = sp + (-1104)
                            _ZN13BenchmarkDemo10createWallERK9btVector3iS2_(i7);
                            r4 = r3 >> 2
                            heapClassInst.heap32[(fp + (-276))] = 1065353216
                            heapClassInst.heap32[(r4 + 1)] = 1065353216
                            heapClassInst.heap32[(r4 + 2)] = 1065353216
                            r5 = sp + (-1088)
                            heapClassInst.heap32[(r4 + 3)] = 0
                            r4 = r5 >> 2
                            heapClassInst.heap32[(fp + (-272))] = 1082130432
                            heapClassInst.heap32[(r4 + 1)] = 0
                            heapClassInst.heap32[(r4 + 2)] = 0
                            heapClassInst.heap32[(r4 + 3)] = 0
                            heapClassInst.heap32[(g0)] = Int32(r5)
                            heapClassInst.heap32[(g0 + 1)] = Int32(r3)
                            r3 = sp + (-1072)
                            _ZN13BenchmarkDemo10createWallERK9btVector3iS2_(i7);
                            r4 = r3 >> 2
                            heapClassInst.heap32[(fp + (-268))] = 1065353216
                            heapClassInst.heap32[(r4 + 1)] = 1065353216
                            heapClassInst.heap32[(r4 + 2)] = 1065353216
                            r5 = sp + (-1056)
                            heapClassInst.heap32[(r4 + 3)] = 0
                            r4 = r5 >> 2
                            heapClassInst.heap32[(fp + (-264))] = 1092616192
                            heapClassInst.heap32[(r4 + 1)] = 0
                            heapClassInst.heap32[(r4 + 2)] = 0
                            heapClassInst.heap32[(r4 + 3)] = 0
                            heapClassInst.heap32[(g0)] = Int32(r5)
                            heapClassInst.heap32[(g0 + 1)] = Int32(r3)
                            _ZN13BenchmarkDemo10createWallERK9btVector3iS2_(i7);
                            r3 = Int64(heapClassInst.heap32[(r2)])
                            r3 = (r3 + 1) | 0
                            heapClassInst.heap32[(r2)] = Int32(r3)
                            heapClassInst.heap32[(g0)] = 71
                            mallocNew(i7);
                            r2 = commonVariable.r_g0
                            if (r2 != 0) {
                                r3 = 0
                                r4 = (r2 + 4) | 0
                                r3 = (r3 - r4) | 0
                                r3 = r3 & 15
                                r3 = (r2 + r3) | 0
                                r4 = (r3 + 4) | 0
                                r3 = r3 >> 2
                                heapClassInst.heap32[(r3)] = Int32(r2)
                                r2 = r4
                            }
                            r3 = r2 >> 2
                            heapClassInst.heap32[(r3 + 2)] = 0
                            heapClassInst.heap32[(r3 + 3)] = 1065353216
                            heapClassInst.heap32[(r3 + 4)] = 1065353216
                            heapClassInst.heap32[(r3 + 5)] = 1065353216
                            heapClassInst.heap32[(r3 + 6)] = 0
                            heapClassInst.heap32[(r3 + 11)] = 1025758986
                            heapClassInst.heap32[(r3)] = Int32(r0)
                            heapClassInst.heap32[(r3 + 1)] = 0
                            heapClassInst.heap32[(r3 + 7)] = 1064682127
                            heapClassInst.heap32[(r3 + 8)] = 1064682127
                            heapClassInst.heap32[(r3 + 9)] = 1064682127
                            r4 = sp + (-944)
                            heapClassInst.heap32[(r3 + 10)] = 0
                            r3 = r4 >> 2
                            heapClassInst.heap32[(fp + (-236))] = 1065353216
                            heapClassInst.heap32[(r3 + 1)] = 0
                            heapClassInst.heap32[(r3 + 2)] = 0
                            heapClassInst.heap32[(r3 + 3)] = 0
                            heapClassInst.heap32[(r3 + 4)] = 0
                            heapClassInst.heap32[(r3 + 5)] = 1065353216
                            heapClassInst.heap32[(r3 + 6)] = 0
                            heapClassInst.heap32[(r3 + 7)] = 0
                            heapClassInst.heap32[(r3 + 8)] = 0
                            heapClassInst.heap32[(r3 + 9)] = 0
                            heapClassInst.heap32[(r3 + 10)] = 1065353216
                            heapClassInst.heap32[(r3 + 11)] = 0
                            heapClassInst.heap32[(r3 + 12)] = 0
                            heapClassInst.heap32[(r3 + 13)] = 0
                            heapClassInst.heap32[(r3 + 14)] = 0
                            r0 = sp + (-960)
                            heapClassInst.heap32[(r3 + 15)] = 0
                            r5 = r0 >> 2
                            heapClassInst.heap32[(fp + (-240))] = 0
                            heapClassInst.heap32[(r5 + 1)] = 0
                            heapClassInst.heap32[(r5 + 2)] = 0
                            heapClassInst.heap32[(r5 + 3)] = 0
                            heapClassInst.heap32[(g0)] = Int32(r2)
                            heapClassInst.heap32[(g0 + 1)] = 1065353216
                            heapClassInst.heap32[(g0 + 2)] = Int32(r0)
                            r0 = 8
                            f0 = 1.0
                            f1 = 0.0
                            _ZNK10btBoxShape21calculateLocalInertiaEfR9btVector3(i7);
                            f2 = f1
                            f3 = f0
                            f4 = f1
                            while (true) {
                                r5 = 24
                                while (true) {
                                    f5 = 9.9312677383422852
                                    f6 = 0.0
                                    f7 = f3 * f0
                                    f8 = f4 * f6
                                    f9 = f3 * f5
                                    f10 = f1 * f6
                                    f7 = f8 + f7
                                    f11 = f2 * f5
                                    f9 = f10 + f9
                                    f12 = f2 * f0
                                    f13 = f1 * f0
                                    f14 = f2 * f6
                                    f7 = f7 + f11
                                    f9 = f9 - f12
                                    f11 = f13 + f14
                                    f12 = f4 * f5
                                    f5 = f1 * f5
                                    f13 = f4 * f0
                                    f11 = f11 - f12
                                    f12 = f4 * f4
                                    f15 = f3 * f3
                                    f16 = f4 * f7
                                    f17 = f1 * f9
                                    f5 = f5 + f13
                                    f13 = f3 * f6
                                    f5 = f5 - f13
                                    f12 = f12 + f15
                                    f15 = f2 * f2
                                    f18 = f3 * f7
                                    f19 = f1 * f11
                                    f16 = f16 + f17
                                    f17 = f2 * f11
                                    f12 = f12 + f15
                                    f15 = f1 * f1
                                    f7 = f2 * f7
                                    f20 = f1 * f5
                                    f18 = f18 + f19
                                    f19 = f4 * f5
                                    f16 = f16 - f17
                                    f5 = f3 * f5
                                    f17 = 2.0
                                    f12 = f12 + f15
                                    f7 = f7 + f20
                                    f15 = f3 * f9
                                    f18 = f18 - f19
                                    f9 = f2 * f9
                                    f5 = f16 + f5
                                    f16 = 25.0
                                    f12 = f17 / f12
                                    f9 = f18 + f9
                                    f5 = f5 + f16
                                    f7 = f7 - f15
                                    f11 = f4 * f11
                                    f15 = f2 * f12
                                    f16 = f3 * f12
                                    f7 = f7 + f11
                                    f9 = f9 + f6
                                    heapClassInst.heapFloat[(r3 + 12)] = Float32(f5)
                                    f5 = f3 * f16
                                    f11 = f2 * f15
                                    f7 = f7 + f6
                                    heapClassInst.heapFloat[(r3 + 13)] = Float32(f9)
                                    heapClassInst.heapFloat[(r3 + 14)] = Float32(f7)
                                    f7 = 1.0
                                    f9 = f5 + f11
                                    f18 = f4 * f16
                                    f19 = f1 * f15
                                    f9 = f7 - f9
                                    heapClassInst.heap32[(r3 + 15)] = 0
                                    f20 = f4 * f15
                                    f16 = f1 * f16
                                    f21 = f18 - f19
                                    heapClassInst.heapFloat[(fp + (-236))] = Float32(f9)
                                    f9 = f4 * f12
                                    f12 = f20 + f16
                                    heapClassInst.heapFloat[(r3 + 1)] = Float32(f21)
                                    f21 = f4 * f9
                                    heapClassInst.heapFloat[(r3 + 2)] = Float32(f12)
                                    f11 = f21 + f11
                                    f12 = f18 + f19
                                    heapClassInst.heap32[(r3 + 3)] = 0
                                    f15 = f3 * f15
                                    f9 = f1 * f9
                                    f11 = f7 - f11
                                    heapClassInst.heapFloat[(r3 + 4)] = Float32(f12)
                                    f12 = f15 - f9
                                    heapClassInst.heapFloat[(r3 + 5)] = Float32(f11)
                                    heapClassInst.heapFloat[(r3 + 6)] = Float32(f12)
                                    f11 = f20 - f16
                                    heapClassInst.heap32[(r3 + 7)] = 0
                                    f5 = f21 + f5
                                    f9 = f15 + f9
                                    heapClassInst.heapFloat[(r3 + 8)] = Float32(f11)
                                    f5 = f7 - f5
                                    heapClassInst.heapFloat[(r3 + 9)] = Float32(f9)
                                    heapClassInst.heapFloat[(r3 + 10)] = Float32(f5)
                                    heapClassInst.heap32[(r3 + 11)] = 0
                                    r7 = Int64(heapClassInst.heap32[(r1)])
                                    r7 = r7 >> 2
                                    f5 = 0.99144488573074341
                                    f7 = 0.13052619993686676
                                    r7 = Int64(heapClassInst.heap32[(r7 + 2)])
                                    f9 = f1 * f5
                                    f11 = f2 * f5
                                    f12 = f4 * f5
                                    f1 = f1 * f7
                                    f5 = f3 * f5
                                    f1 = f1 + f5
                                    f5 = f10 + f12
                                    f9 = f9 - f8
                                    f3 = f3 * f7
                                    f10 = f10 + f11
                                    f4 = f4 * f7
                                    f3 = f9 - f3
                                    f4 = f10 + f4
                                    f9 = f1 + f14
                                    heapClassInst.heap32[(g0)] = Int32(r6)
                                    heapClassInst.heap32[(g0 + 1)] = 1065353216
                                    heapClassInst.heap32[(g0 + 2)] = Int32(r4)
                                    heapClassInst.heap32[(g0 + 3)] = Int32(r2)
                                    f5 = f5 + f13
                                    f7 = f2 * f7
                                    r5 = (r5 + (-1)) | 0
                                    f1 = f3 - f14
                                    f2 = f4 - f13
                                    f3 = f9 - f8
                                    f4 = f5 - f7
                                    __FUNCTION_TABLE__[(r7) >> 2](i7);
                                    if (!(r5 != 0)) {
                                        break
                                    }
                                }
                                f5 = 0.99785894155502319
                                f7 = 0.065403133630752563
                                f8 = f4 * f5
                                f9 = f1 * f6
                                f10 = f2 * f5
                                f11 = f1 * f7
                                f12 = f3 * f5
                                f1 = f1 * f5
                                f5 = f4 * f6
                                f8 = f9 + f8
                                f13 = f3 * f6
                                f11 = f11 + f12
                                f6 = f2 * f6
                                f9 = f9 + f10
                                f4 = f4 * f7
                                f1 = f1 - f5
                                f3 = f3 * f7
                                f10 = f11 + f6
                                f9 = f9 + f4
                                f1 = f1 - f3
                                f3 = f8 + f13
                                f2 = f2 * f7
                                r0 = (r0 + (-1)) | 0
                                f4 = f3 - f2
                                f3 = f10 - f5
                                f2 = f9 - f13
                                f1 = f1 - f6
                                f0 = f0 + f17
                                if (r0 == 0) {
                                    break
                                } else {
                                    continue
                                }
                            }
                        } else {
                            if (r0 == 3) {
                                r3 = (-16)
                                r0 = 16
                                f0 = 0.0
                                f1 = 1.0
                                f2 = f0
                                while (true) {
                                    f3 = Float64(r3)
                                    f4 = 6.0
                                    f3 = f3 * f4
                                    f5 = 0.5
                                    f6 = 3.5
                                    f7 = 4.2000002861022949
                                    f8 = 5.5999999046325684
                                    f9 = 2.2749998569488525
                                    f10 = 0.69999998807907104
                                    f11 = 5.0750002861022949
                                    f3 = f3 * f5
                                    f5 = f2 + f0
                                    f6 = f1 + f6
                                    f7 = f1 + f7
                                    f8 = f1 + f8
                                    f9 = f1 + f9
                                    f10 = f1 + f10
                                    f11 = f1 + f11
                                    r5 = 0
                                    while (true) {
                                        heapClassInst.heap32[(g0)] = 136
                                        _Znwj(i7);
                                        r7 = commonVariable.r_g0
                                        r8 = _ZTV7RagDoll
                                        r9 = r7 >> 2
                                        r10 = Int64(heapClassInst.heap32[(r1 + 1)])
                                        r8 = (r8 + 8) | 0
                                        heapClassInst.heap32[(r9)] = Int32(r8)
                                        heapClassInst.heap32[(r9 + 1)] = Int32(r10)
                                        r8 = Int64(heapClassInst.heap32[(r2)])
                                        r9 = (r8 + 1) | 0
                                        heapClassInst.heap32[(r2)] = Int32(r9)
                                        f12 = Float64(r5)
                                        heapClassInst.heap32[(g0)] = 75
                                        f12 = f12 * f4
                                        mallocNew(i7);
                                        r9 = commonVariable.r_g0
                                        f12 = f12 + f3
                                        if (r9 != 0) {
                                            r10 = 0
                                            r11 = (r9 + 4) | 0
                                            r10 = (r10 - r11) | 0
                                            r10 = r10 & 15
                                            r10 = (r9 + r10) | 0
                                            r11 = (r10 + 4) | 0
                                            r10 = r10 >> 2
                                            heapClassInst.heap32[(r10)] = Int32(r9)
                                            r9 = r11
                                        }
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 1065353216
                                        heapClassInst.heap32[(r10 + 4)] = 1065353216
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        r11 = _ZTV14btCapsuleShape
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        r11 = (r11 + 8) | 0
                                        heapClassInst.heap32[(r10 + 11)] = 1025758986
                                        heapClassInst.heap32[(r10)] = Int32(r11)
                                        heapClassInst.heap32[(r10 + 1)] = 10
                                        heapClassInst.heap32[(r10 + 13)] = 1
                                        heapClassInst.heap32[(r10 + 7)] = 1057384039
                                        heapClassInst.heap32[(r10 + 8)] = 1051931443
                                        heapClassInst.heap32[(r10 + 9)] = 1057384039
                                        r12 = r7 >> 2
                                        heapClassInst.heap32[(r10 + 10)] = 0
                                        r10 = (r8 + 2) | 0
                                        heapClassInst.heap32[(r12 + 2)] = Int32(r9)
                                        heapClassInst.heap32[(r2)] = Int32(r10)
                                        heapClassInst.heap32[(g0)] = 75
                                        mallocNew(i7);
                                        r9 = commonVariable.r_g0
                                        if (r9 != 0) {
                                            r10 = 0
                                            r13 = (r9 + 4) | 0
                                            r10 = (r10 - r13) | 0
                                            r10 = r10 & 15
                                            r10 = (r9 + r10) | 0
                                            r13 = (r10 + 4) | 0
                                            r10 = r10 >> 2
                                            heapClassInst.heap32[(r10)] = Int32(r9)
                                            r9 = r13
                                        }
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 1065353216
                                        heapClassInst.heap32[(r10 + 4)] = 1065353216
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 11)] = 1025758986
                                        heapClassInst.heap32[(r10)] = Int32(r11)
                                        heapClassInst.heap32[(r10 + 1)] = 10
                                        heapClassInst.heap32[(r10 + 13)] = 1
                                        heapClassInst.heap32[(r10 + 7)] = 1057384039
                                        heapClassInst.heap32[(r10 + 8)] = 1056629064
                                        heapClassInst.heap32[(r10 + 9)] = 1057384039
                                        heapClassInst.heap32[(r10 + 10)] = 0
                                        r10 = (r8 + 3) | 0
                                        heapClassInst.heap32[(r12 + 3)] = Int32(r9)
                                        heapClassInst.heap32[(r2)] = Int32(r10)
                                        heapClassInst.heap32[(g0)] = 75
                                        mallocNew(i7);
                                        r9 = commonVariable.r_g0
                                        if (r9 != 0) {
                                            r10 = 0
                                            r13 = (r9 + 4) | 0
                                            r10 = (r10 - r13) | 0
                                            r10 = r10 & 15
                                            r10 = (r9 + r10) | 0
                                            r13 = (r10 + 4) | 0
                                            r10 = r10 >> 2
                                            heapClassInst.heap32[(r10)] = Int32(r9)
                                            r9 = r13
                                        }
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 1065353216
                                        heapClassInst.heap32[(r10 + 4)] = 1065353216
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 11)] = 1025758986
                                        heapClassInst.heap32[(r10)] = Int32(r11)
                                        heapClassInst.heap32[(r10 + 1)] = 10
                                        heapClassInst.heap32[(r10 + 13)] = 1
                                        heapClassInst.heap32[(r10 + 7)] = 1051931443
                                        heapClassInst.heap32[(r10 + 8)] = 1035154227
                                        heapClassInst.heap32[(r10 + 9)] = 1051931443
                                        heapClassInst.heap32[(r10 + 10)] = 0
                                        r10 = (r8 + 4) | 0
                                        heapClassInst.heap32[(r12 + 4)] = Int32(r9)
                                        heapClassInst.heap32[(r2)] = Int32(r10)
                                        heapClassInst.heap32[(g0)] = 75
                                        mallocNew(i7);
                                        r9 = commonVariable.r_g0
                                        if (r9 != 0) {
                                            r10 = 0
                                            r13 = (r9 + 4) | 0
                                            r10 = (r10 - r13) | 0
                                            r10 = r10 & 15
                                            r10 = (r9 + r10) | 0
                                            r13 = (r10 + 4) | 0
                                            r10 = r10 >> 2
                                            heapClassInst.heap32[(r10)] = Int32(r9)
                                            r9 = r13
                                        }
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 1065353216
                                        heapClassInst.heap32[(r10 + 4)] = 1065353216
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 11)] = 1025758986
                                        heapClassInst.heap32[(r10)] = Int32(r11)
                                        heapClassInst.heap32[(r10 + 1)] = 10
                                        heapClassInst.heap32[(r10 + 13)] = 1
                                        heapClassInst.heap32[(r10 + 7)] = 1048240456
                                        heapClassInst.heap32[(r10 + 8)] = 1061788057
                                        heapClassInst.heap32[(r10 + 9)] = 1048240456
                                        heapClassInst.heap32[(r10 + 10)] = 0
                                        r10 = (r8 + 5) | 0
                                        heapClassInst.heap32[(r12 + 5)] = Int32(r9)
                                        heapClassInst.heap32[(r2)] = Int32(r10)
                                        heapClassInst.heap32[(g0)] = 75
                                        mallocNew(i7);
                                        r9 = commonVariable.r_g0
                                        if (r9 != 0) {
                                            r10 = 0
                                            r13 = (r9 + 4) | 0
                                            r10 = (r10 - r13) | 0
                                            r10 = r10 & 15
                                            r10 = (r9 + r10) | 0
                                            r13 = (r10 + 4) | 0
                                            r10 = r10 >> 2
                                            heapClassInst.heap32[(r10)] = Int32(r9)
                                            r9 = r13
                                        }
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 1065353216
                                        heapClassInst.heap32[(r10 + 4)] = 1065353216
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 11)] = 1025758986
                                        heapClassInst.heap32[(r10)] = Int32(r11)
                                        heapClassInst.heap32[(r10 + 1)] = 10
                                        heapClassInst.heap32[(r10 + 13)] = 1
                                        heapClassInst.heap32[(r10 + 7)] = 1043542835
                                        heapClassInst.heap32[(r10 + 8)] = 1059439248
                                        heapClassInst.heap32[(r10 + 9)] = 1043542835
                                        heapClassInst.heap32[(r10 + 10)] = 0
                                        r10 = (r8 + 6) | 0
                                        heapClassInst.heap32[(r12 + 6)] = Int32(r9)
                                        heapClassInst.heap32[(r2)] = Int32(r10)
                                        heapClassInst.heap32[(g0)] = 75
                                        mallocNew(i7);
                                        r9 = commonVariable.r_g0
                                        if (r9 != 0) {
                                            r10 = 0
                                            r13 = (r9 + 4) | 0
                                            r10 = (r10 - r13) | 0
                                            r10 = r10 & 15
                                            r10 = (r9 + r10) | 0
                                            r13 = (r10 + 4) | 0
                                            r10 = r10 >> 2
                                            heapClassInst.heap32[(r10)] = Int32(r9)
                                            r9 = r13
                                        }
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 1065353216
                                        heapClassInst.heap32[(r10 + 4)] = 1065353216
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 11)] = 1025758986
                                        heapClassInst.heap32[(r10)] = Int32(r11)
                                        heapClassInst.heap32[(r10 + 1)] = 10
                                        heapClassInst.heap32[(r10 + 13)] = 1
                                        heapClassInst.heap32[(r10 + 7)] = 1048240456
                                        heapClassInst.heap32[(r10 + 8)] = 1061788057
                                        heapClassInst.heap32[(r10 + 9)] = 1048240456
                                        heapClassInst.heap32[(r10 + 10)] = 0
                                        r10 = (r8 + 7) | 0
                                        heapClassInst.heap32[(r12 + 7)] = Int32(r9)
                                        heapClassInst.heap32[(r2)] = Int32(r10)
                                        heapClassInst.heap32[(g0)] = 75
                                        mallocNew(i7);
                                        r9 = commonVariable.r_g0
                                        if (r9 != 0) {
                                            r10 = 0
                                            r13 = (r9 + 4) | 0
                                            r10 = (r10 - r13) | 0
                                            r10 = r10 & 15
                                            r10 = (r9 + r10) | 0
                                            r13 = (r10 + 4) | 0
                                            r10 = r10 >> 2
                                            heapClassInst.heap32[(r10)] = Int32(r9)
                                            r9 = r13
                                        }
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 1065353216
                                        heapClassInst.heap32[(r10 + 4)] = 1065353216
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 11)] = 1025758986
                                        heapClassInst.heap32[(r10)] = Int32(r11)
                                        heapClassInst.heap32[(r10 + 1)] = 10
                                        heapClassInst.heap32[(r10 + 13)] = 1
                                        heapClassInst.heap32[(r10 + 7)] = 1043542835
                                        heapClassInst.heap32[(r10 + 8)] = 1059439248
                                        heapClassInst.heap32[(r10 + 9)] = 1043542835
                                        heapClassInst.heap32[(r10 + 10)] = 0
                                        r10 = (r8 + 8) | 0
                                        heapClassInst.heap32[(r12 + 8)] = Int32(r9)
                                        heapClassInst.heap32[(r2)] = Int32(r10)
                                        heapClassInst.heap32[(g0)] = 75
                                        mallocNew(i7);
                                        r9 = commonVariable.r_g0
                                        if (r9 != 0) {
                                            r10 = 0
                                            r13 = (r9 + 4) | 0
                                            r10 = (r10 - r13) | 0
                                            r10 = r10 & 15
                                            r10 = (r9 + r10) | 0
                                            r13 = (r10 + 4) | 0
                                            r10 = r10 >> 2
                                            heapClassInst.heap32[(r10)] = Int32(r9)
                                            r9 = r13
                                        }
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 1065353216
                                        heapClassInst.heap32[(r10 + 4)] = 1065353216
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 11)] = 1025758986
                                        heapClassInst.heap32[(r10)] = Int32(r11)
                                        heapClassInst.heap32[(r10 + 1)] = 10
                                        heapClassInst.heap32[(r10 + 13)] = 1
                                        heapClassInst.heap32[(r10 + 7)] = 1043542835
                                        heapClassInst.heap32[(r10 + 8)] = 1058264843
                                        heapClassInst.heap32[(r10 + 9)] = 1043542835
                                        heapClassInst.heap32[(r10 + 10)] = 0
                                        r10 = (r8 + 9) | 0
                                        heapClassInst.heap32[(r12 + 9)] = Int32(r9)
                                        heapClassInst.heap32[(r2)] = Int32(r10)
                                        heapClassInst.heap32[(g0)] = 75
                                        mallocNew(i7);
                                        r9 = commonVariable.r_g0
                                        if (r9 != 0) {
                                            r10 = 0
                                            r13 = (r9 + 4) | 0
                                            r10 = (r10 - r13) | 0
                                            r10 = r10 & 15
                                            r10 = (r9 + r10) | 0
                                            r13 = (r10 + 4) | 0
                                            r10 = r10 >> 2
                                            heapClassInst.heap32[(r10)] = Int32(r9)
                                            r9 = r13
                                        }
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 1065353216
                                        heapClassInst.heap32[(r10 + 4)] = 1065353216
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 11)] = 1025758986
                                        heapClassInst.heap32[(r10)] = Int32(r11)
                                        heapClassInst.heap32[(r10 + 1)] = 10
                                        heapClassInst.heap32[(r10 + 13)] = 1
                                        heapClassInst.heap32[(r10 + 7)] = 1041194025
                                        heapClassInst.heap32[(r10 + 8)] = 1054867456
                                        heapClassInst.heap32[(r10 + 9)] = 1041194025
                                        heapClassInst.heap32[(r10 + 10)] = 0
                                        r10 = (r8 + 10) | 0
                                        heapClassInst.heap32[(r12 + 10)] = Int32(r9)
                                        heapClassInst.heap32[(r2)] = Int32(r10)
                                        heapClassInst.heap32[(g0)] = 75
                                        mallocNew(i7);
                                        r9 = commonVariable.r_g0
                                        if (r9 != 0) {
                                            r10 = 0
                                            r13 = (r9 + 4) | 0
                                            r10 = (r10 - r13) | 0
                                            r10 = r10 & 15
                                            r10 = (r9 + r10) | 0
                                            r13 = (r10 + 4) | 0
                                            r10 = r10 >> 2
                                            heapClassInst.heap32[(r10)] = Int32(r9)
                                            r9 = r13
                                        }
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 1065353216
                                        heapClassInst.heap32[(r10 + 4)] = 1065353216
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 11)] = 1025758986
                                        heapClassInst.heap32[(r10)] = Int32(r11)
                                        heapClassInst.heap32[(r10 + 1)] = 10
                                        heapClassInst.heap32[(r10 + 13)] = 1
                                        heapClassInst.heap32[(r10 + 7)] = 1043542835
                                        heapClassInst.heap32[(r10 + 8)] = 1058264843
                                        heapClassInst.heap32[(r10 + 9)] = 1043542835
                                        heapClassInst.heap32[(r10 + 10)] = 0
                                        r8 = (r8 + 11) | 0
                                        heapClassInst.heap32[(r12 + 11)] = Int32(r9)
                                        heapClassInst.heap32[(r2)] = Int32(r8)
                                        heapClassInst.heap32[(g0)] = 75
                                        mallocNew(i7);
                                        r8 = commonVariable.r_g0
                                        if (r8 != 0) {
                                            r9 = 0
                                            r10 = (r8 + 4) | 0
                                            r9 = (r9 - r10) | 0
                                            r9 = r9 & 15
                                            r9 = (r8 + r9) | 0
                                            r10 = (r9 + 4) | 0
                                            r9 = r9 >> 2
                                            heapClassInst.heap32[(r9)] = Int32(r8)
                                            r8 = r10
                                        }
                                        r9 = r8 >> 2
                                        heapClassInst.heap32[(r9 + 2)] = 0
                                        heapClassInst.heap32[(r9 + 3)] = 1065353216
                                        heapClassInst.heap32[(r9 + 4)] = 1065353216
                                        heapClassInst.heap32[(r9 + 5)] = 1065353216
                                        heapClassInst.heap32[(r9 + 6)] = 0
                                        heapClassInst.heap32[(r9 + 11)] = 1025758986
                                        heapClassInst.heap32[(r9)] = Int32(r11)
                                        heapClassInst.heap32[(r9 + 1)] = 10
                                        heapClassInst.heap32[(r9 + 13)] = 1
                                        heapClassInst.heap32[(r9 + 7)] = 1041194025
                                        heapClassInst.heap32[(r9 + 8)] = 1054867456
                                        heapClassInst.heap32[(r9 + 9)] = 1041194025
                                        heapClassInst.heap32[(r9 + 10)] = 0
                                        heapClassInst.heap32[(r12 + 12)] = Int32(r8)
                                        r8 = Int64(heapClassInst.heap32[(r12 + 2)])
                                        r9 = sp + (-880)
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(fp + (-220))] = 1065353216
                                        heapClassInst.heap32[(r10 + 1)] = 0
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 0
                                        heapClassInst.heap32[(r10 + 4)] = 0
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 7)] = 0
                                        heapClassInst.heap32[(r10 + 8)] = 0
                                        heapClassInst.heap32[(r10 + 9)] = 0
                                        heapClassInst.heap32[(r10 + 10)] = 1065353216
                                        f13 = 0.0
                                        f13 = f12 + f13
                                        heapClassInst.heap32[(r10 + 11)] = 0
                                        heapClassInst.heapFloat[(r10 + 12)] = Float32(f13)
                                        heapClassInst.heapFloat[(r10 + 13)] = Float32(f6)
                                        heapClassInst.heapFloat[(r10 + 14)] = Float32(f5)
                                        heapClassInst.heap32[(r10 + 15)] = 0
                                        heapClassInst.heap32[(g0)] = Int32(r7)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r9)
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r8)
                                        _ZN7RagDoll20localCreateRigidBodyEfRK11btTransformP16btCollisionShape(i7);
                                        heapClassInst.heap32[(r12 + 13)] = Int32(commonVariable.r_g0)
                                        r8 = Int64(heapClassInst.heap32[(r12 + 3)])
                                        r9 = sp + (-816)
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(fp + (-204))] = 1065353216
                                        heapClassInst.heap32[(r10 + 1)] = 0
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 0
                                        heapClassInst.heap32[(r10 + 4)] = 0
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 7)] = 0
                                        heapClassInst.heap32[(r10 + 8)] = 0
                                        heapClassInst.heap32[(r10 + 9)] = 0
                                        heapClassInst.heap32[(r10 + 10)] = 1065353216
                                        heapClassInst.heap32[(r10 + 11)] = 0
                                        heapClassInst.heapFloat[(r10 + 12)] = Float32(f13)
                                        heapClassInst.heapFloat[(r10 + 13)] = Float32(f7)
                                        heapClassInst.heapFloat[(r10 + 14)] = Float32(f5)
                                        heapClassInst.heap32[(r10 + 15)] = 0
                                        heapClassInst.heap32[(g0)] = Int32(r7)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r9)
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r8)
                                        _ZN7RagDoll20localCreateRigidBodyEfRK11btTransformP16btCollisionShape(i7);
                                        heapClassInst.heap32[(r12 + 14)] = Int32(commonVariable.r_g0)
                                        r8 = Int64(heapClassInst.heap32[(r12 + 4)])
                                        r9 = sp + (-752)
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(fp + (-188))] = 1065353216
                                        heapClassInst.heap32[(r10 + 1)] = 0
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 0
                                        heapClassInst.heap32[(r10 + 4)] = 0
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 7)] = 0
                                        heapClassInst.heap32[(r10 + 8)] = 0
                                        heapClassInst.heap32[(r10 + 9)] = 0
                                        heapClassInst.heap32[(r10 + 10)] = 1065353216
                                        heapClassInst.heap32[(r10 + 11)] = 0
                                        heapClassInst.heapFloat[(r10 + 12)] = Float32(f13)
                                        heapClassInst.heapFloat[(r10 + 13)] = Float32(f8)
                                        heapClassInst.heapFloat[(r10 + 14)] = Float32(f5)
                                        heapClassInst.heap32[(r10 + 15)] = 0
                                        heapClassInst.heap32[(g0)] = Int32(r7)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r9)
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r8)
                                        _ZN7RagDoll20localCreateRigidBodyEfRK11btTransformP16btCollisionShape(i7);
                                        heapClassInst.heap32[(r12 + 15)] = Int32(commonVariable.r_g0)
                                        r8 = Int64(heapClassInst.heap32[(r12 + 5)])
                                        r9 = sp + (-688)
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(fp + (-172))] = 1065353216
                                        heapClassInst.heap32[(r10 + 1)] = 0
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 0
                                        heapClassInst.heap32[(r10 + 4)] = 0
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 7)] = 0
                                        heapClassInst.heap32[(r10 + 8)] = 0
                                        heapClassInst.heap32[(r10 + 9)] = 0
                                        f13 = -0.62999999523162842
                                        heapClassInst.heap32[(r10 + 10)] = 1065353216
                                        f13 = f12 + f13
                                        heapClassInst.heap32[(r10 + 11)] = 0
                                        heapClassInst.heapFloat[(r10 + 12)] = Float32(f13)
                                        heapClassInst.heapFloat[(r10 + 13)] = Float32(f9)
                                        heapClassInst.heapFloat[(r10 + 14)] = Float32(f5)
                                        heapClassInst.heap32[(r10 + 15)] = 0
                                        heapClassInst.heap32[(g0)] = Int32(r7)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r9)
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r8)
                                        _ZN7RagDoll20localCreateRigidBodyEfRK11btTransformP16btCollisionShape(i7);
                                        heapClassInst.heap32[(r12 + 16)] = Int32(commonVariable.r_g0)
                                        r8 = Int64(heapClassInst.heap32[(r12 + 6)])
                                        r9 = sp + (-624)
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(fp + (-156))] = 1065353216
                                        heapClassInst.heap32[(r10 + 1)] = 0
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 0
                                        heapClassInst.heap32[(r10 + 4)] = 0
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 7)] = 0
                                        heapClassInst.heap32[(r10 + 8)] = 0
                                        heapClassInst.heap32[(r10 + 9)] = 0
                                        heapClassInst.heap32[(r10 + 10)] = 1065353216
                                        heapClassInst.heap32[(r10 + 11)] = 0
                                        heapClassInst.heapFloat[(r10 + 12)] = Float32(f13)
                                        heapClassInst.heapFloat[(r10 + 13)] = Float32(f10)
                                        heapClassInst.heapFloat[(r10 + 14)] = Float32(f5)
                                        heapClassInst.heap32[(r10 + 15)] = 0
                                        heapClassInst.heap32[(g0)] = Int32(r7)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r9)
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r8)
                                        _ZN7RagDoll20localCreateRigidBodyEfRK11btTransformP16btCollisionShape(i7);
                                        heapClassInst.heap32[(r12 + 17)] = Int32(commonVariable.r_g0)
                                        r8 = Int64(heapClassInst.heap32[(r12 + 7)])
                                        r9 = sp + (-560)
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(fp + (-140))] = 1065353216
                                        heapClassInst.heap32[(r10 + 1)] = 0
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 0
                                        heapClassInst.heap32[(r10 + 4)] = 0
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 7)] = 0
                                        heapClassInst.heap32[(r10 + 8)] = 0
                                        heapClassInst.heap32[(r10 + 9)] = 0
                                        f13 = 0.62999999523162842
                                        heapClassInst.heap32[(r10 + 10)] = 1065353216
                                        f13 = f12 + f13
                                        heapClassInst.heap32[(r10 + 11)] = 0
                                        heapClassInst.heapFloat[(r10 + 12)] = Float32(f13)
                                        heapClassInst.heapFloat[(r10 + 13)] = Float32(f9)
                                        heapClassInst.heapFloat[(r10 + 14)] = Float32(f5)
                                        heapClassInst.heap32[(r10 + 15)] = 0
                                        heapClassInst.heap32[(g0)] = Int32(r7)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r9)
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r8)
                                        _ZN7RagDoll20localCreateRigidBodyEfRK11btTransformP16btCollisionShape(i7);
                                        heapClassInst.heap32[(r12 + 18)] = Int32(commonVariable.r_g0)
                                        r8 = Int64(heapClassInst.heap32[(r12 + 8)])
                                        r9 = sp + (-496)
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(fp + (-124))] = 1065353216
                                        heapClassInst.heap32[(r10 + 1)] = 0
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 0
                                        heapClassInst.heap32[(r10 + 4)] = 0
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 7)] = 0
                                        heapClassInst.heap32[(r10 + 8)] = 0
                                        heapClassInst.heap32[(r10 + 9)] = 0
                                        heapClassInst.heap32[(r10 + 10)] = 1065353216
                                        heapClassInst.heap32[(r10 + 11)] = 0
                                        heapClassInst.heapFloat[(r10 + 12)] = Float32(f13)
                                        heapClassInst.heapFloat[(r10 + 13)] = Float32(f10)
                                        heapClassInst.heapFloat[(r10 + 14)] = Float32(f5)
                                        heapClassInst.heap32[(r10 + 15)] = 0
                                        heapClassInst.heap32[(g0)] = Int32(r7)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r9)
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r8)
                                        _ZN7RagDoll20localCreateRigidBodyEfRK11btTransformP16btCollisionShape(i7);
                                        heapClassInst.heap32[(r12 + 19)] = Int32(commonVariable.r_g0)
                                        r8 = Int64(heapClassInst.heap32[(r12 + 9)])
                                        r9 = sp + (-432)
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(fp + (-108))] = (-1287930578)
                                        heapClassInst.heap32[(r10 + 1)] = (-1082130432)
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 0
                                        heapClassInst.heap32[(r10 + 4)] = 1065353216
                                        heapClassInst.heap32[(r10 + 5)] = (-1287930578)
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 7)] = 0
                                        heapClassInst.heap32[(r10 + 8)] = 0
                                        heapClassInst.heap32[(r10 + 9)] = 0
                                        f13 = -1.2250000238418579
                                        heapClassInst.heap32[(r10 + 10)] = 1065353216
                                        f13 = f12 + f13
                                        heapClassInst.heap32[(r10 + 11)] = 0
                                        heapClassInst.heapFloat[(r10 + 12)] = Float32(f13)
                                        heapClassInst.heapFloat[(r10 + 13)] = Float32(f11)
                                        heapClassInst.heapFloat[(r10 + 14)] = Float32(f5)
                                        heapClassInst.heap32[(r10 + 15)] = 0
                                        heapClassInst.heap32[(g0)] = Int32(r7)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r9)
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r8)
                                        _ZN7RagDoll20localCreateRigidBodyEfRK11btTransformP16btCollisionShape(i7);
                                        heapClassInst.heap32[(r12 + 20)] = Int32(commonVariable.r_g0)
                                        r8 = Int64(heapClassInst.heap32[(r12 + 10)])
                                        r9 = sp + (-368)
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(fp + (-92))] = (-1287930578)
                                        heapClassInst.heap32[(r10 + 1)] = (-1082130432)
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 0
                                        heapClassInst.heap32[(r10 + 4)] = 1065353216
                                        heapClassInst.heap32[(r10 + 5)] = (-1287930578)
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 7)] = 0
                                        heapClassInst.heap32[(r10 + 8)] = 0
                                        heapClassInst.heap32[(r10 + 9)] = 0
                                        f13 = -2.4500000476837158
                                        heapClassInst.heap32[(r10 + 10)] = 1065353216
                                        f13 = f12 + f13
                                        heapClassInst.heap32[(r10 + 11)] = 0
                                        heapClassInst.heapFloat[(r10 + 12)] = Float32(f13)
                                        heapClassInst.heapFloat[(r10 + 13)] = Float32(f11)
                                        heapClassInst.heapFloat[(r10 + 14)] = Float32(f5)
                                        heapClassInst.heap32[(r10 + 15)] = 0
                                        heapClassInst.heap32[(g0)] = Int32(r7)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r9)
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r8)
                                        _ZN7RagDoll20localCreateRigidBodyEfRK11btTransformP16btCollisionShape(i7);
                                        heapClassInst.heap32[(r12 + 21)] = Int32(commonVariable.r_g0)
                                        r8 = Int64(heapClassInst.heap32[(r12 + 11)])
                                        r9 = sp + (-304)
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(fp + (-76))] = (-1287930578)
                                        heapClassInst.heap32[(r10 + 1)] = 1065353216
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 0
                                        heapClassInst.heap32[(r10 + 4)] = (-1082130432)
                                        heapClassInst.heap32[(r10 + 5)] = (-1287930578)
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 7)] = 0
                                        heapClassInst.heap32[(r10 + 8)] = (-2147483648)
                                        heapClassInst.heap32[(r10 + 9)] = 0
                                        f13 = 1.2250000238418579
                                        heapClassInst.heap32[(r10 + 10)] = 1065353216
                                        f13 = f12 + f13
                                        heapClassInst.heap32[(r10 + 11)] = 0
                                        heapClassInst.heapFloat[(r10 + 12)] = Float32(f13)
                                        heapClassInst.heapFloat[(r10 + 13)] = Float32(f11)
                                        heapClassInst.heapFloat[(r10 + 14)] = Float32(f5)
                                        heapClassInst.heap32[(r10 + 15)] = 0
                                        heapClassInst.heap32[(g0)] = Int32(r7)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r9)
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r8)
                                        _ZN7RagDoll20localCreateRigidBodyEfRK11btTransformP16btCollisionShape(i7);
                                        heapClassInst.heap32[(r12 + 22)] = Int32(commonVariable.r_g0)
                                        r8 = Int64(heapClassInst.heap32[(r12 + 12)])
                                        r9 = sp + (-240)
                                        r10 = r9 >> 2
                                        heapClassInst.heap32[(fp + (-60))] = (-1287930578)
                                        heapClassInst.heap32[(r10 + 1)] = 1065353216
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 0
                                        heapClassInst.heap32[(r10 + 4)] = (-1082130432)
                                        heapClassInst.heap32[(r10 + 5)] = (-1287930578)
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(r10 + 7)] = 0
                                        heapClassInst.heap32[(r10 + 8)] = (-2147483648)
                                        heapClassInst.heap32[(r10 + 9)] = 0
                                        f13 = 2.4500000476837158
                                        heapClassInst.heap32[(r10 + 10)] = 1065353216
                                        f12 = f12 + f13
                                        heapClassInst.heap32[(r10 + 11)] = 0
                                        heapClassInst.heapFloat[(r10 + 12)] = Float32(f12)
                                        heapClassInst.heapFloat[(r10 + 13)] = Float32(f11)
                                        heapClassInst.heapFloat[(r10 + 14)] = Float32(f5)
                                        heapClassInst.heap32[(r10 + 15)] = 0
                                        heapClassInst.heap32[(g0)] = Int32(r7)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r9)
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r8)
                                        _ZN7RagDoll20localCreateRigidBodyEfRK11btTransformP16btCollisionShape(i7);
                                        r9 = 0
                                        heapClassInst.heap32[(r12 + 23)] = Int32(commonVariable.r_g0)
                                        while (true) {
                                            r8 = r9 << 2
                                            r8 = (r7 - r8) | 0
                                            r8 = r8 >> 2
                                            r10 = Int64(heapClassInst.heap32[(r8 + 13)])
                                            r10 = r10 >> 2
                                            heapClassInst.heap32[(r10 + 109)] = 1028443341
                                            heapClassInst.heap32[(r10 + 110)] = 1062836634
                                            r10 = Int64(heapClassInst.heap32[(r8 + 13)])
                                            r10 = r10 >> 2
                                            heapClassInst.heap32[(r10 + 55)] = 1061997773
                                            r8 = Int64(heapClassInst.heap32[(r8 + 13)])
                                            r8 = r8 >> 2
                                            r9 = (r9 + (-1)) | 0
                                            heapClassInst.heap32[(r8 + 116)] = 1070386381
                                            heapClassInst.heap32[(r8 + 117)] = 1075838976
                                            if (!(r9 != (-11))) {
                                                break
                                            }
                                        }
                                        heapClassInst.heap32[(g0)] = 748
                                        _Znwj(i7);
                                        r8 = commonVariable.r_g0
                                        r9 = Int64(heapClassInst.heap32[(r12 + 14)])
                                        r10 = Int64(heapClassInst.heap32[(r12 + 13)])
                                        r11 = r8 >> 2
                                        heapClassInst.heap32[(r11 + 1)] = 4
                                        heapClassInst.heap32[(r11 + 2)] = (-1)
                                        r13 = 0
                                        heapClassInst.heap32[(r11 + 3)] = (-1)
                                        heapClassInst.heap8[r8 + 16] = Int8(r13)
                                        heapClassInst.heap32[(r11 + 5)] = Int32(r10)
                                        heapClassInst.heap32[(r11 + 6)] = Int32(r9)
                                        r9 = _ZTV17btHingeConstraint
                                        heapClassInst.heap32[(r11 + 7)] = 0
                                        r9 = (r9 + 8) | 0
                                        heapClassInst.heap32[(r11 + 8)] = 1050253722
                                        heapClassInst.heap32[(r11)] = Int32(r9)
                                        heapClassInst.heap32[(r11 + 135)] = (-1287930578)
                                        heapClassInst.heap32[(r11 + 136)] = 0
                                        heapClassInst.heap32[(r11 + 137)] = 1065353216
                                        heapClassInst.heap32[(r11 + 138)] = 0
                                        heapClassInst.heap32[(r11 + 139)] = (-2147483648)
                                        heapClassInst.heap32[(r11 + 140)] = 1065353216
                                        heapClassInst.heap32[(r11 + 141)] = 0
                                        heapClassInst.heap32[(r11 + 142)] = 0
                                        heapClassInst.heap32[(r11 + 143)] = (-1082130432)
                                        heapClassInst.heap32[(r11 + 144)] = (-2147483648)
                                        heapClassInst.heap32[(r11 + 145)] = (-1287930578)
                                        heapClassInst.heap32[(r11 + 146)] = 0
                                        heapClassInst.heap32[(r11 + 147)] = 0
                                        heapClassInst.heap32[(r11 + 148)] = 1057384039
                                        heapClassInst.heap32[(r11 + 149)] = 0
                                        heapClassInst.heap32[(r11 + 150)] = 0
                                        heapClassInst.heap32[(r11 + 151)] = (-1287930578)
                                        heapClassInst.heap32[(r11 + 152)] = 0
                                        heapClassInst.heap32[(r11 + 153)] = 1065353216
                                        heapClassInst.heap32[(r11 + 154)] = 0
                                        heapClassInst.heap32[(r11 + 155)] = (-2147483648)
                                        heapClassInst.heap32[(r11 + 156)] = 1065353216
                                        heapClassInst.heap32[(r11 + 157)] = 0
                                        heapClassInst.heap32[(r11 + 158)] = 0
                                        heapClassInst.heap32[(r11 + 159)] = (-1082130432)
                                        heapClassInst.heap32[(r11 + 160)] = (-2147483648)
                                        heapClassInst.heap32[(r11 + 161)] = (-1287930578)
                                        heapClassInst.heap32[(r11 + 162)] = 0
                                        heapClassInst.heap32[(r11 + 163)] = 0
                                        heapClassInst.heap32[(r11 + 164)] = (-1090099609)
                                        heapClassInst.heap32[(r11 + 165)] = 0
                                        heapClassInst.heap32[(r11 + 166)] = 0
                                        heapClassInst.heap8[r8 + 720] = Int8(r13)
                                        heapClassInst.heap8[r8 + 721] = Int8(r13)
                                        heapClassInst.heap8[r8 + 723] = Int8(r13)
                                        heapClassInst.heap8[r8 + 724] = Int8(r4)
                                        heapClassInst.heap8[r8 + 725] = Int8(r13)
                                        heapClassInst.heap32[(r11 + 183)] = 0
                                        heapClassInst.heap32[(r11 + 172)] = 1065353216
                                        heapClassInst.heap32[(r11 + 173)] = (-1082130432)
                                        heapClassInst.heap32[(r11 + 170)] = 1050253722
                                        heapClassInst.heap32[(r11 + 171)] = 1065353216
                                        heapClassInst.heap32[(r11 + 169)] = 1063675494
                                        heapClassInst.heap8[r8 + 722] = Int8(r13)
                                        heapClassInst.heap32[(r11 + 179)] = 1065353216
                                        heapClassInst.heap32[(g0)] = (-1085730853)
                                        heapClassInst.heap32[(g0 + 1)] = 1086918619
                                        fmodf(i7);
                                        f12 = commonVariable.f_g0
                                        f13 = -3.1415927410125732
                                        if (f12 >= f13) {
                                            f14 = 3.1415927410125732
                                            if (f12 > f14) {
                                                f14 = -6.2831854820251465
                                                f12 = f12 + f14
                                            }
                                        } else {
                                            f14 = 6.2831854820251465
                                            f12 = f12 + f14
                                        }
                                        r10 = r8 >> 2
                                        heapClassInst.heapFloat[(r10 + 172)] = Float32(f12)
                                        heapClassInst.heap32[(g0)] = 1070141403
                                        heapClassInst.heap32[(g0 + 1)] = 1086918619
                                        fmodf(i7);
                                        f12 = commonVariable.f_g0
                                        if (f12 >= f13) {
                                            f14 = 3.1415927410125732
                                            if (f12 > f14) {
                                                f14 = -6.2831854820251465
                                                f12 = f12 + f14
                                            }
                                        } else {
                                            f14 = 6.2831854820251465
                                            f12 = f12 + f14
                                        }
                                        heapClassInst.heapFloat[(r10 + 173)] = Float32(f12)
                                        heapClassInst.heap32[(r10 + 169)] = 1063675494
                                        heapClassInst.heap32[(r10 + 170)] = 1050253722
                                        heapClassInst.heap32[(r10 + 171)] = 1065353216
                                        heapClassInst.heap32[(r12 + 24)] = Int32(r8)
                                        r10 = Int64(heapClassInst.heap32[(r12 + 1)])
                                        r11 = r10 >> 2
                                        r11 = Int64(heapClassInst.heap32[(r11)])
                                        r11 = r11 >> 2
                                        r11 = Int64(heapClassInst.heap32[(r11 + 13)])
                                        heapClassInst.heap32[(g0)] = Int32(r10)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r8)
                                        heapClassInst.heap32[(g0 + 2)] = 1
                                        __FUNCTION_TABLE__[(r11) >> 2](i7);
                                        heapClassInst.heap32[(g0)] = 596
                                        _Znwj(i7);
                                        r10 = Int64(heapClassInst.heap32[(r12 + 15)])
                                        r11 = Int64(heapClassInst.heap32[(r12 + 14)])
                                        r14 = commonVariable.r_g0 >> 2
                                        heapClassInst.heap32[(r14 + 1)] = 5
                                        heapClassInst.heap32[(r14 + 2)] = (-1)
                                        heapClassInst.heap32[(r14 + 3)] = (-1)
                                        heapClassInst.heap8[commonVariable.r_g0 + 16] = Int8(r13)
                                        heapClassInst.heap32[(r14 + 5)] = Int32(r11)
                                        heapClassInst.heap32[(r14 + 6)] = Int32(r10)
                                        heapClassInst.heap32[(r14 + 7)] = 0
                                        r10 = _ZTV21btConeTwistConstraint
                                        heapClassInst.heap32[(r14 + 8)] = 1050253722
                                        r10 = (r10 + 8) | 0
                                        heapClassInst.heap32[(r14)] = Int32(r10)
                                        heapClassInst.heap32[(r14 + 72)] = (-1287930578)
                                        heapClassInst.heap32[(r14 + 73)] = (-1082130432)
                                        heapClassInst.heap32[(r14 + 74)] = 0
                                        heapClassInst.heap32[(r14 + 75)] = 0
                                        heapClassInst.heap32[(r14 + 76)] = 1065353216
                                        heapClassInst.heap32[(r14 + 77)] = (-1287930578)
                                        heapClassInst.heap32[(r14 + 78)] = 0
                                        heapClassInst.heap32[(r14 + 79)] = 0
                                        heapClassInst.heap32[(r14 + 80)] = (-2147483648)
                                        heapClassInst.heap32[(r14 + 81)] = 0
                                        heapClassInst.heap32[(r14 + 82)] = 1065353216
                                        heapClassInst.heap32[(r14 + 83)] = 0
                                        heapClassInst.heap32[(r14 + 84)] = 0
                                        heapClassInst.heap32[(r14 + 85)] = 1065772647
                                        heapClassInst.heap32[(r14 + 86)] = 0
                                        heapClassInst.heap32[(r14 + 87)] = 0
                                        heapClassInst.heap32[(r14 + 88)] = (-1287930578)
                                        heapClassInst.heap32[(r14 + 89)] = (-1082130432)
                                        heapClassInst.heap32[(r14 + 90)] = 0
                                        heapClassInst.heap32[(r14 + 91)] = 0
                                        heapClassInst.heap32[(r14 + 92)] = 1065353216
                                        heapClassInst.heap32[(r14 + 93)] = (-1287930578)
                                        heapClassInst.heap32[(r14 + 94)] = 0
                                        heapClassInst.heap32[(r14 + 95)] = 0
                                        heapClassInst.heap32[(r14 + 96)] = (-2147483648)
                                        heapClassInst.heap32[(r14 + 97)] = 0
                                        heapClassInst.heap32[(r14 + 98)] = 1065353216
                                        heapClassInst.heap32[(r14 + 99)] = 0
                                        heapClassInst.heap32[(r14 + 100)] = 0
                                        heapClassInst.heap32[(r14 + 101)] = (-1090854584)
                                        heapClassInst.heap32[(r14 + 102)] = 0
                                        heapClassInst.heap32[(r14 + 103)] = 0
                                        heapClassInst.heap8[commonVariable.r_g0 + 540] = Int8(r13)
                                        heapClassInst.heap32[(r14 + 128)] = 0
                                        heapClassInst.heap32[(r14 + 140)] = (-1082130432)
                                        heapClassInst.heap32[(r14 + 107)] = 1008981770
                                        heapClassInst.heap32[(r14 + 111)] = 1028443341
                                        heapClassInst.heap32[(r14 + 145)] = 0
                                        heapClassInst.heap32[(r14 + 146)] = 0
                                        heapClassInst.heap32[(r14 + 147)] = 1060320051
                                        heapClassInst.heap32[(r14 + 148)] = 0
                                        heapClassInst.heap32[(r14 + 108)] = 1061752795
                                        heapClassInst.heap32[(r14 + 109)] = 1061752795
                                        heapClassInst.heap32[(r14 + 110)] = 1070141403
                                        heapClassInst.heap32[(r14 + 104)] = 1065353216
                                        heapClassInst.heap32[(r14 + 105)] = 1050253722
                                        heapClassInst.heap32[(r14 + 106)] = 1065353216
                                        heapClassInst.heap32[(r12 + 25)] = Int32(commonVariable.r_g0)
                                        r11 = Int64(heapClassInst.heap32[(r12 + 1)])
                                        r14 = r11 >> 2
                                        r14 = Int64(heapClassInst.heap32[(r14)])
                                        r14 = r14 >> 2
                                        r14 = Int64(heapClassInst.heap32[(r14 + 13)])
                                        heapClassInst.heap32[(g0)] = Int32(r11)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(commonVariable.r_g0)
                                        heapClassInst.heap32[(g0 + 2)] = 1
                                        __FUNCTION_TABLE__[(r14) >> 2](i7);
                                        heapClassInst.heap32[(g0)] = 596
                                        _Znwj(i7);
                                        r11 = Int64(heapClassInst.heap32[(r12 + 16)])
                                        r14 = Int64(heapClassInst.heap32[(r12 + 13)])
                                        r15 = commonVariable.r_g0 >> 2
                                        heapClassInst.heap32[(r15 + 1)] = 5
                                        heapClassInst.heap32[(r15 + 2)] = (-1)
                                        heapClassInst.heap32[(r15 + 3)] = (-1)
                                        heapClassInst.heap8[commonVariable.r_g0 + 16] = Int8(r13)
                                        heapClassInst.heap32[(r15 + 5)] = Int32(r14)
                                        heapClassInst.heap32[(r15 + 6)] = Int32(r11)
                                        heapClassInst.heap32[(r15 + 7)] = 0
                                        heapClassInst.heap32[(r15 + 8)] = 1050253722
                                        heapClassInst.heap32[(r15)] = Int32(r10)
                                        heapClassInst.heap32[(r15 + 72)] = (-1087044364)
                                        heapClassInst.heap32[(r15 + 73)] = (-1087044366)
                                        heapClassInst.heap32[(r15 + 74)] = 0
                                        heapClassInst.heap32[(r15 + 75)] = 0
                                        heapClassInst.heap32[(r15 + 76)] = 1060439282
                                        heapClassInst.heap32[(r15 + 77)] = (-1087044364)
                                        heapClassInst.heap32[(r15 + 78)] = 0
                                        heapClassInst.heap32[(r15 + 79)] = 0
                                        heapClassInst.heap32[(r15 + 80)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 81)] = 0
                                        heapClassInst.heap32[(r15 + 82)] = 1065353216
                                        heapClassInst.heap32[(r15 + 83)] = 0
                                        heapClassInst.heap32[(r15 + 84)] = (-1088338002)
                                        heapClassInst.heap32[(r15 + 85)] = (-1095552205)
                                        heapClassInst.heap32[(r15 + 86)] = 0
                                        heapClassInst.heap32[(r15 + 87)] = 0
                                        heapClassInst.heap32[(r15 + 88)] = (-1087044364)
                                        heapClassInst.heap32[(r15 + 89)] = (-1087044366)
                                        heapClassInst.heap32[(r15 + 90)] = 0
                                        heapClassInst.heap32[(r15 + 91)] = 0
                                        heapClassInst.heap32[(r15 + 92)] = 1060439282
                                        heapClassInst.heap32[(r15 + 93)] = (-1087044364)
                                        heapClassInst.heap32[(r15 + 94)] = 0
                                        heapClassInst.heap32[(r15 + 95)] = 0
                                        heapClassInst.heap32[(r15 + 96)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 97)] = 0
                                        heapClassInst.heap32[(r15 + 98)] = 1065353216
                                        heapClassInst.heap32[(r15 + 99)] = 0
                                        heapClassInst.heap32[(r15 + 100)] = 0
                                        heapClassInst.heap32[(r15 + 101)] = 1061788057
                                        heapClassInst.heap32[(r15 + 102)] = 0
                                        heapClassInst.heap32[(r15 + 103)] = 0
                                        heapClassInst.heap8[commonVariable.r_g0 + 540] = Int8(r13)
                                        heapClassInst.heap32[(r15 + 128)] = 0
                                        heapClassInst.heap32[(r15 + 140)] = (-1082130432)
                                        heapClassInst.heap32[(r15 + 107)] = 1008981770
                                        heapClassInst.heap32[(r15 + 111)] = 1028443341
                                        heapClassInst.heap32[(r15 + 145)] = 0
                                        heapClassInst.heap32[(r15 + 146)] = 0
                                        heapClassInst.heap32[(r15 + 147)] = 1060320051
                                        heapClassInst.heap32[(r15 + 148)] = 0
                                        heapClassInst.heap32[(r15 + 108)] = 1061752795
                                        heapClassInst.heap32[(r15 + 109)] = 1061752795
                                        heapClassInst.heap32[(r15 + 110)] = 0
                                        heapClassInst.heap32[(r15 + 104)] = 1065353216
                                        heapClassInst.heap32[(r15 + 105)] = 1050253722
                                        heapClassInst.heap32[(r15 + 106)] = 1065353216
                                        heapClassInst.heap32[(r12 + 26)] = Int32(commonVariable.r_g0)
                                        r11 = Int64(heapClassInst.heap32[(r12 + 1)])
                                        r14 = r11 >> 2
                                        r14 = Int64(heapClassInst.heap32[(r14)])
                                        r14 = r14 >> 2
                                        r14 = Int64(heapClassInst.heap32[(r14 + 13)])
                                        heapClassInst.heap32[(g0)] = Int32(r11)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(commonVariable.r_g0)
                                        heapClassInst.heap32[(g0 + 2)] = 1
                                        __FUNCTION_TABLE__[(r14) >> 2](i7);
                                        heapClassInst.heap32[(g0)] = 748
                                        _Znwj(i7);
                                        r8 = commonVariable.r_g0
                                        r11 = Int64(heapClassInst.heap32[(r12 + 17)])
                                        r14 = Int64(heapClassInst.heap32[(r12 + 16)])
                                        r15 = r8 >> 2
                                        heapClassInst.heap32[(r15 + 1)] = 4
                                        heapClassInst.heap32[(r15 + 2)] = (-1)
                                        heapClassInst.heap32[(r15 + 3)] = (-1)
                                        heapClassInst.heap8[r8 + 16] = Int8(r13)
                                        heapClassInst.heap32[(r15 + 5)] = Int32(r14)
                                        heapClassInst.heap32[(r15 + 6)] = Int32(r11)
                                        heapClassInst.heap32[(r15 + 7)] = 0
                                        heapClassInst.heap32[(r15 + 8)] = 1050253722
                                        heapClassInst.heap32[(r15)] = Int32(r9)
                                        heapClassInst.heap32[(r15 + 135)] = (-1287930578)
                                        heapClassInst.heap32[(r15 + 136)] = 0
                                        heapClassInst.heap32[(r15 + 137)] = 1065353216
                                        heapClassInst.heap32[(r15 + 138)] = 0
                                        heapClassInst.heap32[(r15 + 139)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 140)] = 1065353216
                                        heapClassInst.heap32[(r15 + 141)] = 0
                                        heapClassInst.heap32[(r15 + 142)] = 0
                                        heapClassInst.heap32[(r15 + 143)] = (-1082130432)
                                        heapClassInst.heap32[(r15 + 144)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 145)] = (-1287930578)
                                        heapClassInst.heap32[(r15 + 146)] = 0
                                        heapClassInst.heap32[(r15 + 147)] = 0
                                        heapClassInst.heap32[(r15 + 148)] = (-1085695591)
                                        heapClassInst.heap32[(r15 + 149)] = 0
                                        heapClassInst.heap32[(r15 + 150)] = 0
                                        heapClassInst.heap32[(r15 + 151)] = (-1287930578)
                                        heapClassInst.heap32[(r15 + 152)] = 0
                                        heapClassInst.heap32[(r15 + 153)] = 1065353216
                                        heapClassInst.heap32[(r15 + 154)] = 0
                                        heapClassInst.heap32[(r15 + 155)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 156)] = 1065353216
                                        heapClassInst.heap32[(r15 + 157)] = 0
                                        heapClassInst.heap32[(r15 + 158)] = 0
                                        heapClassInst.heap32[(r15 + 159)] = (-1082130432)
                                        heapClassInst.heap32[(r15 + 160)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 161)] = (-1287930578)
                                        heapClassInst.heap32[(r15 + 162)] = 0
                                        heapClassInst.heap32[(r15 + 163)] = 0
                                        heapClassInst.heap32[(r15 + 164)] = 1059439248
                                        heapClassInst.heap32[(r15 + 165)] = 0
                                        heapClassInst.heap32[(r15 + 166)] = 0
                                        heapClassInst.heap8[r8 + 720] = Int8(r13)
                                        heapClassInst.heap8[r8 + 721] = Int8(r13)
                                        heapClassInst.heap8[r8 + 723] = Int8(r13)
                                        heapClassInst.heap8[r8 + 724] = Int8(r4)
                                        heapClassInst.heap8[r8 + 725] = Int8(r13)
                                        heapClassInst.heap32[(r15 + 183)] = 0
                                        heapClassInst.heap32[(r15 + 172)] = 1065353216
                                        heapClassInst.heap32[(r15 + 173)] = (-1082130432)
                                        heapClassInst.heap32[(r15 + 170)] = 1050253722
                                        heapClassInst.heap32[(r15 + 171)] = 1065353216
                                        heapClassInst.heap32[(r15 + 169)] = 1063675494
                                        heapClassInst.heap8[r8 + 722] = Int8(r13)
                                        heapClassInst.heap32[(r15 + 179)] = 1065353216
                                        heapClassInst.heap32[(g0)] = 0
                                        heapClassInst.heap32[(g0 + 1)] = 1086918619
                                        fmodf(i7);
                                        f12 = commonVariable.f_g0
                                        if (f12 >= f13) {
                                            f14 = 3.1415927410125732
                                            if (f12 > f14) {
                                                f14 = -6.2831854820251465
                                                f12 = f12 + f14
                                            }
                                        } else {
                                            f14 = 6.2831854820251465
                                            f12 = f12 + f14
                                        }
                                        r11 = r8 >> 2
                                        heapClassInst.heapFloat[(r11 + 172)] = Float32(f12)
                                        heapClassInst.heap32[(g0)] = 1070141403
                                        heapClassInst.heap32[(g0 + 1)] = 1086918619
                                        fmodf(i7);
                                        f12 = commonVariable.f_g0
                                        if (f12 >= f13) {
                                            f14 = 3.1415927410125732
                                            if (f12 > f14) {
                                                f14 = -6.2831854820251465
                                                f12 = f12 + f14
                                            }
                                        } else {
                                            f14 = 6.2831854820251465
                                            f12 = f12 + f14
                                        }
                                        heapClassInst.heapFloat[(r11 + 173)] = Float32(f12)
                                        heapClassInst.heap32[(r11 + 169)] = 1063675494
                                        heapClassInst.heap32[(r11 + 170)] = 1050253722
                                        heapClassInst.heap32[(r11 + 171)] = 1065353216
                                        heapClassInst.heap32[(r12 + 27)] = Int32(r8)
                                        r11 = Int64(heapClassInst.heap32[(r12 + 1)])
                                        r14 = r11 >> 2
                                        r14 = Int64(heapClassInst.heap32[(r14)])
                                        r14 = r14 >> 2
                                        r14 = Int64(heapClassInst.heap32[(r14 + 13)])
                                        heapClassInst.heap32[(g0)] = Int32(r11)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r8)
                                        heapClassInst.heap32[(g0 + 2)] = 1
                                        __FUNCTION_TABLE__[(r14) >> 2](i7);
                                        heapClassInst.heap32[(g0)] = 596
                                        _Znwj(i7);
                                        r11 = Int64(heapClassInst.heap32[(r12 + 18)])
                                        r14 = Int64(heapClassInst.heap32[(r12 + 13)])
                                        r15 = commonVariable.r_g0 >> 2
                                        heapClassInst.heap32[(r15 + 1)] = 5
                                        heapClassInst.heap32[(r15 + 2)] = (-1)
                                        heapClassInst.heap32[(r15 + 3)] = (-1)
                                        heapClassInst.heap8[commonVariable.r_g0 + 16] = Int8(r13)
                                        heapClassInst.heap32[(r15 + 5)] = Int32(r14)
                                        heapClassInst.heap32[(r15 + 6)] = Int32(r11)
                                        heapClassInst.heap32[(r15 + 7)] = 0
                                        heapClassInst.heap32[(r15 + 8)] = 1050253722
                                        heapClassInst.heap32[(r15)] = Int32(r10)
                                        heapClassInst.heap32[(r15 + 72)] = 1060439283
                                        heapClassInst.heap32[(r15 + 73)] = (-1087044365)
                                        heapClassInst.heap32[(r15 + 74)] = 0
                                        heapClassInst.heap32[(r15 + 75)] = 0
                                        heapClassInst.heap32[(r15 + 76)] = 1060439283
                                        heapClassInst.heap32[(r15 + 77)] = 1060439283
                                        heapClassInst.heap32[(r15 + 78)] = 0
                                        heapClassInst.heap32[(r15 + 79)] = 0
                                        heapClassInst.heap32[(r15 + 80)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 81)] = 0
                                        heapClassInst.heap32[(r15 + 82)] = 1065353216
                                        heapClassInst.heap32[(r15 + 83)] = 0
                                        heapClassInst.heap32[(r15 + 84)] = 1059145646
                                        heapClassInst.heap32[(r15 + 85)] = (-1095552205)
                                        heapClassInst.heap32[(r15 + 86)] = 0
                                        heapClassInst.heap32[(r15 + 87)] = 0
                                        heapClassInst.heap32[(r15 + 88)] = 1060439283
                                        heapClassInst.heap32[(r15 + 89)] = (-1087044365)
                                        heapClassInst.heap32[(r15 + 90)] = 0
                                        heapClassInst.heap32[(r15 + 91)] = 0
                                        heapClassInst.heap32[(r15 + 92)] = 1060439283
                                        heapClassInst.heap32[(r15 + 93)] = 1060439283
                                        heapClassInst.heap32[(r15 + 94)] = 0
                                        heapClassInst.heap32[(r15 + 95)] = 0
                                        heapClassInst.heap32[(r15 + 96)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 97)] = 0
                                        heapClassInst.heap32[(r15 + 98)] = 1065353216
                                        heapClassInst.heap32[(r15 + 99)] = 0
                                        heapClassInst.heap32[(r15 + 100)] = 0
                                        heapClassInst.heap32[(r15 + 101)] = 1061788057
                                        heapClassInst.heap32[(r15 + 102)] = 0
                                        heapClassInst.heap32[(r15 + 103)] = 0
                                        heapClassInst.heap8[commonVariable.r_g0 + 540] = Int8(r13)
                                        heapClassInst.heap32[(r15 + 128)] = 0
                                        heapClassInst.heap32[(r15 + 140)] = (-1082130432)
                                        heapClassInst.heap32[(r15 + 107)] = 1008981770
                                        heapClassInst.heap32[(r15 + 111)] = 1028443341
                                        heapClassInst.heap32[(r15 + 145)] = 0
                                        heapClassInst.heap32[(r15 + 146)] = 0
                                        heapClassInst.heap32[(r15 + 147)] = 1060320051
                                        heapClassInst.heap32[(r15 + 148)] = 0
                                        heapClassInst.heap32[(r15 + 108)] = 1061752795
                                        heapClassInst.heap32[(r15 + 109)] = 1061752795
                                        heapClassInst.heap32[(r15 + 110)] = 0
                                        heapClassInst.heap32[(r15 + 104)] = 1065353216
                                        heapClassInst.heap32[(r15 + 105)] = 1050253722
                                        heapClassInst.heap32[(r15 + 106)] = 1065353216
                                        heapClassInst.heap32[(r12 + 28)] = Int32(commonVariable.r_g0)
                                        r11 = Int64(heapClassInst.heap32[(r12 + 1)])
                                        r14 = r11 >> 2
                                        r14 = Int64(heapClassInst.heap32[(r14)])
                                        r14 = r14 >> 2
                                        r14 = Int64(heapClassInst.heap32[(r14 + 13)])
                                        heapClassInst.heap32[(g0)] = Int32(r11)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(commonVariable.r_g0)
                                        heapClassInst.heap32[(g0 + 2)] = 1
                                        __FUNCTION_TABLE__[(r14) >> 2](i7);
                                        heapClassInst.heap32[(g0)] = 748
                                        _Znwj(i7);
                                        r8 = commonVariable.r_g0
                                        r11 = Int64(heapClassInst.heap32[(r12 + 19)])
                                        r14 = Int64(heapClassInst.heap32[(r12 + 18)])
                                        r15 = r8 >> 2
                                        heapClassInst.heap32[(r15 + 1)] = 4
                                        heapClassInst.heap32[(r15 + 2)] = (-1)
                                        heapClassInst.heap32[(r15 + 3)] = (-1)
                                        heapClassInst.heap8[r8 + 16] = Int8(r13)
                                        heapClassInst.heap32[(r15 + 5)] = Int32(r14)
                                        heapClassInst.heap32[(r15 + 6)] = Int32(r11)
                                        heapClassInst.heap32[(r15 + 7)] = 0
                                        heapClassInst.heap32[(r15 + 8)] = 1050253722
                                        heapClassInst.heap32[(r15)] = Int32(r9)
                                        heapClassInst.heap32[(r15 + 135)] = (-1287930578)
                                        heapClassInst.heap32[(r15 + 136)] = 0
                                        heapClassInst.heap32[(r15 + 137)] = 1065353216
                                        heapClassInst.heap32[(r15 + 138)] = 0
                                        heapClassInst.heap32[(r15 + 139)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 140)] = 1065353216
                                        heapClassInst.heap32[(r15 + 141)] = 0
                                        heapClassInst.heap32[(r15 + 142)] = 0
                                        heapClassInst.heap32[(r15 + 143)] = (-1082130432)
                                        heapClassInst.heap32[(r15 + 144)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 145)] = (-1287930578)
                                        heapClassInst.heap32[(r15 + 146)] = 0
                                        heapClassInst.heap32[(r15 + 147)] = 0
                                        heapClassInst.heap32[(r15 + 148)] = (-1085695591)
                                        heapClassInst.heap32[(r15 + 149)] = 0
                                        heapClassInst.heap32[(r15 + 150)] = 0
                                        heapClassInst.heap32[(r15 + 151)] = (-1287930578)
                                        heapClassInst.heap32[(r15 + 152)] = 0
                                        heapClassInst.heap32[(r15 + 153)] = 1065353216
                                        heapClassInst.heap32[(r15 + 154)] = 0
                                        heapClassInst.heap32[(r15 + 155)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 156)] = 1065353216
                                        heapClassInst.heap32[(r15 + 157)] = 0
                                        heapClassInst.heap32[(r15 + 158)] = 0
                                        heapClassInst.heap32[(r15 + 159)] = (-1082130432)
                                        heapClassInst.heap32[(r15 + 160)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 161)] = (-1287930578)
                                        heapClassInst.heap32[(r15 + 162)] = 0
                                        heapClassInst.heap32[(r15 + 163)] = 0
                                        heapClassInst.heap32[(r15 + 164)] = 1059439248
                                        heapClassInst.heap32[(r15 + 165)] = 0
                                        heapClassInst.heap32[(r15 + 166)] = 0
                                        heapClassInst.heap8[r8 + 720] = Int8(r13)
                                        heapClassInst.heap8[r8 + 721] = Int8(r13)
                                        heapClassInst.heap8[r8 + 723] = Int8(r13)
                                        heapClassInst.heap8[r8 + 724] = Int8(r4)
                                        heapClassInst.heap8[r8 + 725] = Int8(r13)
                                        heapClassInst.heap32[(r15 + 183)] = 0
                                        heapClassInst.heap32[(r15 + 172)] = 1065353216
                                        heapClassInst.heap32[(r15 + 173)] = (-1082130432)
                                        heapClassInst.heap32[(r15 + 170)] = 1050253722
                                        heapClassInst.heap32[(r15 + 171)] = 1065353216
                                        heapClassInst.heap32[(r15 + 169)] = 1063675494
                                        heapClassInst.heap8[r8 + 722] = Int8(r13)
                                        heapClassInst.heap32[(r15 + 179)] = 1065353216
                                        heapClassInst.heap32[(g0)] = 0
                                        heapClassInst.heap32[(g0 + 1)] = 1086918619
                                        fmodf(i7);
                                        f12 = commonVariable.f_g0
                                        if (f12 >= f13) {
                                            f14 = 3.1415927410125732
                                            if (f12 > f14) {
                                                f14 = -6.2831854820251465
                                                f12 = f12 + f14
                                            }
                                        } else {
                                            f14 = 6.2831854820251465
                                            f12 = f12 + f14
                                        }
                                        r11 = r8 >> 2
                                        heapClassInst.heapFloat[(r11 + 172)] = Float32(f12)
                                        heapClassInst.heap32[(g0)] = 1070141403
                                        heapClassInst.heap32[(g0 + 1)] = 1086918619
                                        fmodf(i7);
                                        f12 = commonVariable.f_g0
                                        if (f12 >= f13) {
                                            f14 = 3.1415927410125732
                                            if (f12 > f14) {
                                                f14 = -6.2831854820251465
                                                f12 = f12 + f14
                                            }
                                        } else {
                                            f14 = 6.2831854820251465
                                            f12 = f12 + f14
                                        }
                                        heapClassInst.heapFloat[(r11 + 173)] = Float32(f12)
                                        heapClassInst.heap32[(r11 + 169)] = 1063675494
                                        heapClassInst.heap32[(r11 + 170)] = 1050253722
                                        heapClassInst.heap32[(r11 + 171)] = 1065353216
                                        heapClassInst.heap32[(r12 + 29)] = Int32(r8)
                                        r11 = Int64(heapClassInst.heap32[(r12 + 1)])
                                        r14 = r11 >> 2
                                        r14 = Int64(heapClassInst.heap32[(r14)])
                                        r14 = r14 >> 2
                                        r14 = Int64(heapClassInst.heap32[(r14 + 13)])
                                        heapClassInst.heap32[(g0)] = Int32(r11)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r8)
                                        heapClassInst.heap32[(g0 + 2)] = 1
                                        __FUNCTION_TABLE__[(r14) >> 2](i7);
                                        heapClassInst.heap32[(g0)] = 596
                                        _Znwj(i7);
                                        r11 = Int64(heapClassInst.heap32[(r12 + 20)])
                                        r14 = Int64(heapClassInst.heap32[(r12 + 14)])
                                        r15 = commonVariable.r_g0 >> 2
                                        heapClassInst.heap32[(r15 + 1)] = 5
                                        heapClassInst.heap32[(r15 + 2)] = (-1)
                                        heapClassInst.heap32[(r15 + 3)] = (-1)
                                        heapClassInst.heap8[commonVariable.r_g0 + 16] = Int8(r13)
                                        heapClassInst.heap32[(r15 + 5)] = Int32(r14)
                                        heapClassInst.heap32[(r15 + 6)] = Int32(r11)
                                        heapClassInst.heap32[(r15 + 7)] = 0
                                        heapClassInst.heap32[(r15 + 8)] = 1050253722
                                        heapClassInst.heap32[(r15)] = Int32(r10)
                                        heapClassInst.heap32[(r15 + 72)] = (-1082130432)
                                        heapClassInst.heap32[(r15 + 73)] = 867941678
                                        heapClassInst.heap32[(r15 + 74)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 75)] = 0
                                        heapClassInst.heap32[(r15 + 76)] = (-1279541970)
                                        heapClassInst.heap32[(r15 + 77)] = (-1082130432)
                                        heapClassInst.heap32[(r15 + 78)] = 0
                                        heapClassInst.heap32[(r15 + 79)] = 0
                                        heapClassInst.heap32[(r15 + 80)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 81)] = 0
                                        heapClassInst.heap32[(r15 + 82)] = 1065353216
                                        heapClassInst.heap32[(r15 + 83)] = 0
                                        heapClassInst.heap32[(r15 + 84)] = (-1087163597)
                                        heapClassInst.heap32[(r15 + 85)] = 1057384039
                                        heapClassInst.heap32[(r15 + 86)] = 0
                                        heapClassInst.heap32[(r15 + 87)] = 0
                                        heapClassInst.heap32[(r15 + 88)] = (-1287930578)
                                        heapClassInst.heap32[(r15 + 89)] = (-1082130432)
                                        heapClassInst.heap32[(r15 + 90)] = 0
                                        heapClassInst.heap32[(r15 + 91)] = 0
                                        heapClassInst.heap32[(r15 + 92)] = 1065353216
                                        heapClassInst.heap32[(r15 + 93)] = (-1287930578)
                                        heapClassInst.heap32[(r15 + 94)] = 0
                                        heapClassInst.heap32[(r15 + 95)] = 0
                                        heapClassInst.heap32[(r15 + 96)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 97)] = 0
                                        heapClassInst.heap32[(r15 + 98)] = 1065353216
                                        heapClassInst.heap32[(r15 + 99)] = 0
                                        heapClassInst.heap32[(r15 + 100)] = 0
                                        heapClassInst.heap32[(r15 + 101)] = (-1088338002)
                                        heapClassInst.heap32[(r15 + 102)] = 0
                                        heapClassInst.heap32[(r15 + 103)] = 0
                                        heapClassInst.heap8[commonVariable.r_g0 + 540] = Int8(r13)
                                        heapClassInst.heap32[(r15 + 128)] = 0
                                        heapClassInst.heap32[(r15 + 140)] = (-1082130432)
                                        heapClassInst.heap32[(r15 + 107)] = 1008981770
                                        heapClassInst.heap32[(r15 + 111)] = 1028443341
                                        heapClassInst.heap32[(r15 + 145)] = 0
                                        heapClassInst.heap32[(r15 + 146)] = 0
                                        heapClassInst.heap32[(r15 + 147)] = 1060320051
                                        heapClassInst.heap32[(r15 + 148)] = 0
                                        heapClassInst.heap32[(r15 + 108)] = 1070141403
                                        heapClassInst.heap32[(r15 + 109)] = 1070141403
                                        heapClassInst.heap32[(r15 + 110)] = 0
                                        heapClassInst.heap32[(r15 + 104)] = 1065353216
                                        heapClassInst.heap32[(r15 + 105)] = 1050253722
                                        heapClassInst.heap32[(r15 + 106)] = 1065353216
                                        heapClassInst.heap32[(r12 + 30)] = Int32(commonVariable.r_g0)
                                        r11 = Int64(heapClassInst.heap32[(r12 + 1)])
                                        r14 = r11 >> 2
                                        r14 = Int64(heapClassInst.heap32[(r14)])
                                        r14 = r14 >> 2
                                        r14 = Int64(heapClassInst.heap32[(r14 + 13)])
                                        heapClassInst.heap32[(g0)] = Int32(r11)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(commonVariable.r_g0)
                                        heapClassInst.heap32[(g0 + 2)] = 1
                                        __FUNCTION_TABLE__[(r14) >> 2](i7);
                                        heapClassInst.heap32[(g0)] = 748
                                        _Znwj(i7);
                                        r8 = commonVariable.r_g0
                                        r11 = Int64(heapClassInst.heap32[(r12 + 21)])
                                        r14 = Int64(heapClassInst.heap32[(r12 + 20)])
                                        r15 = r8 >> 2
                                        heapClassInst.heap32[(r15 + 1)] = 4
                                        heapClassInst.heap32[(r15 + 2)] = (-1)
                                        heapClassInst.heap32[(r15 + 3)] = (-1)
                                        heapClassInst.heap8[r8 + 16] = Int8(r13)
                                        heapClassInst.heap32[(r15 + 5)] = Int32(r14)
                                        heapClassInst.heap32[(r15 + 6)] = Int32(r11)
                                        heapClassInst.heap32[(r15 + 7)] = 0
                                        heapClassInst.heap32[(r15 + 8)] = 1050253722
                                        heapClassInst.heap32[(r15)] = Int32(r9)
                                        heapClassInst.heap32[(r15 + 135)] = (-1287930578)
                                        heapClassInst.heap32[(r15 + 136)] = 0
                                        heapClassInst.heap32[(r15 + 137)] = 1065353216
                                        heapClassInst.heap32[(r15 + 138)] = 0
                                        heapClassInst.heap32[(r15 + 139)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 140)] = 1065353216
                                        heapClassInst.heap32[(r15 + 141)] = 0
                                        heapClassInst.heap32[(r15 + 142)] = 0
                                        heapClassInst.heap32[(r15 + 143)] = (-1082130432)
                                        heapClassInst.heap32[(r15 + 144)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 145)] = (-1287930578)
                                        heapClassInst.heap32[(r15 + 146)] = 0
                                        heapClassInst.heap32[(r15 + 147)] = 0
                                        heapClassInst.heap32[(r15 + 148)] = 1059145646
                                        heapClassInst.heap32[(r15 + 149)] = 0
                                        heapClassInst.heap32[(r15 + 150)] = 0
                                        heapClassInst.heap32[(r15 + 151)] = (-1287930578)
                                        heapClassInst.heap32[(r15 + 152)] = 0
                                        heapClassInst.heap32[(r15 + 153)] = 1065353216
                                        heapClassInst.heap32[(r15 + 154)] = 0
                                        heapClassInst.heap32[(r15 + 155)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 156)] = 1065353216
                                        heapClassInst.heap32[(r15 + 157)] = 0
                                        heapClassInst.heap32[(r15 + 158)] = 0
                                        heapClassInst.heap32[(r15 + 159)] = (-1082130432)
                                        heapClassInst.heap32[(r15 + 160)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 161)] = (-1287930578)
                                        heapClassInst.heap32[(r15 + 162)] = 0
                                        heapClassInst.heap32[(r15 + 163)] = 0
                                        heapClassInst.heap32[(r15 + 164)] = (-1090854584)
                                        heapClassInst.heap32[(r15 + 165)] = 0
                                        heapClassInst.heap32[(r15 + 166)] = 0
                                        heapClassInst.heap8[r8 + 720] = Int8(r13)
                                        heapClassInst.heap8[r8 + 721] = Int8(r13)
                                        heapClassInst.heap8[r8 + 723] = Int8(r13)
                                        heapClassInst.heap8[r8 + 724] = Int8(r4)
                                        heapClassInst.heap8[r8 + 725] = Int8(r13)
                                        heapClassInst.heap32[(r15 + 183)] = 0
                                        heapClassInst.heap32[(r15 + 172)] = 1065353216
                                        heapClassInst.heap32[(r15 + 173)] = (-1082130432)
                                        heapClassInst.heap32[(r15 + 170)] = 1050253722
                                        heapClassInst.heap32[(r15 + 171)] = 1065353216
                                        heapClassInst.heap32[(r15 + 169)] = 1063675494
                                        heapClassInst.heap8[r8 + 722] = Int8(r13)
                                        heapClassInst.heap32[(r15 + 179)] = 1065353216
                                        heapClassInst.heap32[(g0)] = (-1077342245)
                                        heapClassInst.heap32[(g0 + 1)] = 1086918619
                                        fmodf(i7);
                                        f12 = commonVariable.f_g0
                                        if (f12 >= f13) {
                                            f14 = 3.1415927410125732
                                            if (f12 > f14) {
                                                f14 = -6.2831854820251465
                                                f12 = f12 + f14
                                            }
                                        } else {
                                            f14 = 6.2831854820251465
                                            f12 = f12 + f14
                                        }
                                        r11 = r8 >> 2
                                        heapClassInst.heapFloat[(r11 + 172)] = Float32(f12)
                                        heapClassInst.heap32[(g0)] = 0
                                        heapClassInst.heap32[(g0 + 1)] = 1086918619
                                        fmodf(i7);
                                        f12 = commonVariable.f_g0
                                        if (f12 >= f13) {
                                            f14 = 3.1415927410125732
                                            if (f12 > f14) {
                                                f14 = -6.2831854820251465
                                                f12 = f12 + f14
                                            }
                                        } else {
                                            f14 = 6.2831854820251465
                                            f12 = f12 + f14
                                        }
                                        heapClassInst.heapFloat[(r11 + 173)] = Float32(f12)
                                        heapClassInst.heap32[(r11 + 169)] = 1063675494
                                        heapClassInst.heap32[(r11 + 170)] = 1050253722
                                        heapClassInst.heap32[(r11 + 171)] = 1065353216
                                        heapClassInst.heap32[(r12 + 31)] = Int32(r8)
                                        r11 = Int64(heapClassInst.heap32[(r12 + 1)])
                                        r14 = r11 >> 2
                                        r14 = Int64(heapClassInst.heap32[(r14)])
                                        r14 = r14 >> 2
                                        r14 = Int64(heapClassInst.heap32[(r14 + 13)])
                                        heapClassInst.heap32[(g0)] = Int32(r11)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r8)
                                        heapClassInst.heap32[(g0 + 2)] = 1
                                        __FUNCTION_TABLE__[(r14) >> 2](i7);
                                        heapClassInst.heap32[(g0)] = 596
                                        _Znwj(i7);
                                        r11 = Int64(heapClassInst.heap32[(r12 + 22)])
                                        r14 = Int64(heapClassInst.heap32[(r12 + 14)])
                                        r15 = commonVariable.r_g0 >> 2
                                        heapClassInst.heap32[(r15 + 1)] = 5
                                        heapClassInst.heap32[(r15 + 2)] = (-1)
                                        heapClassInst.heap32[(r15 + 3)] = (-1)
                                        heapClassInst.heap8[commonVariable.r_g0 + 16] = Int8(r13)
                                        heapClassInst.heap32[(r15 + 5)] = Int32(r14)
                                        heapClassInst.heap32[(r15 + 6)] = Int32(r11)
                                        heapClassInst.heap32[(r15 + 7)] = 0
                                        heapClassInst.heap32[(r15 + 8)] = 1050253722
                                        heapClassInst.heap32[(r15)] = Int32(r10)
                                        heapClassInst.heap32[(r15 + 72)] = 1065353216
                                        heapClassInst.heap32[(r15 + 73)] = 0
                                        heapClassInst.heap32[(r15 + 74)] = 0
                                        heapClassInst.heap32[(r15 + 75)] = 0
                                        heapClassInst.heap32[(r15 + 76)] = 0
                                        heapClassInst.heap32[(r15 + 77)] = 1065353216
                                        heapClassInst.heap32[(r15 + 78)] = 0
                                        heapClassInst.heap32[(r15 + 79)] = 0
                                        heapClassInst.heap32[(r15 + 80)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 81)] = 0
                                        heapClassInst.heap32[(r15 + 82)] = 1065353216
                                        heapClassInst.heap32[(r15 + 83)] = 0
                                        heapClassInst.heap32[(r15 + 84)] = 1060320051
                                        heapClassInst.heap32[(r15 + 85)] = 1057384039
                                        heapClassInst.heap32[(r15 + 86)] = 0
                                        heapClassInst.heap32[(r15 + 87)] = 0
                                        heapClassInst.heap32[(r15 + 88)] = (-1287930578)
                                        heapClassInst.heap32[(r15 + 89)] = (-1082130432)
                                        heapClassInst.heap32[(r15 + 90)] = 0
                                        heapClassInst.heap32[(r15 + 91)] = 0
                                        heapClassInst.heap32[(r15 + 92)] = 1065353216
                                        heapClassInst.heap32[(r15 + 93)] = (-1287930578)
                                        heapClassInst.heap32[(r15 + 94)] = 0
                                        heapClassInst.heap32[(r15 + 95)] = 0
                                        heapClassInst.heap32[(r15 + 96)] = (-2147483648)
                                        heapClassInst.heap32[(r15 + 97)] = 0
                                        heapClassInst.heap32[(r15 + 98)] = 1065353216
                                        heapClassInst.heap32[(r15 + 99)] = 0
                                        heapClassInst.heap32[(r15 + 100)] = 0
                                        heapClassInst.heap32[(r15 + 101)] = (-1088338002)
                                        heapClassInst.heap32[(r15 + 102)] = 0
                                        heapClassInst.heap32[(r15 + 103)] = 0
                                        heapClassInst.heap8[commonVariable.r_g0 + 540] = Int8(r13)
                                        heapClassInst.heap32[(r15 + 128)] = 0
                                        heapClassInst.heap32[(r15 + 140)] = (-1082130432)
                                        heapClassInst.heap32[(r15 + 107)] = 1008981770
                                        heapClassInst.heap32[(r15 + 111)] = 1028443341
                                        heapClassInst.heap32[(r15 + 145)] = 0
                                        heapClassInst.heap32[(r15 + 146)] = 0
                                        heapClassInst.heap32[(r15 + 147)] = 1060320051
                                        heapClassInst.heap32[(r15 + 148)] = 0
                                        heapClassInst.heap32[(r15 + 108)] = 1070141403
                                        heapClassInst.heap32[(r15 + 109)] = 1070141403
                                        heapClassInst.heap32[(r15 + 110)] = 0
                                        heapClassInst.heap32[(r15 + 104)] = 1065353216
                                        heapClassInst.heap32[(r15 + 105)] = 1050253722
                                        heapClassInst.heap32[(r15 + 106)] = 1065353216
                                        heapClassInst.heap32[(r12 + 32)] = Int32(commonVariable.r_g0)
                                        r10 = Int64(heapClassInst.heap32[(r12 + 1)])
                                        r11 = r10 >> 2
                                        r11 = Int64(heapClassInst.heap32[(r11)])
                                        r11 = r11 >> 2
                                        r11 = Int64(heapClassInst.heap32[(r11 + 13)])
                                        heapClassInst.heap32[(g0)] = Int32(r10)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(commonVariable.r_g0)
                                        heapClassInst.heap32[(g0 + 2)] = 1
                                        __FUNCTION_TABLE__[(r11) >> 2](i7);
                                        heapClassInst.heap32[(g0)] = 748
                                        _Znwj(i7);
                                        r8 = commonVariable.r_g0
                                        r10 = Int64(heapClassInst.heap32[(r12 + 23)])
                                        r11 = Int64(heapClassInst.heap32[(r12 + 22)])
                                        r14 = r8 >> 2
                                        heapClassInst.heap32[(r14 + 1)] = 4
                                        heapClassInst.heap32[(r14 + 2)] = (-1)
                                        heapClassInst.heap32[(r14 + 3)] = (-1)
                                        heapClassInst.heap8[r8 + 16] = Int8(r13)
                                        heapClassInst.heap32[(r14 + 5)] = Int32(r11)
                                        heapClassInst.heap32[(r14 + 6)] = Int32(r10)
                                        heapClassInst.heap32[(r14 + 7)] = 0
                                        heapClassInst.heap32[(r14 + 8)] = 1050253722
                                        heapClassInst.heap32[(r14)] = Int32(r9)
                                        heapClassInst.heap32[(r14 + 135)] = (-1287930578)
                                        heapClassInst.heap32[(r14 + 136)] = 0
                                        heapClassInst.heap32[(r14 + 137)] = 1065353216
                                        heapClassInst.heap32[(r14 + 138)] = 0
                                        heapClassInst.heap32[(r14 + 139)] = (-2147483648)
                                        heapClassInst.heap32[(r14 + 140)] = 1065353216
                                        heapClassInst.heap32[(r14 + 141)] = 0
                                        heapClassInst.heap32[(r14 + 142)] = 0
                                        heapClassInst.heap32[(r14 + 143)] = (-1082130432)
                                        heapClassInst.heap32[(r14 + 144)] = (-2147483648)
                                        heapClassInst.heap32[(r14 + 145)] = (-1287930578)
                                        heapClassInst.heap32[(r14 + 146)] = 0
                                        heapClassInst.heap32[(r14 + 147)] = 0
                                        heapClassInst.heap32[(r14 + 148)] = 1059145646
                                        heapClassInst.heap32[(r14 + 149)] = 0
                                        heapClassInst.heap32[(r14 + 150)] = 0
                                        heapClassInst.heap32[(r14 + 151)] = (-1287930578)
                                        heapClassInst.heap32[(r14 + 152)] = 0
                                        heapClassInst.heap32[(r14 + 153)] = 1065353216
                                        heapClassInst.heap32[(r14 + 154)] = 0
                                        heapClassInst.heap32[(r14 + 155)] = (-2147483648)
                                        heapClassInst.heap32[(r14 + 156)] = 1065353216
                                        heapClassInst.heap32[(r14 + 157)] = 0
                                        heapClassInst.heap32[(r14 + 158)] = 0
                                        heapClassInst.heap32[(r14 + 159)] = (-1082130432)
                                        heapClassInst.heap32[(r14 + 160)] = (-2147483648)
                                        heapClassInst.heap32[(r14 + 161)] = (-1287930578)
                                        heapClassInst.heap32[(r14 + 162)] = 0
                                        heapClassInst.heap32[(r14 + 163)] = 0
                                        heapClassInst.heap32[(r14 + 164)] = (-1090854584)
                                        heapClassInst.heap32[(r14 + 165)] = 0
                                        heapClassInst.heap32[(r14 + 166)] = 0
                                        heapClassInst.heap8[r8 + 720] = Int8(r13)
                                        heapClassInst.heap8[r8 + 721] = Int8(r13)
                                        heapClassInst.heap8[r8 + 723] = Int8(r13)
                                        heapClassInst.heap8[r8 + 724] = Int8(r4)
                                        heapClassInst.heap8[r8 + 725] = Int8(r13)
                                        heapClassInst.heap32[(r14 + 183)] = 0
                                        heapClassInst.heap32[(r14 + 172)] = 1065353216
                                        heapClassInst.heap32[(r14 + 173)] = (-1082130432)
                                        heapClassInst.heap32[(r14 + 170)] = 1050253722
                                        heapClassInst.heap32[(r14 + 171)] = 1065353216
                                        heapClassInst.heap32[(r14 + 169)] = 1063675494
                                        heapClassInst.heap8[r8 + 722] = Int8(r13)
                                        heapClassInst.heap32[(r14 + 179)] = 1065353216
                                        heapClassInst.heap32[(g0)] = (-1077342245)
                                        heapClassInst.heap32[(g0 + 1)] = 1086918619
                                        fmodf(i7);
                                        f12 = commonVariable.f_g0
                                        if (f12 >= f13) {
                                            f14 = 3.1415927410125732
                                            if (f12 > f14) {
                                                f14 = -6.2831854820251465
                                                f12 = f12 + f14
                                            }
                                        } else {
                                            f14 = 6.2831854820251465
                                            f12 = f12 + f14
                                        }
                                        r9 = r8 >> 2
                                        heapClassInst.heapFloat[(r9 + 172)] = Float32(f12)
                                        heapClassInst.heap32[(g0)] = 0
                                        heapClassInst.heap32[(g0 + 1)] = 1086918619
                                        fmodf(i7);
                                        f12 = commonVariable.f_g0
                                        if (f12 >= f13) {
                                            f13 = 3.1415927410125732
                                            if (f12 > f13) {
                                                f13 = -6.2831854820251465
                                                f12 = f12 + f13
                                            }
                                        } else {
                                            f13 = 6.2831854820251465
                                            f12 = f12 + f13
                                        }
                                        heapClassInst.heapFloat[(r9 + 173)] = Float32(f12)
                                        heapClassInst.heap32[(r9 + 169)] = 1063675494
                                        heapClassInst.heap32[(r9 + 170)] = 1050253722
                                        heapClassInst.heap32[(r9 + 171)] = 1065353216
                                        heapClassInst.heap32[(r12 + 33)] = Int32(r8)
                                        r9 = Int64(heapClassInst.heap32[(r12 + 1)])
                                        r10 = r9 >> 2
                                        r10 = Int64(heapClassInst.heap32[(r10)])
                                        r10 = r10 >> 2
                                        r10 = Int64(heapClassInst.heap32[(r10 + 13)])
                                        heapClassInst.heap32[(g0)] = Int32(r9)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r8)
                                        heapClassInst.heap32[(g0 + 2)] = 1
                                        __FUNCTION_TABLE__[(r10) >> 2](i7);
                                        r8 = Int64(heapClassInst.heap32[(r1 + 10)])
                                        r9 = Int64(heapClassInst.heap32[(r1 + 9)])
                                        if (r8 == r9) {
                                            r10 = r9 << 1
                                            r10 = if (r9 == 0) {
                                                r4
                                            } else {
                                                r10
                                            };
                                            if (!(r8 >= r10)) {
                                                if (r10 != 0) {
                                                    r8 = Int64(heapClassInst.heap32[(r2)])
                                                    r11 = r10 << 2
                                                    r8 = (r8 + 1) | 0
                                                    r11 = r11 | 3
                                                    heapClassInst.heap32[(r2)] = Int32(r8)
                                                    r8 = (r11 + 16) | 0
                                                    heapClassInst.heap32[(g0)] = Int32(r8)
                                                    mallocNew(i7);
                                                    r8 = commonVariable.r_g0
                                                    if (r8 != 0) {
                                                        r11 = (r8 + 4) | 0
                                                        r11 = (r13 - r11) | 0
                                                        r11 = r11 & 15
                                                        r11 = (r8 + r11) | 0
                                                        r12 = (r11 + 4) | 0
                                                        r11 = r11 >> 2
                                                        heapClassInst.heap32[(r11)] = Int32(r8)
                                                        r8 = r12
                                                    }
                                                } else {
                                                    r8 = 0
                                                }
                                                do {
                                                    if (r9 < 1) {
                                                        r11 = Int64(heapClassInst.heap32[(r1 + 11)])
                                                    } else {
                                                        while (true) {
                                                            r11 = Int64(heapClassInst.heap32[(r1 + 11)])
                                                            r12 = r13 << 2
                                                            r14 = (r11 + r12) | 0
                                                            r14 = r14 >> 2
                                                            r12 = (r8 + r12) | 0
                                                            r14 = Int64(heapClassInst.heap32[(r14)])
                                                            r13 = (r13 + 1) | 0
                                                            r12 = r12 >> 2
                                                            heapClassInst.heap32[(r12)] = Int32(r14)
                                                            if (!(r9 != r13)) {
                                                                break
                                                            }
                                                        }
                                                    }
                                                } while (false);
                                                if (r11 != 0) {
                                                    r12 = Int64(heapClassInst.heapU8[r6 + 48])
                                                    if (r12 != 0) {
                                                        r9 = gNumAlignedFree
                                                        r9 = r9 >> 2
                                                        r12 = Int64(heapClassInst.heap32[(r9)])
                                                        r12 = (r12 + 1) | 0
                                                        r11 = r11 >> 2
                                                        heapClassInst.heap32[(r9)] = Int32(r12)
                                                        r9 = Int64(heapClassInst.heap32[(r11 + (-1))])
                                                        heapClassInst.heap32[(g0)] = Int32(r9)
                                                        free(i7);
                                                        r9 = Int64(heapClassInst.heap32[(r1 + 9)])
                                                    }
                                                    heapClassInst.heap32[(r1 + 11)] = 0
                                                }
                                                heapClassInst.heap8[r6 + 48] = Int8(r4)
                                                heapClassInst.heap32[(r1 + 11)] = Int32(r8)
                                                heapClassInst.heap32[(r1 + 10)] = Int32(r10)
                                            }
                                        }
                                        r8 = r9 << 2
                                        r9 = Int64(heapClassInst.heap32[(r1 + 11)])
                                        r8 = (r9 + r8) | 0
                                        r8 = r8 >> 2
                                        heapClassInst.heap32[(r8)] = Int32(r7)
                                        r7 = Int64(heapClassInst.heap32[(r1 + 9)])
                                        r5 = (r5 + 1) | 0
                                        r7 = (r7 + 1) | 0
                                        heapClassInst.heap32[(r1 + 9)] = Int32(r7)
                                        if (!(r0 != r5)) {
                                            break
                                        }
                                    }
                                    f3 = 7.0
                                    f4 = (-2.0)
                                    r0 = (r0 + (-1)) | 0
                                    f1 = f1 + f3
                                    f2 = f2 + f4
                                    r3 = (r3 + 1) | 0
                                    if (r0 == 0) {
                                        break
                                    } else {
                                        continue
                                    }
                                }
                            }
                        }
                    }
                }
            } while (false);
            return;

        case 46 =>
            r0 = _E2_str674
            r1 = _E2_str573
            heapClassInst.heap32[(g0)] = Int32(r0)
            heapClassInst.heap32[(g0 + 1)] = Int32(r1)
            heapClassInst.heap32[(g0 + 2)] = 53
            _assert(i7);
        case _ => println("break5866")
    }
}

@OverflowWrapping 
func _GLOBAL__D__Z6mymainiPPc(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = _ZL14benchmarkDemo4
    r1 = _ZTV13BenchmarkDemo
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN13BenchmarkDemo11exitPhysicsEv(i7);
    r1 = Int64(heapClassInst.heap32[(r2 + 11)])
    if (!(r1 == 0)) {
        r3 = Int64(heapClassInst.heapU8[r0 + 48])
        if (!(r3 == 0)) {
            r3 = gNumAlignedFree
            r3 = r3 >> 2
            r4 = Int64(heapClassInst.heap32[(r3)])
            r4 = (r4 + 1) | 0
            r1 = r1 >> 2
            heapClassInst.heap32[(r3)] = Int32(r4)
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r1)
            free(i7);
        }
        heapClassInst.heap32[(r2 + 11)] = 0
    }
    r1 = 1
    heapClassInst.heap8[r0 + 48] = Int8(r1)
    heapClassInst.heap32[(r2 + 11)] = 0
    heapClassInst.heap32[(r2 + 9)] = 0
    heapClassInst.heap32[(r2 + 10)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 6)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 28])
        if (!(r4 == 0)) {
            r4 = gNumAlignedFree
            r4 = r4 >> 2
            r5 = Int64(heapClassInst.heap32[(r4)])
            r5 = (r5 + 1) | 0
            r3 = r3 >> 2
            heapClassInst.heap32[(r4)] = Int32(r5)
            r3 = Int64(heapClassInst.heap32[(r3 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r3)
            free(i7);
        }
        heapClassInst.heap32[(r2 + 6)] = 0
    }
    heapClassInst.heap8[r0 + 28] = Int8(r1)
    heapClassInst.heap32[(r2 + 6)] = 0
    heapClassInst.heap32[(r2 + 4)] = 0
    heapClassInst.heap32[(r2 + 5)] = 0
    return;
}

@OverflowWrapping
func _ZN14BenchmarkDemo4D1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV14BenchmarkDemo4
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN13BenchmarkDemoD2Ev(i7);
    return;
}

@OverflowWrapping
func _ZN14BenchmarkDemo4D0Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV14BenchmarkDemo4
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN13BenchmarkDemoD2Ev(i7);
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

@OverflowWrapping
func __draw(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = _ZL14benchmarkDemo4
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN13BenchmarkDemo20clientMoveAndDisplayEv(i7);
    return;
}

@OverflowWrapping
func _ZN13BenchmarkDemoD2Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV13BenchmarkDemo
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN13BenchmarkDemo11exitPhysicsEv(i7);
    r1 = Int64(heapClassInst.heap32[(r2 + 11)])
    if (!(r1 == 0)) {
        r3 = Int64(heapClassInst.heapU8[r0 + 48])
        if (!(r3 == 0)) {
            r3 = gNumAlignedFree
            r3 = r3 >> 2
            r4 = Int64(heapClassInst.heap32[(r3)])
            r4 = (r4 + 1) | 0
            r1 = r1 >> 2
            heapClassInst.heap32[(r3)] = Int32(r4)
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r1)
            free(i7);
        }
        heapClassInst.heap32[(r2 + 11)] = 0
    }
    r1 = 1
    heapClassInst.heap8[r0 + 48] = Int8(r1)
    heapClassInst.heap32[(r2 + 11)] = 0
    heapClassInst.heap32[(r2 + 9)] = 0
    heapClassInst.heap32[(r2 + 10)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 6)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 28])
        if (!(r4 == 0)) {
            r4 = gNumAlignedFree
            r4 = r4 >> 2
            r5 = Int64(heapClassInst.heap32[(r4)])
            r5 = (r5 + 1) | 0
            r3 = r3 >> 2
            heapClassInst.heap32[(r4)] = Int32(r5)
            r3 = Int64(heapClassInst.heap32[(r3 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r3)
            free(i7);
        }
        heapClassInst.heap32[(r2 + 6)] = 0
    }
    heapClassInst.heap8[r0 + 28] = Int8(r1)
    heapClassInst.heap32[(r2 + 6)] = 0
    heapClassInst.heap32[(r2 + 4)] = 0
    heapClassInst.heap32[(r2 + 5)] = 0
    return;
}

@OverflowWrapping
func __init(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = gDisableDeactivation
    r1 = 1
    heapClassInst.heap8[r0] = Int8(r1)
    _ZN13BenchmarkDemo11initPhysicsEv(i7);
    return;
}

@OverflowWrapping
func _ZN15btNullPairCache23getOverlappingPairArrayEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = (r0 + 4) | 0
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZN15btNullPairCache20cleanOverlappingPairER16btBroadphasePairP12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

@OverflowWrapping
func _ZNK15btNullPairCache22getNumOverlappingPairsEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = 0
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZN15btNullPairCache19cleanProxyFromPairsEP17btBroadphaseProxyP12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

@OverflowWrapping
func _ZN15btNullPairCache24setOverlapFilterCallbackEP23btOverlapFilterCallback(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

@OverflowWrapping
func _ZN15btNullPairCache26processAllOverlappingPairsEP17btOverlapCallbackP12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

@OverflowWrapping
func _ZN15btNullPairCache8findPairEP17btBroadphaseProxyS1_(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = 0
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZN15btNullPairCache18hasDeferredRemovalEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = 1
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZN15btNullPairCache28setInternalGhostPairCallbackEP25btOverlappingPairCallback(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

@OverflowWrapping
func _ZN15btNullPairCache18addOverlappingPairEP17btBroadphaseProxyS1_(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = 0
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZN15btNullPairCache21removeOverlappingPairEP17btBroadphaseProxyS1_P12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = 0
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZN15btNullPairCache37removeOverlappingPairsContainingProxyEP17btBroadphaseProxyP12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

@OverflowWrapping
func _ZN15btNullPairCache20sortOverlappingPairsEP12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

@OverflowWrapping
func _ZN15btNullPairCache26getOverlappingPairArrayPtrEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0 + 4)])
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZNK15btNullPairCache26getOverlappingPairArrayPtrEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0 + 4)])
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZN15btNullPairCacheD1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV15btNullPairCache
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 4)])
    if (!(r1 == 0)) {
        r3 = Int64(heapClassInst.heapU8[r0 + 20])
        if (!(r3 == 0)) {
            r3 = gNumAlignedFree
            r3 = r3 >> 2
            r4 = Int64(heapClassInst.heap32[(r3)])
            r4 = (r4 + 1) | 0
            r1 = r1 >> 2
            heapClassInst.heap32[(r3)] = Int32(r4)
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r1)
            free(i7);
        }
        heapClassInst.heap32[(r2 + 4)] = 0
    }
    r1 = 1
    heapClassInst.heap8[r0 + 20] = Int8(r1)
    heapClassInst.heap32[(r2 + 4)] = 0
    heapClassInst.heap32[(r2 + 2)] = 0
    heapClassInst.heap32[(r2 + 3)] = 0
    return;
}

@OverflowWrapping
func _ZN15btNullPairCacheD0Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV15btNullPairCache
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 4)])
    if (!(r1 == 0)) {
        r3 = Int64(heapClassInst.heapU8[r0 + 20])
        if (!(r3 == 0)) {
            r3 = gNumAlignedFree
            r3 = r3 >> 2
            r4 = Int64(heapClassInst.heap32[(r3)])
            r4 = (r4 + 1) | 0
            r1 = r1 >> 2
            heapClassInst.heap32[(r3)] = Int32(r4)
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r1)
            free(i7);
        }
        heapClassInst.heap32[(r2 + 4)] = 0
    }
    r1 = 1
    heapClassInst.heap8[r0 + 20] = Int8(r1)
    heapClassInst.heap32[(r2 + 4)] = 0
    heapClassInst.heap32[(r2 + 2)] = 0
    heapClassInst.heap32[(r2 + 3)] = 0
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

@OverflowWrapping
func _ZNK20btAxisSweep3InternalItE7getAabbEP17btBroadphaseProxyR9btVector3S4_(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = Int64(heapClassInst.heap32[(fp + 2)])
    r0 = r0 >> 2
    r1 = r1 >> 2
    heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r0 + 4)]
    heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r0 + 5)]
    r2 = Int64(heapClassInst.heap32[(fp + 3)])
    heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r0 + 6)]
    r2 = r2 >> 2
    heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r0 + 7)]
    heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r0 + 8)]
    heapClassInst.heap32[(r2 + 1)] = heapClassInst.heap32[(r0 + 9)]
    heapClassInst.heap32[(r2 + 2)] = heapClassInst.heap32[(r0 + 10)]
    heapClassInst.heap32[(r2 + 3)] = heapClassInst.heap32[(r0 + 11)]
    return;
}

@OverflowWrapping
func _ZN20btAxisSweep3InternalItE23getOverlappingPairCacheEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0 + 23)])
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZNK20btAxisSweep3InternalItE23getOverlappingPairCacheEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0 + 23)])
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZNK20btAxisSweep3InternalItE17getBroadphaseAabbER9btVector3S2_(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r0 = r0 >> 2
    r1 = r1 >> 2
    heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r0 + 2)]
    heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r0 + 3)]
    r2 = Int64(heapClassInst.heap32[(fp + 2)])
    heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r0 + 4)]
    r2 = r2 >> 2
    heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r0 + 5)]
    heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r0 + 6)]
    heapClassInst.heap32[(r2 + 1)] = heapClassInst.heap32[(r0 + 7)]
    heapClassInst.heap32[(r2 + 2)] = heapClassInst.heap32[(r0 + 8)]
    heapClassInst.heap32[(r2 + 3)] = heapClassInst.heap32[(r0 + 9)]
    return;
}

@OverflowWrapping
func _ZN20btAxisSweep3InternalItE9resetPoolEP12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = Int64(heapClassInst.heapU16[(r0 + 56) >> 1])
    if (!(r1 != 0)) {
        r1 = 1
        heapClassInst.heap16[(r0 + 64) >> 1] = Int16(r1)
        r2 = Int64(heapClassInst.heapU16[(r0 + 58) >> 1])
        if (`UIntNative`(r2) > `UIntNative`(1)) {
            r3 = 2
            while (true) {
                r2 = r1 & 65535
                r4 = r0 >> 2
                r2 = r2 << 6
                r4 = Int64(heapClassInst.heap32[(r4 + 15)])
                r2 = (r4 + r2) | 0
                heapClassInst.heap16[(r2 + 48) >> 1] = Int16(r3)
                r1 = (r1 + 1) | 0
                r2 = Int64(heapClassInst.heapU16[(r0 + 58) >> 1])
                r3 = (r3 + 1) | 0
                r4 = r1 & 65535
                if (!(`UIntNative`(r2) > `UIntNative`(r4))) {
                    break
                }
            }
        }
        r1 = r2 & 65535
        r0 = r0 >> 2
        r1 = r1 << 6
        r0 = Int64(heapClassInst.heap32[(r0 + 15)])
        r0 = (r1 + r0) | 0
        r1 = 0
        heapClassInst.heap16[(r0 + (-16)) >> 1] = Int16(r1)
    }
    return;
}

@OverflowWrapping
func _ZN20btAxisSweep3InternalItE10printStatsEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

@OverflowWrapping
func _ZN20btAxisSweep3InternalItE8aabbTestERK9btVector3S3_R24btBroadphaseAabbCallback(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r1 + 27)])
    r3 = Int64(heapClassInst.heap32[(fp + 1)])
    r4 = Int64(heapClassInst.heap32[(fp + 2)])
    r5 = Int64(heapClassInst.heap32[(fp + 3)])
    if (r2 != 0) {
        r0 = r2 >> 2
        r0 = Int64(heapClassInst.heap32[(r0)])
        r0 = r0 >> 2
        r0 = Int64(heapClassInst.heap32[(r0 + 7)])
        heapClassInst.heap32[(g0)] = Int32(r2)
        heapClassInst.heap32[(g0 + 1)] = Int32(r3)
        heapClassInst.heap32[(g0 + 2)] = Int32(r4)
        heapClassInst.heap32[(g0 + 3)] = Int32(r5)
        __FUNCTION_TABLE__[(r0) >> 2](i7);
        return;
    } else {
        r2 = Int64(heapClassInst.heapU16[(r0 + 56) >> 1])
        r2 = r2 << 1
        r2 = r2 | 1
        if (!(r2 == 1)) {
            r2 = 1
            r6 = 2
            while (true) {
                r7 = r6
                r6 = r2 & 65535
                r8 = Int64(heapClassInst.heap32[(r1 + 17)])
                r6 = r6 << 2
                r9 = Int64(heapClassInst.heapU8[r8 + r6])
                r9 = r9 & 1
                if (!(r9 == 0)) {
                    r6 = (r8 + r6) | 0
                    r6 = Int64(heapClassInst.heapU16[(r6 + 2) >> 1])
                    r8 = Int64(heapClassInst.heap32[(r1 + 15)])
                    r6 = r6 << 6
                    r6 = (r8 + r6) | 0
                    r8 = r3 >> 2
                    r9 = r6 >> 2
                    f0 = Float64(heapClassInst.heapFloat[(r8)])
                    f1 = Float64(heapClassInst.heapFloat[(r9 + 8)])
                    if (f0 > f1) {
                        __label__ = 8
                    } else {
                        r10 = r4 >> 2
                        f0 = Float64(heapClassInst.heapFloat[(r10)])
                        f1 = Float64(heapClassInst.heapFloat[(r9 + 4)])
                        if (f0 < f1) {
                            __label__ = 8
                        } else {
                            r10 = 1
                            __label__ = 9
                        }
                    }
                    if (__label__ == 8) {
                        r10 = 0
                    }
                    f0 = Float64(heapClassInst.heapFloat[(r8 + 2)])
                    f1 = Float64(heapClassInst.heapFloat[(r9 + 10)])
                    if (f0 > f1) {
                        __label__ = 11
                    } else {
                        r11 = r4 >> 2
                        f0 = Float64(heapClassInst.heapFloat[(r11 + 2)])
                        f1 = Float64(heapClassInst.heapFloat[(r9 + 6)])
                        if (f0 < f1) {
                            __label__ = 11
                        } else {
                            __label__ = 12
                        }
                    }
                    if (__label__ == 11) {
                        r10 = 0
                    }
                    f0 = Float64(heapClassInst.heapFloat[(r8 + 1)])
                    f1 = Float64(heapClassInst.heapFloat[(r9 + 9)])
                    if (!(f0 > f1)) {
                        r8 = r4 >> 2
                        f0 = Float64(heapClassInst.heapFloat[(r8 + 1)])
                        f1 = Float64(heapClassInst.heapFloat[(r9 + 5)])
                        if (!(f0 < f1)) {
                            r8 = r10 & 255
                            if (!(r8 == 0)) {
                                r8 = r5 >> 2
                                r8 = Int64(heapClassInst.heap32[(r8)])
                                r8 = r8 >> 2
                                r8 = Int64(heapClassInst.heap32[(r8 + 2)])
                                heapClassInst.heap32[(g0)] = Int32(r5)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r6)
                                __FUNCTION_TABLE__[(r8) >> 2](i7);
                            }
                        }
                    }
                }
                r8 = Int64(heapClassInst.heapU16[(r0 + 56) >> 1])
                r6 = (r7 + 1) | 0
                r2 = (r2 + 1) | 0
                r8 = r8 << 1
                r7 = r7 & 65535
                r8 = r8 | 1
                if (!(`UIntNative`(r7) < `UIntNative`(r8))) {
                    break
                }
            }
        }
        return;
    }
}

@OverflowWrapping
func _ZN20btAxisSweep3InternalItE7rayTestERK9btVector3S3_R23btBroadphaseRayCallbackS3_S3_(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-24)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r1 + 27)])
    r3 = Int64(heapClassInst.heap32[(fp + 3)])
    if (r2 != 0) {
        r0 = Int64(heapClassInst.heap32[(fp + 1)])
        r1 = Int64(heapClassInst.heap32[(fp + 2)])
        r4 = Int64(heapClassInst.heap32[(fp + 4)])
        r5 = Int64(heapClassInst.heap32[(fp + 5)])
        r6 = r2 >> 2
        r6 = Int64(heapClassInst.heap32[(r6)])
        r6 = r6 >> 2
        r6 = Int64(heapClassInst.heap32[(r6 + 6)])
        heapClassInst.heap32[(g0)] = Int32(r2)
        heapClassInst.heap32[(g0 + 1)] = Int32(r0)
        heapClassInst.heap32[(g0 + 2)] = Int32(r1)
        heapClassInst.heap32[(g0 + 3)] = Int32(r3)
        heapClassInst.heap32[(g0 + 4)] = Int32(r4)
        heapClassInst.heap32[(g0 + 5)] = Int32(r5)
        __FUNCTION_TABLE__[(r6) >> 2](i7);
        return;
    } else {
        r2 = Int64(heapClassInst.heapU16[(r0 + 56) >> 1])
        r2 = r2 << 1
        r2 = r2 | 1
        if (!(r2 == 1)) {
            r2 = 1
            r4 = 2
            while (true) {
                r5 = r2 & 65535
                r6 = Int64(heapClassInst.heap32[(r1 + 17)])
                r5 = r5 << 2
                r7 = Int64(heapClassInst.heapU8[r6 + r5])
                r7 = r7 & 1
                if (!(r7 == 0)) {
                    r7 = r3 >> 2
                    r7 = Int64(heapClassInst.heap32[(r7)])
                    r7 = r7 >> 2
                    r5 = (r6 + r5) | 0
                    r5 = Int64(heapClassInst.heapU16[(r5 + 2) >> 1])
                    r6 = Int64(heapClassInst.heap32[(r7 + 2)])
                    r7 = Int64(heapClassInst.heap32[(r1 + 15)])
                    r5 = r5 << 6
                    r5 = (r7 + r5) | 0
                    heapClassInst.heap32[(g0)] = Int32(r3)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r5)
                    __FUNCTION_TABLE__[(r6) >> 2](i7);
                }
                r5 = Int64(heapClassInst.heapU16[(r0 + 56) >> 1])
                r6 = (r4 + 1) | 0
                r2 = (r2 + 1) | 0
                r5 = r5 << 1
                r7 = r4 & 65535
                r5 = r5 | 1
                r4 = r6
                if (!(`UIntNative`(r7) < `UIntNative`(r5))) {
                    break
                }
            }
        }
        return;
    }
}

@OverflowWrapping
func _ZN20btAxisSweep3InternalItE9sortMaxUpEitP12btDispatcherb(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var r16: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = Int64(heapClassInst.heap32[(fp)])
    r2 = r0 << 2
    r2 = (r1 + r2) | 0
    r2 = r2 >> 2
    r3 = Int64(heapClassInst.heap32[(fp + 2)])
    r4 = 1
    r2 = Int64(heapClassInst.heap32[(r2 + 17)])
    r3 = r3 << 2
    r2 = (r2 + r3) | 0
    r3 = r4 << r0
    r3 = r3 & 3
    r1 = r1 >> 2
    r5 = Int64(heapClassInst.heapU16[(r2 + 2) >> 1])
    r4 = r4 << r3
    r6 = Int64(heapClassInst.heap32[(r1 + 15)])
    r5 = r5 << 6
    r4 = r4 & 3
    r5 = (r6 + r5) | 0
    r3 = r3 << 1
    r6 = (r5 + 48) | 0
    r4 = r4 << 1
    r5 = (r5 + 54) | 0
    r0 = r0 << 1
    r7 = Int64(heapClassInst.heap32[(fp + 3)])
    r8 = (r5 + r3) | 0
    r9 = (r6 + r3) | 0
    r10 = (r5 + r4) | 0
    r6 = (r6 + r4) | 0
    r5 = (r5 + r0) | 0
    r2 = (r2 + 4) | 0
    while (true) {
        r11 = Int64(heapClassInst.heapU16[(r2 + 2) >> 1])
        if (r11 == 0) {
            break
        } else {
            r12 = Int64(heapClassInst.heapU16[(r2) >> 1])
            r13 = Int64(heapClassInst.heapU16[(r2 + (-4)) >> 1])
            if (`UIntNative`(r13) >= `UIntNative`(r12)) {
                r13 = Int64(heapClassInst.heap32[(r1 + 15)])
                r11 = r11 & 65535
                r12 = r12 & 1
                if (r12 != 0) {
                    r11 = r11 << 6
                    r11 = (r13 + r11) | 0
                    r11 = (r11 + r0) | 0
                    r12 = Int64(heapClassInst.heapU16[(r11 + 54) >> 1])
                    r12 = (r12 + (-1)) | 0
                    heapClassInst.heap16[(r11 + 54) >> 1] = Int16(r12)
                } else {
                    if (!(r7 == 0)) {
                        r12 = r11 << 6
                        r12 = (r13 + r12) | 0
                        r14 = (r12 + r3) | 0
                        r15 = Int64(heapClassInst.heapU16[(r8) >> 1])
                        r16 = Int64(heapClassInst.heapU16[(r14 + 48) >> 1])
                        if (!(`UIntNative`(r15) < `UIntNative`(r16))) {
                            r14 = Int64(heapClassInst.heapU16[(r14 + 54) >> 1])
                            r15 = Int64(heapClassInst.heapU16[(r9) >> 1])
                            if (!(`UIntNative`(r14) < `UIntNative`(r15))) {
                                r14 = (r12 + r4) | 0
                                r15 = Int64(heapClassInst.heapU16[(r10) >> 1])
                                r16 = Int64(heapClassInst.heapU16[(r14 + 48) >> 1])
                                if (!(`UIntNative`(r15) < `UIntNative`(r16))) {
                                    r14 = Int64(heapClassInst.heapU16[(r14 + 54) >> 1])
                                    r15 = Int64(heapClassInst.heapU16[(r6) >> 1])
                                    if (!(`UIntNative`(r14) < `UIntNative`(r15))) {
                                        r14 = Int64(heapClassInst.heap32[(r1 + 23)])
                                        r15 = r14 >> 2
                                        r15 = Int64(heapClassInst.heap32[(r15)])
                                        r15 = r15 >> 2
                                        r16 = Int64(heapClassInst.heapU16[(r2 + (-2)) >> 1])
                                        r15 = Int64(heapClassInst.heap32[(r15 + 2)])
                                        r16 = r16 << 6
                                        r16 = (r13 + r16) | 0
                                        heapClassInst.heap32[(g0)] = Int32(r14)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r16)
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r12)
                                        __FUNCTION_TABLE__[(r15) >> 2](i7);
                                        r14 = Int64(heapClassInst.heap32[(r1 + 24)])
                                        if (!(r14 == 0)) {
                                            r15 = r14 >> 2
                                            r15 = Int64(heapClassInst.heap32[(r15)])
                                            r15 = r15 >> 2
                                            r15 = Int64(heapClassInst.heap32[(r15 + 2)])
                                            heapClassInst.heap32[(g0)] = Int32(r14)
                                            heapClassInst.heap32[(g0 + 1)] = Int32(r16)
                                            heapClassInst.heap32[(g0 + 2)] = Int32(r12)
                                            __FUNCTION_TABLE__[(r15) >> 2](i7);
                                        }
                                    }
                                }
                            }
                        }
                    }
                    r11 = r11 << 6
                    r11 = (r13 + r11) | 0
                    r11 = (r11 + r0) | 0
                    r12 = Int64(heapClassInst.heapU16[(r11 + 48) >> 1])
                    r12 = (r12 + (-1)) | 0
                    heapClassInst.heap16[(r11 + 48) >> 1] = Int16(r12)
                }
                r11 = Int64(heapClassInst.heapU16[(r5) >> 1])
                r11 = (r11 + 1) | 0
                heapClassInst.heap16[(r5) >> 1] = Int16(r11)
                r11 = Int64(heapClassInst.heapU16[(r2 + (-2)) >> 1])
                r12 = Int64(heapClassInst.heapU16[(r2 + (-4)) >> 1])
                r13 = Int64(heapClassInst.heapU16[(r2 + 2) >> 1])
                r14 = Int64(heapClassInst.heapU16[(r2) >> 1])
                heapClassInst.heap16[(r2 + (-4)) >> 1] = Int16(r14)
                heapClassInst.heap16[(r2 + (-2)) >> 1] = Int16(r13)
                r13 = (r2 + 4) | 0
                heapClassInst.heap16[(r2) >> 1] = Int16(r12)
                heapClassInst.heap16[(r2 + 2) >> 1] = Int16(r11)
                r2 = r13
                continue
            } else {
                break
            }
        }
    }
    return;
}

@OverflowWrapping
func _ZN20btAxisSweep3InternalItE9sortMinUpEitP12btDispatcherb(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = Int64(heapClassInst.heap32[(fp)])
    r2 = r0 << 2
    r2 = (r1 + r2) | 0
    r2 = r2 >> 2
    r3 = Int64(heapClassInst.heap32[(fp + 2)])
    r2 = Int64(heapClassInst.heap32[(r2 + 17)])
    r3 = r3 << 2
    r2 = (r2 + r3) | 0
    r1 = r1 >> 2
    r3 = Int64(heapClassInst.heapU16[(r2 + 2) >> 1])
    r4 = 1
    r5 = r4 << r0
    r6 = Int64(heapClassInst.heap32[(r1 + 15)])
    r3 = r3 << 6
    r5 = r5 & 3
    r3 = (r6 + r3) | 0
    r0 = r0 << 1
    r3 = (r3 + r0) | 0
    r4 = r4 << r5
    r6 = Int64(heapClassInst.heap32[(fp + 3)])
    r7 = Int64(heapClassInst.heap32[(fp + 4)])
    r3 = (r3 + 48) | 0
    r4 = r4 & 3
    r2 = (r2 + 4) | 0
    while (true) {
        r8 = Int64(heapClassInst.heapU16[(r2 + 2) >> 1])
        if (r8 == 0) {
            break
        } else {
            r9 = Int64(heapClassInst.heapU16[(r2) >> 1])
            r10 = Int64(heapClassInst.heapU16[(r2 + (-4)) >> 1])
            if (`UIntNative`(r10) >= `UIntNative`(r9)) {
                r10 = Int64(heapClassInst.heap32[(r1 + 15)])
                r8 = r8 & 65535
                r9 = r9 & 1
                if (r9 == 0) {
                    r8 = r8 << 6
                    r8 = (r10 + r8) | 0
                    r8 = (r8 + r0) | 0
                    r9 = Int64(heapClassInst.heapU16[(r8 + 48) >> 1])
                    r9 = (r9 + (-1)) | 0
                    heapClassInst.heap16[(r8 + 48) >> 1] = Int16(r9)
                } else {
                    if (!(r7 == 0)) {
                        r9 = Int64(heapClassInst.heapU16[(r2 + (-2)) >> 1])
                        r9 = r9 << 6
                        r11 = r8 << 6
                        r9 = (r10 + r9) | 0
                        r12 = r5 << 1
                        r11 = (r10 + r11) | 0
                        r13 = (r9 + r12) | 0
                        r12 = (r11 + r12) | 0
                        r14 = Int64(heapClassInst.heapU16[(r13 + 54) >> 1])
                        r15 = Int64(heapClassInst.heapU16[(r12 + 48) >> 1])
                        if (!(`UIntNative`(r14) < `UIntNative`(r15))) {
                            r12 = Int64(heapClassInst.heapU16[(r12 + 54) >> 1])
                            r13 = Int64(heapClassInst.heapU16[(r13 + 48) >> 1])
                            if (!(`UIntNative`(r12) < `UIntNative`(r13))) {
                                r12 = r4 << 1
                                r13 = (r9 + r12) | 0
                                r12 = (r11 + r12) | 0
                                r14 = Int64(heapClassInst.heapU16[(r13 + 54) >> 1])
                                r15 = Int64(heapClassInst.heapU16[(r12 + 48) >> 1])
                                if (!(`UIntNative`(r14) < `UIntNative`(r15))) {
                                    r12 = Int64(heapClassInst.heapU16[(r12 + 54) >> 1])
                                    r13 = Int64(heapClassInst.heapU16[(r13 + 48) >> 1])
                                    if (!(`UIntNative`(r12) < `UIntNative`(r13))) {
                                        r12 = Int64(heapClassInst.heap32[(r1 + 23)])
                                        r13 = r12 >> 2
                                        r13 = Int64(heapClassInst.heap32[(r13)])
                                        r13 = r13 >> 2
                                        r13 = Int64(heapClassInst.heap32[(r13 + 3)])
                                        heapClassInst.heap32[(g0)] = Int32(r12)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r9)
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r11)
                                        heapClassInst.heap32[(g0 + 3)] = Int32(r6)
                                        __FUNCTION_TABLE__[(r13) >> 2](i7);
                                        r12 = Int64(heapClassInst.heap32[(r1 + 24)])
                                        if (!(r12 == 0)) {
                                            r13 = r12 >> 2
                                            r13 = Int64(heapClassInst.heap32[(r13)])
                                            r13 = r13 >> 2
                                            r13 = Int64(heapClassInst.heap32[(r13 + 3)])
                                            heapClassInst.heap32[(g0)] = Int32(r12)
                                            heapClassInst.heap32[(g0 + 1)] = Int32(r9)
                                            heapClassInst.heap32[(g0 + 2)] = Int32(r11)
                                            heapClassInst.heap32[(g0 + 3)] = Int32(r6)
                                            __FUNCTION_TABLE__[(r13) >> 2](i7);
                                        }
                                    }
                                }
                            }
                        }
                    }
                    r8 = r8 << 6
                    r8 = (r10 + r8) | 0
                    r8 = (r8 + r0) | 0
                    r9 = Int64(heapClassInst.heapU16[(r8 + 54) >> 1])
                    r9 = (r9 + (-1)) | 0
                    heapClassInst.heap16[(r8 + 54) >> 1] = Int16(r9)
                }
                r8 = Int64(heapClassInst.heapU16[(r3) >> 1])
                r8 = (r8 + 1) | 0
                heapClassInst.heap16[(r3) >> 1] = Int16(r8)
                r8 = Int64(heapClassInst.heapU16[(r2 + (-2)) >> 1])
                r9 = Int64(heapClassInst.heapU16[(r2 + (-4)) >> 1])
                r10 = Int64(heapClassInst.heapU16[(r2 + 2) >> 1])
                r11 = Int64(heapClassInst.heapU16[(r2) >> 1])
                heapClassInst.heap16[(r2 + (-4)) >> 1] = Int16(r11)
                heapClassInst.heap16[(r2 + (-2)) >> 1] = Int16(r10)
                r10 = (r2 + 4) | 0
                heapClassInst.heap16[(r2) >> 1] = Int16(r9)
                heapClassInst.heap16[(r2 + 2) >> 1] = Int16(r8)
                r2 = r10
                continue
            } else {
                break
            }
        }
    }
    return;
}

@OverflowWrapping
func _ZN20btAxisSweep3InternalItE7setAabbEP17btBroadphaseProxyRK9btVector3S5_P12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var r16: Int64 = 0
    var r17: Int64 = 0
    var r18: Int64 = 0
    var r19: Int64 = 0
    var r20: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-40)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 2)])
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r2 = r0 >> 2
    r3 = r1 >> 2
    heapClassInst.heap32[(r3 + 4)] = heapClassInst.heap32[(r2)]
    heapClassInst.heap32[(r3 + 5)] = heapClassInst.heap32[(r2 + 1)]
    r4 = Int64(heapClassInst.heap32[(fp + 3)])
    heapClassInst.heap32[(r3 + 6)] = heapClassInst.heap32[(r2 + 2)]
    heapClassInst.heap32[(r3 + 7)] = heapClassInst.heap32[(r2 + 3)]
    r5 = r4 >> 2
    heapClassInst.heap32[(r3 + 8)] = heapClassInst.heap32[(r5)]
    heapClassInst.heap32[(r3 + 9)] = heapClassInst.heap32[(r5 + 1)]
    r6 = Int64(heapClassInst.heap32[(fp)])
    heapClassInst.heap32[(r3 + 10)] = heapClassInst.heap32[(r5 + 2)]
    heapClassInst.heap32[(r3 + 11)] = heapClassInst.heap32[(r5 + 3)]
    r7 = r6 >> 2
    r1 = Int64(heapClassInst.heapU16[(r1 + 12) >> 1])
    r8 = Int64(heapClassInst.heap32[(r7 + 15)])
    f0 = Float64(heapClassInst.heapFloat[(r2)])
    f1 = Float64(heapClassInst.heapFloat[(r2 + 1)])
    f2 = Float64(heapClassInst.heapFloat[(r2 + 2)])
    r2 = sp + (-6)
    heapClassInst.heap32[(g0)] = Int32(r6)
    heapClassInst.heap32[(g0 + 1)] = Int32(r2)
    heapClassInst.heapFloat[(g0 + 2)] = Float32(f0)
    heapClassInst.heapFloat[(g0 + 3)] = Float32(f1)
    heapClassInst.heapFloat[(g0 + 4)] = Float32(f2)
    heapClassInst.heap32[(g0 + 5)] = 0
    _ZNK20btAxisSweep3InternalItE8quantizeEPtRK9btVector3i(i7);
    f0 = Float64(heapClassInst.heapFloat[(r5)])
    f1 = Float64(heapClassInst.heapFloat[(r5 + 1)])
    f2 = Float64(heapClassInst.heapFloat[(r5 + 2)])
    r1 = r1 << 6
    r5 = sp + (-12)
    r1 = (r8 + r1) | 0
    heapClassInst.heap32[(g0)] = Int32(r6)
    heapClassInst.heap32[(g0 + 1)] = Int32(r5)
    heapClassInst.heapFloat[(g0 + 2)] = Float32(f0)
    heapClassInst.heapFloat[(g0 + 3)] = Float32(f1)
    heapClassInst.heapFloat[(g0 + 4)] = Float32(f2)
    heapClassInst.heap32[(g0 + 5)] = 1
    r8 = Int64(heapClassInst.heap32[(fp + 4)])
    r1 = (r1 + 48) | 0
    r9 = 0
    _ZNK20btAxisSweep3InternalItE8quantizeEPtRK9btVector3i(i7);
    r10 = r9
    while (true) {
        r11 = r9 << 2
        r12 = r9 << 1
        r13 = (r1 - r12) | 0
        r11 = (r6 - r11) | 0
        r14 = Int64(heapClassInst.heapU16[(r13) >> 1])
        r13 = Int64(heapClassInst.heapU16[(r13 + 6) >> 1])
        r11 = r11 >> 2
        r15 = (r2 - r12) | 0
        r12 = (r5 - r12) | 0
        r16 = Int64(heapClassInst.heap32[(r11 + 17)])
        r17 = r14 << 2
        r18 = r13 << 2
        r15 = Int64(heapClassInst.heapU16[(r15) >> 1])
        r19 = Int64(heapClassInst.heapU16[(r16 + r17) >> 1])
        r20 = Int64(heapClassInst.heapU16[(r16 + r18) >> 1])
        r12 = Int64(heapClassInst.heapU16[(r12) >> 1])
        heapClassInst.heap16[(r16 + r17) >> 1] = Int16(r15)
        r11 = Int64(heapClassInst.heap32[(r11 + 17)])
        r15 = (r15 - r19) | 0
        heapClassInst.heap16[(r11 + r18) >> 1] = Int16(r12)
        if (!(r15 > (-1))) {
            heapClassInst.heap32[(g0)] = Int32(r6)
            heapClassInst.heap32[(g0 + 1)] = Int32(r10)
            heapClassInst.heap32[(g0 + 2)] = Int32(r14)
            heapClassInst.heap32[(g0 + 3)] = 1
            _ZN20btAxisSweep3InternalItE11sortMinDownEitP12btDispatcherb(i7);
        }
        r11 = (r12 - r20) | 0
        if (!(r11 < 1)) {
            heapClassInst.heap32[(g0)] = Int32(r6)
            heapClassInst.heap32[(g0 + 1)] = Int32(r10)
            heapClassInst.heap32[(g0 + 2)] = Int32(r13)
            heapClassInst.heap32[(g0 + 3)] = 1
            _ZN20btAxisSweep3InternalItE9sortMaxUpEitP12btDispatcherb(i7);
        }
        if (!(r15 < 1)) {
            heapClassInst.heap32[(g0)] = Int32(r6)
            heapClassInst.heap32[(g0 + 1)] = Int32(r10)
            heapClassInst.heap32[(g0 + 2)] = Int32(r14)
            heapClassInst.heap32[(g0 + 3)] = Int32(r8)
            heapClassInst.heap32[(g0 + 4)] = 1
            _ZN20btAxisSweep3InternalItE9sortMinUpEitP12btDispatcherb(i7);
        }
        if (!(r11 > (-1))) {
            heapClassInst.heap32[(g0)] = Int32(r6)
            heapClassInst.heap32[(g0 + 1)] = Int32(r10)
            heapClassInst.heap32[(g0 + 2)] = Int32(r13)
            heapClassInst.heap32[(g0 + 3)] = Int32(r8)
            heapClassInst.heap32[(g0 + 4)] = 1
            _ZN20btAxisSweep3InternalItE11sortMaxDownEitP12btDispatcherb(i7);
        }
        r9 = (r9 + (-1)) | 0
        r10 = (r10 + 1) | 0
        if (r9 != (-3)) {
            continue
        } else {
            break
        }
    }
    r1 = Int64(heapClassInst.heap32[(r7 + 27)])
    if (!(r1 == 0)) {
        r2 = r1 >> 2
        r2 = Int64(heapClassInst.heap32[(r2)])
        r2 = r2 >> 2
        r2 = Int64(heapClassInst.heap32[(r2 + 4)])
        r3 = Int64(heapClassInst.heap32[(r3 + 15)])
        heapClassInst.heap32[(g0)] = Int32(r1)
        heapClassInst.heap32[(g0 + 1)] = Int32(r3)
        heapClassInst.heap32[(g0 + 2)] = Int32(r0)
        heapClassInst.heap32[(g0 + 3)] = Int32(r4)
        heapClassInst.heap32[(g0 + 4)] = Int32(r8)
        __FUNCTION_TABLE__[(r2) >> 2](i7);
    }
    return;
}

@OverflowWrapping
func _ZN20btAxisSweep3InternalItE12destroyProxyEP17btBroadphaseProxyP12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-24)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r1 + 27)])
    r3 = Int64(heapClassInst.heap32[(fp + 1)])
    r4 = Int64(heapClassInst.heap32[(fp + 2)])
    if (!(r2 == 0)) {
        r5 = r2 >> 2
        r5 = Int64(heapClassInst.heap32[(r5)])
        r5 = r5 >> 2
        r6 = r3 >> 2
        r5 = Int64(heapClassInst.heap32[(r5 + 3)])
        r6 = Int64(heapClassInst.heap32[(r6 + 15)])
        heapClassInst.heap32[(g0)] = Int32(r2)
        heapClassInst.heap32[(g0 + 1)] = Int32(r6)
        heapClassInst.heap32[(g0 + 2)] = Int32(r4)
        __FUNCTION_TABLE__[(r5) >> 2](i7);
    }
    r2 = Int64(heapClassInst.heap32[(r1 + 23)])
    r5 = r2 >> 2
    r5 = Int64(heapClassInst.heap32[(r5)])
    r5 = r5 >> 2
    r3 = r3 >> 2
    r3 = Int64(heapClassInst.heap32[(r3 + 3)])
    r6 = Int64(heapClassInst.heap32[(r1 + 15)])
    r5 = Int64(heapClassInst.heap32[(r5 + 14)])
    heapClassInst.heap32[(g0)] = Int32(r2)
    __FUNCTION_TABLE__[(r5) >> 2](i7);
    r2 = commonVariable.r_g0
    if (!(r2 != 0)) {
        r2 = Int64(heapClassInst.heap32[(r1 + 23)])
        r5 = r2 >> 2
        r5 = Int64(heapClassInst.heap32[(r5)])
        r5 = r5 >> 2
        r5 = Int64(heapClassInst.heap32[(r5 + 4)])
        r7 = r3 & 65535
        r7 = r7 << 6
        r7 = (r6 + r7) | 0
        heapClassInst.heap32[(g0)] = Int32(r2)
        heapClassInst.heap32[(g0 + 1)] = Int32(r7)
        heapClassInst.heap32[(g0 + 2)] = Int32(r4)
        __FUNCTION_TABLE__[(r5) >> 2](i7);
    }
    r2 = Int64(heapClassInst.heap32[(r1 + 15)])
    r5 = Int64(heapClassInst.heapU16[(r0 + 56) >> 1])
    r7 = Int64(heapClassInst.heapU16[(r2 + 54) >> 1])
    r7 = (r7 + (-2)) | 0
    heapClassInst.heap16[(r2 + 54) >> 1] = Int16(r7)
    r2 = Int64(heapClassInst.heap32[(r1 + 15)])
    r7 = Int64(heapClassInst.heapU16[(r2 + 56) >> 1])
    r7 = (r7 + (-2)) | 0
    r8 = r3 & 65535
    heapClassInst.heap16[(r2 + 56) >> 1] = Int16(r7)
    r2 = Int64(heapClassInst.heap32[(r1 + 15)])
    r7 = r8 << 6
    r9 = Int64(heapClassInst.heapU16[(r2 + 58) >> 1])
    r6 = (r6 + r7) | 0
    r5 = r5 << 1
    r6 = (r6 + 54) | 0
    r10 = 0
    r9 = (r9 + (-2)) | 0
    heapClassInst.heap16[(r2 + 58) >> 1] = Int16(r9)
    r2 = r10
    while (true) {
        r9 = r2 << 2
        r9 = (r0 + r9) | 0
        r9 = r9 >> 2
        r11 = Int64(heapClassInst.heapU16[(r6) >> 1])
        r12 = Int64(heapClassInst.heapU16[(r0 + 6) >> 1])
        r9 = Int64(heapClassInst.heap32[(r9 + 17)])
        r13 = r11 << 2
        heapClassInst.heap16[(r9 + r13) >> 1] = Int16(r12)
        heapClassInst.heap32[(g0)] = Int32(r0)
        heapClassInst.heap32[(g0 + 1)] = Int32(r2)
        heapClassInst.heap32[(g0 + 2)] = Int32(r11)
        heapClassInst.heap32[(g0 + 3)] = 0
        _ZN20btAxisSweep3InternalItE9sortMaxUpEitP12btDispatcherb(i7);
        r11 = Int64(heapClassInst.heapU16[(r6 + (-6)) >> 1])
        r12 = Int64(heapClassInst.heapU16[(r0 + 6) >> 1])
        r13 = r11 << 2
        heapClassInst.heap16[(r9 + r13) >> 1] = Int16(r12)
        heapClassInst.heap32[(g0)] = Int32(r0)
        heapClassInst.heap32[(g0 + 1)] = Int32(r2)
        heapClassInst.heap32[(g0 + 2)] = Int32(r11)
        heapClassInst.heap32[(g0 + 3)] = Int32(r4)
        heapClassInst.heap32[(g0 + 4)] = 0
        r11 = r5 << 2
        _ZN20btAxisSweep3InternalItE9sortMinUpEitP12btDispatcherb(i7);
        r9 = (r9 + r11) | 0
        heapClassInst.heap16[(r9 + (-2)) >> 1] = Int16(r10)
        r11 = Int64(heapClassInst.heapU16[(r0 + 6) >> 1])
        r2 = (r2 + 1) | 0
        r6 = (r6 + 2) | 0
        heapClassInst.heap16[(r9 + (-4)) >> 1] = Int16(r11)
        if (r2 != 3) {
            continue
        } else {
            break
        }
    }
    if (!(r8 == 0)) {
        r2 = Int64(heapClassInst.heapU16[(r0 + 58) >> 1])
        if (`UIntNative`(r2) > `UIntNative`(r8)) {
            r1 = Int64(heapClassInst.heap32[(r1 + 15)])
            r2 = Int64(heapClassInst.heapU16[(r0 + 64) >> 1])
            r1 = (r1 + r7) | 0
            heapClassInst.heap16[(r1 + 48) >> 1] = Int16(r2)
            heapClassInst.heap16[(r0 + 64) >> 1] = Int16(r3)
            r1 = Int64(heapClassInst.heapU16[(r0 + 56) >> 1])
            r1 = (r1 + (-1)) | 0
            heapClassInst.heap16[(r0 + 56) >> 1] = Int16(r1)
            return;
        }
    }
    r0 = _E2_str11
    r1 = _E2_str112
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r1)
    heapClassInst.heap32[(g0 + 2)] = 495
    _assert(i7);
}
