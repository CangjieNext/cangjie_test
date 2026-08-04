/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*
import std.math.*

public var mandreelAppCanvasDiv: String = "canvasDiv";

class HeapValue {
    var l: Int64 = 0
    var h: Int64 = 0
}

class MandreelEmbedPlugin {
    func mandreelInterCalls(str1: String, ptr: Int64, value: Int64): Unit {}
}

class Navigatortype {
    var appName: String = ""
    var userAgent: String = ""
}

var g_mandreel_swf: ?Param = None

open class MandInt {
    func mandreelInterGetSWF(): Param {
        if (g_mandreel_swf.isSome()) {
            return g_mandreel_swf.getOrThrow()
        }
        let g_mandreel_swf = swfObject.getObjectById(mandreelAppCanvasDiv)
        return g_mandreel_swf
    }
}

class GetSwf <: MandInt {
    init() {
        super()
        this.mandreelInterGetSWF()
    }

    func MandreelInterGetGlobalStack(): Int64 {
        return 1
    }

    func MandreelInterGetGlobalStack2(): Int64 {
        return 1
    }

    func MandreelInterCallFunctionRaw(x: Int64, y: String, z: String): String {
        return " "
    }
}

class MandreelXMLHttpRequest {
    var url: String = ""
    var response: ?String = Option<String>.None
    var readyState: ?Int64 = Option<Int64>.None
    var status: ?Int64 = Option<Int64>.None
    var onreadystatechange: (() -> Unit) = {=>}

    init(url: String) {
        this.url = url
    }

    func open(type1: String, url: String, some_bool: Bool): Unit {
        this.url = url
    }

    func overrideMimeType(): Unit {
    }

    func send(): Unit {
        this.response = Option<String>.None
        this.readyState = 4
        this.status = 0
    }
}

class Resxy {
    var x: Int64 = 0
    var y: Int64 = 0
}

class FunClass {
    var funcName: String = ""
    var param: String = ""
    init(funcName: String, param: String) {
        this.funcName = funcName
        this.param = param
    }
}

class READWRITE {
    var READ_WRITE: String = ""
}

public class MandreelindexedDB {
    public var db: ?DB = DB();
    var callback_init: Bool

    init(db: ?DB, callback_init: Bool) {
        this.db = db
        this.callback_init = callback_init
    }

    func onerror(e: String): Unit {
        dump(e)
    }
}

public class DB {
    func transaction(cache: Array<String>, type1: String): Dbtrans {
        return Dbtrans()
    }
}

class Dbtrans {
    func objectStore(cache: String): DbRequest {
        return DbRequest()
    }
}

class DbRequest {
    func put(param: String): Request {
        return Request()
    }

    func get(key: String): Request {
        return Request()
    }
}

class Request {
    func onsuccess(e: String): Unit {
        dump("mandreel_indexedDB.save ok");
    }

    func onerror(e: String, file_name: String): Unit {
        dump("mandreel_indexedDB.save onerror" + file_name);
        dump(e);
    }

    func createObjectStore(name: String, type1: String): Unit {
    }
}

class GetTime {
    func getTime(): Unit {}
}

let mandreelEmbedPlugin: MandreelEmbedPlugin = MandreelEmbedPlugin()
var mandreelPluginCurrentSp: Int64 = 0;
var MANDREEL_HTTP_REQUEST_MODE_GET: Int64 = 0;
var MANDREEL_HTTP_REQUEST_MODE_POST: Int64 = 1;
var MANDREEL_HTTP_REQUEST_MODE_PUT: Int64 = 2;
var MANDREEL_HTTP_REQUEST_STATUS_ERROR: Int64 = 0;
var MANDREEL_HTTP_REQUEST_STATUS_BUSY: Int64 = 1;
var MANDREEL_HTTP_REQUEST_STATUS_FINISHED: Int64 = 2;
var MANDREEL_HTTP_REQUEST_STATUS_INIT: Int64 = 3;
var mandreelJsMappingIdsFree: ArrayList<Int64> = ArrayList()
var myOldConstructors: ?((x: Int64, y: Int64, z: Int64) -> Unit) = Option<(x: Int64, y: Int64, z: Int64) -> Unit>.None
var mandreelAppStartStateFunc: ?((state: String, param: String) -> Unit) = Option<(state: String, param: String) -> Unit>.
    None
var mandreelAppLog: Bool = false;
var mandreelAppWorkingFolder: String = "data/js/";
var mandreelAppWidthSrc: Float64 = 1024.0;
var mandreelAppHeightSrc: Float64 = 768.0;
var mandreelAppReadDataFromLocalHost: Bool = false;
var mandreelAppMandreelJs: String = "mandreel.js";
var mandreelAppMandreelJsCompressed: Bool = false;
var mandreelAppLocalHost: String = "http://localhost";
var mandreelAppReadMandreelJsFromLocalHost: Bool = false;
var mandreelAppHostedAudioServer: ?String = Option<String>.None;
var mandreelAppHostedAudioUrl: ?String = Option<String>.None;
var mandrelCurrentFatVersion: String = "1.4";
var mandreelAppCanvasWidth: Float64 = 1024.0;
var mandreelAppCanvasHeight: Float64 = 768.0;
var mandreelAppCanvasName: String = "canvas";
var mandreelAppUseFlashSockets: Bool = false;
var mandreelAppUsePackAsyncTexture: ArrayList<String> = ArrayList<String>()
var mandreelAppForceFocus: Bool = true;
var imandreelPauseGame: Bool = false;
var mandreelFatPreloadRequest: ?MandreelXMLHttpRequest = Option<MandreelXMLHttpRequest>.None
var mandreelPackfiledataName: ?String = Option<String>.None
var mandreelPackfiledataCompressed: Bool = false
var mandreelPackfiledataSize: Int64 = 0
var mandreelTotalPacktextureSize: Int64 = 0
var mandreelLoadedPacktextureSize: Int64 = 0
var mandreelJslzmaSize: Int64 = 0
var mandreelSwfSize: Int64 = 0
var timeouts: ArrayList<Any> = ArrayList()
var imandreelIsReady: Bool = false
var Mandreeltimeouts: ArrayList<() -> Unit> = ArrayList()
var mandreelJsScriptLoaded_loaded: Bool = false
var mandreelSwfLastTotalSize: Int64 = 0
var mandreelCurrentPackTexture: String = ""
var mandreelUpdateTotalSize: Int64 = 0
var isIEOld: String = ""
var isFireFoxNew: String = ""
var isChrome: String = ""
var imandreelOldTime: Int64 = 0
var imandreelLastMovex: Float64 = 0.0
var imandreelLastMovey: Float64 = 0.0
var mandreelMouseDown: Bool = false
var mandreelRmouseDown: Bool = false
var imandreelCtxCanvas: ?ImandreelCtxCanvas = ImandreelCtxCanvas()
var maxOglId: Int64 = 8192;
var arrayIdsOglEnable: ArrayList<Int64> = ArrayList();
var gCurrentProgramId: Int64 = 0;
var uniformArrays2: ArrayList<Float64> = ArrayList<Float64>();
var uniformArrays3: ArrayList<Float64> = ArrayList<Float64>();
var uniformArrays4: ArrayList<Float64> = ArrayList<Float64>();
var uniformArraysCreated: Int64 = 0;
var mandreelDrawEnable: Bool = true;
var mySuperId: Int64 = 1;
var imandreelFlashGlobalSp: Int64 = 0;
var imandreelFlashGlobalSp2: Int64 = 0;
var imandreelFlashCurrentSp: Int64 = 0;
var indexedDB = (mandreelWindow.indexedDB != 0) || (mandreelWindow.webkitIndexedDB != 0) || (mandreelWindow.mozIndexedDB !=
    0)
let mandreelInterGetSWF: GetSwf = GetSwf()
var IDBTransactions = READWRITE()
var MANDREELCALLJS_TYPE_RETURN_VOID: Int64 = 0
var MANDREELCALLJS_TYPE_INT: Int64 = 1;
var MANDREELCALLJS_TYPE_FLOAT: Int64 = 2;
var MANDREELCALLJS_TYPE_STRING: Int64 = 3;
var MANDREELCALLJS_TYPE_RETURN_INT: Int64 = 4;
var MANDREELCALLJS_TYPE_RETURN_FLOAT: Int64 = 5;
var Mandreel_TextureAsync_textures: Int64 = 0;
var Mandreel_TextureAsync_textures_loaded: Int64 = 0;
var glBufferDataArray: ArrayList<Int64> = ArrayList<Int64>();
var mandreelAsyncCallsMandreel: ArrayList<FunClass> = ArrayList()
var mandreelAsyncCallsJs: ArrayList<FunClass> = ArrayList()
var gMandreelCacheFiles: Bool = false;
var gMandreelFrameLocked: Bool = false;
var gMandreelFrameInframe: Bool = false;
public var mandreelIndexedDB: MandreelindexedDB = MandreelindexedDB(Option<DB>.None, true)

func mandreelLoadFat(): Unit {
    var working_folder = mandreelAppWorkingFolder;
    if (mandreelAppReadDataFromLocalHost) {
        working_folder = mandreelAppLocalHost + "/" + mandreelAppWorkingFolder
    }
    var url = working_folder + "mandreel.fat.dat";
    mandreelFatPreloadRequest = MandreelXMLHttpRequest(url)
    if (commonVariable.mandreelAppPlatform == "nacl") {
        url = working_folder + "mandreel.fat"
    }
    mandreelFatPreloadRequest.getOrThrow().open("GET", url, true);
    mandreelFatPreloadRequest.getOrThrow().onreadystatechange = ({
        =>
        if (mandreelFatPreloadRequest.getOrThrow().readyState != 4) {
            return;
        }
        if (mandreelFatPreloadRequest.getOrThrow().status != 404 &&
            mandreelFatPreloadRequest.getOrThrow().response.isSome()) {
            commonVariable.mandreelFatData = (mandreelFatPreloadRequest.getOrThrow().response).getOrThrow()
        }
        if (commonVariable.mandreelFatData == "") {
            dump("error loading mandreel.fat file, Maybe the working folder is not correctly set???");
        }

        var packfiledata: ?String = Option<String>.None
        var compressed = false;
        var packfiledata_size = 0;
        var total_packtexture_size = 0;
        var pogsize = 0;

        let FatLines = commonVariable.mandreelFatData.split("\n")
        for (i in 0..FatLines.size) {
            let line = mandreel_removecr(FatLines[i]);
            let params = line.split(",");
            if (params[0] == "version") {
                if (params[1] != mandrelCurrentFatVersion) {
                    dump(
                        "warning: mandreel.fat version number is (" + params[1] + ") and it should be (" +
                        mandrelCurrentFatVersion + ")");
                }
            } else if (params[0] == "platform" && params[1] != "js" && (commonVariable.mandreelAppPlatform == "webgl" ||
                commonVariable.mandreelAppPlatform == "canvas")) {
                dump("warning: mandreel.fat platform is (" + params[1] + ") and it should be (js)");
            } else if (params[0] == "platform" && params[1] != "nacl" && commonVariable.mandreelAppPlatform == "nacl") {
                dump("warning: mandreel.fat platform is (" + params[1] + ") and it should be (nacl)");
            } else if (params[0] == "packdata") {
                packfiledata = params[1]
            } else if (params[0] == "flashsockets") {
                mandreelAppUseFlashSockets = true
            } else if (params[0] == "packtexture") {
                let filename = params[1];
                mandreelAppUsePackAsyncTexture.add(filename);
            } else if (params[0] == "audiopreloadfile") {}
            else if (params[0] == "audiodriver" && params[1] == "webaudio") {
            }
        }
        if (variableSet.preCreatedWebAudioContext.isSome()) {
            variableSet.mandreel_total_pogfile_size = pogsize
            mandreelPackfiledataName = packfiledata
            mandreelPackfiledataCompressed = compressed
            mandreelPackfiledataSize = packfiledata_size
            mandreelTotalPacktextureSize = total_packtexture_size
            mandreelFatLoaded();
        }
    })
    mandreelFatPreloadRequest?.send()
}

func mandreelAppStart(startStateFunc: (String, String) -> Unit, params: Param): Unit {
    mandreelAppStartStateFunc = startStateFunc


    mandreelAppLog = params.log
   

    if (params.platform != "") {
        commonVariable.mandreelAppPlatform = params.platform
    }

    if (params.mandreelJSCompressed != false) {
        mandreelAppMandreelJsCompressed = params.mandreelJSCompressed
    }

    if (commonVariable.mandreelAppPlatform != "webgl" && commonVariable.mandreelAppPlatform != "flash" &&
        commonVariable.mandreelAppPlatform != "nacl" && commonVariable.mandreelAppPlatform != "canvas" &&
        commonVariable.mandreelAppPlatform != "plugin") {
        mandreelAppStartStateFunc.getOrThrow()("error", "platform (${commonVariable.mandreelAppPlatform}) not supported"
        );
        return;
    }

    if (commonVariable.mandreelAppPlatform == "webgl" || commonVariable.mandreelAppPlatform == "canvas") {
        mandreelAppWorkingFolder = "data/js/"
        if (!(params.workingFolderWebgl != "")) {
            mandreelAppWorkingFolder = params.workingFolderWebgl
        }

        if (mandreelWindow.Float64Array.size != 0) {
            mandreelAppStartStateFunc.getOrThrow()("error", "Browser unsupported" + "Float64Array not available")
            return;
        }

        let flashElement = mandreelDocument.getElementById("FlashDiv");
        if (flashElement.isSome()) {
            flashElement.getOrThrow().style.visibility = "hidden"
            flashElement.getOrThrow().style.width = "0px"
            flashElement.getOrThrow().style.height = "0px"
        }

        if (params.webglCanvas.isEmpty()) {
            mandreelAppStartStateFunc.getOrThrow()("error", "canvas parameter not found")
            return;
        }
        let canvas = mandreelDocument.getElementById(params.webglCanvas)
        if (canvas.isNone()) {
            mandreelAppStartStateFunc.getOrThrow()("error", "canvas object (" + params.webglCanvas + ") not found");
            return;
        }

      
        canvas.getOrThrow().width = Float64(params.width)
        mandreelAppWidthSrc = Float64(params.width)
       

      
        canvas.getOrThrow().height = Float64(params.height)
        mandreelAppHeightSrc = Float64(params.height)
      
        if (commonVariable.mandreelAppPlatform == "webgl") {}

        if (commonVariable.mandreelAppPlatform == "canvas") {
            imandreelCtxCanvas = canvas.getOrThrow().getContext("2d")
            if (imandreelCtxCanvas.isNone()) {
                mandreelAppStartStateFunc.getOrThrow()("error", "canvas context 2d not found")
                return;
            }
        }
     
    }
    if (commonVariable.mandreelAppPlatform == "flash") {
        mandreelAppWorkingFolder = "data/as3/"
        if (params.workingFolderFlash != "") {
            mandreelAppWorkingFolder = params.workingFolderFlash
        }

        if (!swfObject.hasFlashPlayerVersion("11.2.0")) {
            mandreelAppStartStateFunc.getOrThrow()("error", "flash 11 not found");
            return;
        }

        if (params.flashCanvas != "") {
            mandreelAppStartStateFunc.getOrThrow()("error", "canvas parameter not found");
            return;
        }

        if (true) {
            let canvas = mandreelDocument.getElementById(mandreelAppCanvasDiv)
            if (canvas.isSome()) {
                canvas.getOrThrow().style.visibility = "hidden"
                canvas.getOrThrow().style.width = "0px"
                canvas.getOrThrow().style.height = "0px"
            }
        }

     
        mandreelAppCanvasWidth = Float64(params.width)
      

      
        mandreelAppCanvasHeight = Float64(params.height)
      

        mandreelAppCanvasDiv = params.flashCanvas

        var mandreelSocketsSwf = "mandreel.swf"
        try {
            if (!params.swfFlash.isEmpty()) {
                mandreelSocketsSwf = params.swfFlash
            }

            var my_flashvars = "workingFolder="
            if (params.log == true) {
                my_flashvars += "&log=true"
                my_flashvars += "&width=${params.width}"
                my_flashvars += "&height=${params.height}"
                my_flashvars += "&swfloader=" + mandreelSocketsSwf
            }
            if (params.restore_context == true) {
                my_flashvars += "&restore_context=1"
            }

        
            my_flashvars += "&antialiasing${params.antialiasing}"
         

            if (params.right_click_enable == true) {
                my_flashvars += "&right_click=1"
            }

            if (params.disable_depth == true) {
                my_flashvars += "&disable_depth=1"
            }

            var swfname = "mandreelloader.swf";
            if (params.swfPreloader == false) {
                swfname = mandreelSocketsSwf
            }
        } catch (e: Exception) {
            mandreelAppStartStateFunc.getOrThrow()("error", "exception while loading ${mandreelSocketsSwf}");
            return;
        }

        appStartState("loadingScript", "");
    }
    if (commonVariable.mandreelAppPlatform == "nacl") {
        mandreelAppWorkingFolder = "data/nacl/"

        if (mandreelAppStartStateFunc.isSome()) {
            mandreelAppStartStateFunc.getOrThrow()("loadingFat", "")
        }

        mandreelLoadFat()
    }

    if (commonVariable.mandreelAppPlatform == "plugin") {
        mandreelInitPluginPlatform(params);
    }
}

func startApp(platform!: String = ""): Unit {
    let params: Param = Param(platform)
    mandreelAppStart(appStartState, params)
}

func mandreelAppStartRenderWebGL(): Unit {
    mandreelAppInit();
    imandreelIsReady = true
}

func _mandreelAppStartReady(): Unit {
    if (commonVariable.mandreelAppPlatform == "nacl") {
        wa_initWebAudio();
        mandreel_webAudio_PreloadAssets();
    } else {
        if (mandreelAppStartStateFunc.isSome()) {
            mandreelAppStartRenderWebGL();
            mandreelAppStartStateFunc.getOrThrow()("ready", "${mandreelAppCanvasWidth} ${mandreelAppCanvasHeight}");
        }
    }
}

func _mandreelAppAudioReady(): Unit {
    if (mandreelAppStartStateFunc.isSome()) {
        mandreelAppStartStateFunc.getOrThrow()("audioLoaded", "");
    }
    _mandreelAppStartReady();
}

func setupMandreel(): Unit {
    // if (commonVariable.heapNewPos == 512) {
        register_delegate_Initialize()
        CMalloc.malloc()
    // }
    myOldConstructors = mandreel_call_constructors
    startMandreelTimer();
    startApp();
    _mandreelAppAudioReady();
}

func runMandreel(): Unit {
    tearDownMandreel()
    commonVariable.Mandreel_currentTime = 0
    let sp: Int64 = g_stack_pointer + 800 * 1024
    for (i in 0..(mandreel_total_memory / 4)) {
        heapClassInst.heap32[i] = heapClassInst.my_heap32[i]
    }
    tlsfPtr.tlsf_ptr = 0
    commonVariable.heapNewPos = my_heapNewPos
    myOldConstructors.getOrThrow()(llvm_2E_global_ctors, 5, sp)
    heapClassInst.heapU32[sp >> 2] = 640
    heapClassInst.heapU32[(sp + 4) >> 2] = 480
    __mandreel_internal_SetResolution(sp)
    __mandreel_internal_init(g_stack_pointer + 800 * 1024)
    __init(g_stack_pointer + 800 * 1024)
    for (_ in 0..20) {
        render()
        Mandreel_flushTimeouts()
        updateMandreelStats(Timer().getTime())
    }
    Mandreel_checkState()
}

func startMandreelTimer(): Unit {
    commonVariable.mandreelSampleTimeStart = Timer().getTime()
}

func latencyMandreel(): ArrayList<Float64> {
    return commonVariable.mandreelPauseTimes
}

func tearDownMandreel(): Unit {


    if (commonVariable.heapNewPos != 512) {
        commonVariable.heapNewPos = my_heapNewPos
    } else {
        commonVariable.heapNewPos = 512
    }
    commonVariable.g_addr_emit = 0
    tlsfPtr.tlsf_ptr = 0
    commonVariable.Mandreel_currentTime = 16
    imandreelOldTime = commonVariable.Mandreel_currentTime
}

func Mandreel_setTimeout(cmd: Any, delay: Float64, lzma!: LZMA = LZMA(), b!: Bool = false): Unit {
    timeouts.add(cmd)
}

func Mandreel_flushTimeouts(): Unit {
    while (Mandreeltimeouts.size != 0) {
        var next = Mandreeltimeouts.remove(at: Mandreeltimeouts.size - 1)
        next()
    }
}

func Mandreel_checkState(): Unit {
    var sum: Int64 = 0
    for (i in 0..(heapClassInst.size / 32) : 100) {
        sum = (sum * 3 + Int64(heapClassInst.heap32[i])) & 0xFFFFFF
    }
    deBugLog("sum:${sum}")
    if (sum != 8001026) {
        alert("Check sum mismatch: expected ???, actual ${sum}")
    }
}

func appStartState(state: String, param: String): Unit {
    if (state == "loadingScript") {}

    if (state == "scriptLoaded") {}

    if (state == "loadingData") {}

    if (state == "loadingAudio") {}

    if (state == "audioLoaded") {}

    if (state == "ready") {
        let canvasElement = mandreelDocument.getElementById("loading")
        if (canvasElement.isSome()) {
            canvasElement.getOrThrow().style.visibility = "hidden"
        }
    }

    if (state == "error") {
        alert("${param}");
    }
}

func mandreel_swf_size_loaded(str: String): Unit {
    if (let Some(mandreelAppStartStateFunc1) <- mandreelAppStartStateFunc) {
        mandreelAppStartStateFunc1("scriptLoaded", "");
    }
}

func mandreelNextDecompress(mandreel_result_lzma: LZMA): Unit {
    if (mandreelAppStartStateFunc.isSome()) {
        let totalBytesLeft = mandreel_result_lzma.totalSize - mandreel_result_lzma.remainingBytes
        var percentage: Int64
        if (totalBytesLeft == 0) {
            percentage = 0
        } else {
            percentage = (100 * totalBytesLeft) / mandreel_result_lzma.totalSize
        }
        mandreelAppStartStateFunc.getOrThrow()("uncompressingDataUpdate", "${percentage}")
    }

    let old_result = mandreel_result_lzma

    var mandreel_result_lzma1 = lzMA.decompress2(mandreel_result_lzma.inStream, mandreel_result_lzma.inStream,
        mandreel_result_lzma.outStream, mandreel_result_lzma)

    //if (mandreel_result_lzma1 != nil) {
    Mandreel_setTimeout(mandreelNextDecompress, 10.0, lzma: mandreel_result_lzma);
    //}
}

func mandreelJsScriptLoaded(): Unit {
    if (mandreelJsScriptLoaded_loaded == true) {
        return
    }

    if (mandreel_cache_files.size == 0) {
        Mandreel_setTimeout(mandreelJsScriptLoaded, 10.0)
        return
    }

    mandreelJsScriptLoaded_loaded = true

    if (mandreelAppStartStateFunc.isSome()) {
        mandreelAppStartStateFunc.getOrThrow()("scriptLoaded", "")
    }

    if (mandreelPackfiledataName != Option<String>.None) {}
    else {
        imandreelJsScriptLoaded()
    }

}

func imandreelLoadAudio(): Unit {
    commonVariable.g_mandreel_working_folder = mandreelAppWorkingFolder
    if (mandreelAppReadDataFromLocalHost) {
        commonVariable.g_mandreel_working_folder = mandreelAppLocalHost + "/" + mandreelAppWorkingFolder
    }

    if (mandreelAppStartStateFunc.isSome()) {
        mandreelAppStartStateFunc.getOrThrow()("loadingAudio", "")
    }
    mandreel_start_audio(mandreelAppHostedAudioServer.getOrThrow(), mandreelAppHostedAudioUrl.getOrThrow())
}

func imandreel_update_load(size: Int64, total: Int64): Unit {
    var total0 = total
    if (total0 == 0) {
        total0 = mandreelPackfiledataSize + mandreelTotalPacktextureSize + mandreel_total_pogfile_size +
            mandreelJslzmaSize + mandreelSwfSize
    }

    mandreelUpdateTotalSize += size

    var percentage = (100 * mandreelUpdateTotalSize) / total0

    if (percentage > 100) {
        percentage = 100
    }
    if (mandreelAppStartStateFunc.isSome()) {
        mandreelAppStartStateFunc.getOrThrow()("loadingProgress", "${percentage}")
    }
}

func imandreelLoadNextTexturePack(): Unit {
    if (mandreelAppUsePackAsyncTexture.size != 0) {
        mandreelCurrentPackTexture = mandreelAppUsePackAsyncTexture.remove(at: mandreelAppUsePackAsyncTexture.size - 1)
    } else {
        imandreelLoadAudio()
    }
}

func imandreelJsScriptLoaded(): Unit {
    imandreelLoadNextTexturePack()
}

func mandreelDecompressJSReady(code: String, save_file: Bool): Unit {
    if (save_file == true) {
        mandreel_fs_saveFile(mandreelAppMandreelJs + ".lzma", code)
    }

    let ga = mandreelDocument.createElement("script")
    ga.type_ = "text/javascript"
    ga.text = code

    let s = mandreelDocument.getElementsByTagName("script")[0]
    s.parentNode.getOrThrow().insertBefore(ga, s)
    s.parentNode.getOrThrow().removeChild(ga)

    mandreelJsScriptLoaded()
}

func mandreel_load_compressed_js(code_js: ?String): Unit {
}

func mandreelLoadMandreelJsScript(): Unit {
    if (mandreelAppMandreelJsCompressed) {
        mandreel_fs_load_text(mandreelAppMandreelJs + ".lzma", mandreel_load_compressed_js);
    } else {
        let ga = mandreelDocument.createElement("script");
        ga.type_ = "text/javascript"
        ga.async = true
        let url = mandreelAppMandreelJs;
        if (mandreelAppReadMandreelJsFromLocalHost) {
            ga.src = mandreelAppLocalHost + "/" + url
        } else {
            ga.src = url
        }
        let s = mandreelDocument.getElementsByTagName("script")[0];
        if (mandreelAppStartStateFunc.isSome()) {
            mandreelAppStartStateFunc.getOrThrow()("loadingScript", "");
        }
        s.parentNode.getOrThrow().insertBefore(ga, s);
    }
}

func mandreelFatLoaded(): Unit {
    if (commonVariable.mandreelAppPlatform == "nacl") {
        commonVariable.g_mandreel_working_folder = mandreelAppWorkingFolder
        if (mandreelAppReadDataFromLocalHost) {
            commonVariable.g_mandreel_working_folder = mandreelAppLocalHost + "/" + mandreelAppWorkingFolder
        }

        if (mandreelAppStartStateFunc.isSome()) {
            mandreelAppStartStateFunc.getOrThrow()("loadingAudio", "");
        }

        _mandreelAppAudioReady();
    } else {
        mandreelLoadMandreelJsScript();
    }
}

func mandreel_removecr(my_string: String): String {
    var new_string = "";
    return new_string;
}

func mandreelAppInit(): Unit {
    if (commonVariable.mandreelAppPlatform == "webgl" || commonVariable.mandreelAppPlatform == "canvas") {
        global_init(g_stack_pointer + 800 * 1024);
        global_init1(g_stack_pointer + 800 * 1024);
        global_init2(g_stack_pointer + 800 * 1024);
        global_init3(g_stack_pointer + 800 * 1024);
        global_init4(g_stack_pointer + 800 * 1024);
        global_init5(g_stack_pointer + 800 * 1024);
        global_init6(g_stack_pointer + 800 * 1024);
        global_init7(g_stack_pointer + 800 * 1024);

        let sp: Int64 = g_stack_pointer + 800 * 1024;
        heapClassInst.heapU32[sp >> 2] = UInt32(mandreelAppCanvasWidth)
        heapClassInst.heapU32[(sp + 4) >> 2] = UInt32(mandreelAppCanvasHeight)
        __mandreel_internal_SetResolution(sp);
        __mandreel_internal_init(g_stack_pointer + 800 * 1024)
        __init(g_stack_pointer + 800 * 1024)
    }
}

func mandreelAppDraw(elapsed: Int64): Unit {
    if (commonVariable.mandreelAppPlatform == "webgl" || commonVariable.mandreelAppPlatform == "canvas") {
        if (imandreelCtxCanvas.isSome() && commonVariable.mandreelAppPlatform == "canvas") {
            let canvas = mandreelDocument.getElementById(mandreelAppCanvasName) as MandreelCanvas
            imandreelCtxCanvas.getOrThrow().clearRect(0, 0, canvas.getOrThrow().width, canvas.getOrThrow().height)
        }
        var sp: Int64 = g_stack_pointer + 800 * 1024
        __mandreel_internal_preupdate(sp)
        heapClassInst.heapU32[sp >> 2] = UInt32(elapsed)
        __draw(sp);
        __mandreel_internal_update(sp)
        __mandreel_process_async_calls();
    }
}

func mandreelAppMouseWheel(delta: Int32): Unit {
    if (commonVariable.mandreelAppPlatform == "webgl" || commonVariable.mandreelAppPlatform == "canvas") {
        var i7 = MandreelLockFrame()
        heapClassInst.heap32[(i7 + 0) >> 2] = delta
        __mouseWheelDelta(i7);
        MandreelUnlockFrame();
    }
}

func mandreelAppMouseMove(x: Int64, y: Int64): Unit {
    if (commonVariable.mandreelAppPlatform == "webgl" || commonVariable.mandreelAppPlatform == "canvas") {
        var i7 = MandreelLockFrame()
        heapClassInst.heap32[(i7 + 0) >> 2] = Int32(x)
        heapClassInst.heap32[(i7 + 4) >> 2] = Int32(y)
        __mouseMove(i7);
        MandreelUnlockFrame();
    }
}

func mandreelAppResize(x: Int64, y: Int64): Unit {
    if (commonVariable.mandreelAppPlatform == "webgl" || commonVariable.mandreelAppPlatform == "canvas") {
        var i7 = MandreelLockFrame()
        heapClassInst.heap32[(i7 + 0) >> 2] = Int32(x)
        heapClassInst.heap32[(i7 + 4) >> 2] = Int32(y)
        __resize(i7)
        heapClassInst.heap32[(i7 + 0) >> 2] = Int32(x)
        heapClassInst.heap32[(i7 + 4) >> 2] = Int32(y)
        __mandreel_internal_SetResolution(i7)
        MandreelUnlockFrame()
    }
}

func mandreelAppMouseButton(down: Int64, x: Int64, y: Int64): Unit {
    if (commonVariable.mandreelAppPlatform == "webgl" || commonVariable.mandreelAppPlatform == "canvas") {
        var i7 = MandreelLockFrame()
        heapClassInst.heap32[(i7 + 0) >> 2] = Int32(down)
        heapClassInst.heap32[(i7 + 4) >> 2] = Int32(x)
        heapClassInst.heap32[(i7 + 8) >> 2] = Int32(y)
        __mouseButton(i7);
        MandreelUnlockFrame();
    }
}

func mandreelAppMouseDblClick(x: Int64, y: Int64): Unit {
    if (commonVariable.mandreelAppPlatform == "webgl" || commonVariable.mandreelAppPlatform == "canvas") {
        var i7 = MandreelLockFrame()
        heapClassInst.heap32[(i7 + 0) >> 2] = Int32(x)
        heapClassInst.heap32[(i7 + 4) >> 2] = Int32(y)
        __mouseFloat64Click(i7)
        MandreelUnlockFrame()
    }
}

func mandreelAppKeyEvent(down: Int64, keyId: Int64): Unit {
    if (commonVariable.mandreelAppPlatform == "webgl" || commonVariable.mandreelAppPlatform == "canvas") {
        var i7 = MandreelLockFrame();
        heapClassInst.heap32[(i7 + 0) >> 2] = Int32(down)
        heapClassInst.heap32[(i7 + 4) >> 2] = Int32(keyId)
        __keyEvent(i7);
        MandreelUnlockFrame()
    }
}

func mandreelAppGetPlatform(): String {
    return commonVariable.mandreelAppPlatform
}

func mandreel_wheel(event: MouseEvent): Unit {
    imandreel_onMouseWheel(event);
    event.preventDefault();
    event.returnValue = false
}

func render(): Unit {
    var nowTime = Date_now();
    if (!gMandreelFrameLocked) {
        gMandreelFrameInframe = true
        if (!imandreelPauseGame) {
            mandreelAppDraw(nowTime - imandreelOldTime);
        }
        gMandreelFrameInframe = false
    }
    imandreelOldTime = nowTime
}

func imandreel_onMouseWheel(e: MouseEvent): Unit {
    if (!imandreelIsReady) {
        return;
    }
    if (imandreelPauseGame) {
        return;
    }

    mandreelAppMouseWheel(Int32(e.wheelDelta));
}

func imandreel_onKeyUp(e: MouseEvent): Unit {
    if (!imandreelIsReady) {
        return;
    }
    if (imandreelPauseGame) {
        return;
    }
}

func imandreel_onKeyDown(e: MouseEvent): Unit {
    if (e.which == 8.0) {
        e.preventDefault();
    }
    if (!imandreelIsReady) {
        return;
    }
    if (imandreelPauseGame) {
        return;
    }
}

func MandreelInterSwfLoaded(): Unit {
    appStartState("scriptLoaded", "");
    let flashMovie: Param = swfObject.getObjectById(mandreelAppCanvasDiv)
    dump("${flashMovie.width}");
    flashMovie.mandreelInit();

    imandreelFlashGlobalSp = mandreelInterGetSWF.MandreelInterGetGlobalStack()
    imandreelFlashGlobalSp2 = mandreelInterGetSWF.MandreelInterGetGlobalStack2()
    if (mandreelAppStartStateFunc.isSome()) {
        mandreelAppStartStateFunc.getOrThrow()("ready", "${mandreelAppCanvasWidth}, ${mandreelAppCanvasHeight}");
    }
}

func MandreelInterCallFunctionRaw(sp: Int64, func_name: String, returnType: String): String {
    return mandreelInterGetSWF.MandreelInterCallFunctionRaw(sp, "${func_name}", "${returnType}")
}

func mandreel_is_filesystem(): Bool {
    if (mandreelIndexedDB.db.isSome()) {
        return false;
    }

    if (variableSet.g_mandreel_fs.isSome()) {
        return false;
    }

    return true;
}

func mandreel_is_indexeddb(): Bool {
    if (mandreelIndexedDB.db.isSome()) {
        return true;
    }
    return false;
}

func mandreel_fs_saveFile(name: ?String, my_arrayBuffer: Any): Unit {}

func mandreel_fs_load_text(file_name: String, callback: (?String) -> Unit): Unit {}

func mandreelAppFullscreen(enable: Int32): Unit {}

func mandreelAppDisableForceFocus(): Unit {
    mandreelAppForceFocus = false
}

func mandreelAppEnableForceFocus(): Unit {
    mandreelAppForceFocus = true
}

func atob(str: String): String {
    return ""
}

func imandreel_as3_dump(param: String): Unit {
    dump(atob(param));
}

func PluginMandreelInterWriteInt(ptr: Int64, value: Int64): Unit {
    mandreelEmbedPlugin.mandreelInterCalls("WriteInt", ptr, value);
}

func PluginMandreelInterWriteFloat(ptr: Int64, value: Int64): Unit {
    mandreelEmbedPlugin.mandreelInterCalls("WriteFloat", ptr, value);
}

func PluginMandreelInterWriteString(ptr: Int64, value: Int64): Unit {
    mandreelEmbedPlugin.mandreelInterCalls("WriteString", ptr, value);
}

func PluginMandreelInterWriteWString(ptr: Int64, value: Int64): Unit {
    mandreelEmbedPlugin.mandreelInterCalls("WriteWString", ptr, value);
}

func PluginMandreelPause(): Unit {
    mandreelEmbedPlugin.mandreelInterCalls("Pause", 0, 0);
}

func PluginMandreelResume(): Unit {
    mandreelEmbedPlugin.mandreelInterCalls("Resume", 0, 0);
}

func PluginMandreelUnlockFrame(): Unit {
    mandreelEmbedPlugin.mandreelInterCalls("UnlockFrame", 0, 0);

    mandreelPluginCurrentSp -= 300 * 1024
}

func mandreel_plugin_draw(): Unit {
    let canvas = mandreelDocument.getElementById("canvasDiv");
    mandreelEmbedPlugin.mandreelInterCalls("AppDraw", 0, 0);
}

func mandreelInitPluginPlatform(params: Param): Unit {}

func MandreelInterSwfProgress(mode: String, percentage: Float32, bytes: Int32, totalbytes: Int32): Unit {
    imandreel_update_load(Int64(bytes), Int64(totalbytes));
    if (mode == "files") {
        if ((mandreelAppStartStateFunc).isSome()) {
            mandreelAppStartStateFunc.getOrThrow()("loadingData", "${percentage}");
        }
    } else if (mode == "audio") {
        if ((mandreelAppStartStateFunc).isSome()) {
            mandreelAppStartStateFunc.getOrThrow()("loadingAudioUpdate", "${percentage}");
        }
    } else if (mode == "textureasync") {
        if ((mandreelAppStartStateFunc).isSome()) {
            mandreelAppStartStateFunc.getOrThrow()("loadingTextureAsyncPack", "${percentage}");
        }
    }
}

func my_assert(sp: Int64): Unit {
    var sp0 = sp
    let p0 = heapClassInst.heap32[sp0 >> 2];
    sp0 += 4
    let p1 = heapClassInst.heap32[sp0 >> 2];
    sp0 += 4
    assert(false, text: "hola");
}

func WriteHeapFloat64(addr: Int64, value: Float64): Unit {
    heapClassInst.heapFloat64[addr >> 3] = value
}

func WriteHeapU64(addr: Int64, value: HeapValue): Unit {
    heapClassInst.heap32[addr >> 2] = Int32(value.l)
    heapClassInst.heap32[(addr >> 2) + 1] = Int32(value.h)
}

func _Z11print_valued(_stack_pos: String, value: String): Unit {
    dump(value);
    dump("\n");
}

func _Z11print_labelPKc(_stack_pos: Int64, addr: String): Unit {
    puts(_stack_pos, addr: addr);
    dump("\n");
}

func malloc_size(sp: Int64): Unit {
    var sp0 = sp
    let ptr = heapClassInst.heapU32[sp0 >> 2];
    sp0 -= 4

    heapClassInst.heap32[sp0 >> 2] = Int32(ptr)
    tlsf_block_size(sp0);
}

func tlsf_block_size(sp: Int64): Unit {
}

func llvm_move_float(addr_dst: Int64, addr_src: Int64): Unit {
    heapClassInst.heapU32[(addr_dst)] = heapClassInst.heapU32[(addr_src)]
}

func log10f(sp: Int64): Unit {
    let value: Float32 = heapClassInst.heapFloat[sp >> 2]
    commonVariable.f_g0 = Float64(log(value) * 1.0 / log(10.0))
}

func log10(sp: Int64): Unit {
    let value: Float64 = heapClassInst.heapFloat64[sp >> 3];
    commonVariable.f_g0 = Float64(log(value) * 1.0 / log(10.0))
}

func logf(sp: Int64): Unit {
    let value: Float32 = heapClassInst.heapFloat[sp >> 2];
    commonVariable.f_g0 = Float64(log(value))
}

func log(sp: Int64): Unit {
    let value: Float64 = heapClassInst.heapFloat64[sp >> 3];
    commonVariable.f_g0 = Float64(log(value))
}

func asinf(sp: Int64): Unit {
    let value: Float32 = heapClassInst.heapFloat[sp >> 2];
    commonVariable.f_g0 = Float64(asin(value))
}

func asin(sp: Int64): Unit {
    let value: Float64 = heapClassInst.heapFloat64[sp >> 3];
    commonVariable.f_g0 = Float64(asin(value))
}

func acos(sp: Int64): Unit {
    let value: Float64 = heapClassInst.heapFloat64[sp >> 3];
    commonVariable.f_g0 = Float64(acos(value))
}

func floor(sp: Int64): Unit {
    let value: Float64 = heapClassInst.heapFloat64[sp >> 3];
    commonVariable.f_g0 = Float64(floor(value))
}

func floorf(sp: Int64): Unit {
    let value: Float32 = heapClassInst.heapFloat[sp >> 2];
    commonVariable.f_g0 = Float64(floor(value))
}

func round(sp: Int64): Unit {
    let value: Float64 = heapClassInst.heapFloat64[sp >> 3];
    commonVariable.f_g0 = Float64(round(value))
}

func roundf(sp: Int64): Unit {
    let value: Float32 = heapClassInst.heapFloat[sp >> 2];
    commonVariable.f_g0 = Float64(round(value))
}

func ceilf(sp: Int64): Unit {
    let value: Float32 = heapClassInst.heapFloat[sp >> 2];
    commonVariable.f_g0 = Float64(ceil(value))
}

func ceil(sp: Int64): Unit {
    let value: Float64 = heapClassInst.heapFloat64[sp >> 3];
    commonVariable.f_g0 = Float64(ceil(value))
}

func exp2(sp: Int64): Unit {
    let value: Float64 = heapClassInst.heapFloat64[sp >> 3];

    commonVariable.f_g0 = Float64(pow(2.0, value))
}

func exp2f(sp: Int64): Unit {
    let value: Float32 = heapClassInst.heapFloat[sp >> 2];

    commonVariable.f_g0 = Float64(pow(2.0, value))
}

func pow(sp: Int64): Unit {
    let value: Float64 = heapClassInst.heapFloat64[sp >> 3];
    let value2: Float64 = heapClassInst.heapFloat64[(sp + 8) >> 3];
    commonVariable.f_g0 = Float64(pow(value, value2))
}

func cos(sp: Int64): Unit {
    let value: Float64 = heapClassInst.heapFloat64[sp >> 3];
    commonVariable.f_g0 = Float64(cos(value))
}

func tan(sp: Int64): Unit {
    let value: Float64 = heapClassInst.heapFloat64[sp >> 3];
    commonVariable.f_g0 = Float64(tan(value))
}

func expf(sp: Int64): Unit {
    let value: Float32 = heapClassInst.heapFloat[sp >> 2];
    commonVariable.f_g0 = Float64(exp(value))
}

func tanf(sp: Int64): Unit {
    let value: Float32 = heapClassInst.heapFloat[sp >> 2];
    commonVariable.f_g0 = Float64(tan(value))
}

func atanf(sp: Int64): Unit {
    let value: Float32 = heapClassInst.heapFloat[sp >> 2];
    commonVariable.f_g0 = Float64(atan(value))
}

func atan(sp: Int64): Unit {
    let value: Float64 = heapClassInst.heapFloat64[sp >> 3];
    commonVariable.f_g0 = Float64(atan(value))
}

func abs(sp: Int64): Unit {
    let value: Int32 = heapClassInst.heap32[sp >> 2];
    if (value < 0) {
        commonVariable.r_g0 = Int64(-value)
    } else {
        commonVariable.r_g0 = Int64(value)
    }
}

func sin(sp: Int64): Unit {
    let value: Float64 = heapClassInst.heapFloat64[sp >> 3];
    commonVariable.f_g0 = Float64(sin(value))
}

func sqrt(sp: Int64): Unit {
    let value: Float64 = heapClassInst.heapFloat64[sp >> 3];
    commonVariable.f_g0 = Float64(sqrt(value))
}

func fmod(sp: Int64): Unit {
    var sp0 = sp
    let value: Float64 = heapClassInst.heapFloat64[sp0 >> 3];
    sp0 += 8
    let value2: Float64 = heapClassInst.heapFloat64[sp0 >> 3];
    commonVariable.f_g0 = Float64(Int64(value) % Int64(value2))
}

func atan2(sp: Int64): Unit {
    let x: Float64 = heapClassInst.heapFloat64[sp >> 3];
    let y: Float64 = heapClassInst.heapFloat64[(sp + 8) >> 3];
    var theta = atan(x / y)
    if (y < 0.0) {
        theta += Float64.GetPI() 
    } else if (x < 0.0) {
        theta += 2.0 * Float64.GetPI() 
    }
    commonVariable.f_g0 = Float64(theta)
}

func fabs(sp: Int64): Unit {
    let value: Float64 = heapClassInst.heapFloat64[sp >> 3];
    commonVariable.f_g0 = Float64(abs(value))
}

func _Z18OutputDebugStringAPKc(sp: Int64): Unit {
    puts(sp);
}

func getenv(sp: Int64): Unit {
    commonVariable.r_g0 = 0
}

func mandreel_fcmp_ord(X: Int64, Y: Int64): Bool {
    return (X == X && Y == Y);
}

func mandreel_fcmp_uno(X: Int64, Y: Int64): Bool {
    return (X != X || Y != Y);
}

func mandreel_rewind(sp: Int64): Unit {
    var sp0 = sp
    let file_id: Int32 = heapClassInst.heap32[sp0 >> 2];
    sp0 += 4

    file_ids[Int64(file_id)].getOrThrow().offset = 0

    commonVariable.r_g0 = 0
}

func mandreel_getc(sp: Int64): Unit {
    var sp0 = sp
    let file_id = Int64(heapClassInst.heap32[sp0 >> 2]);
    sp0 += 4
    var offset = file_ids[file_id].getOrThrow().offset
    var buffer = file_ids[file_id].getOrThrow().buffer

    var byteArray = file_ids[file_id].getOrThrow().byteArray

    var total = 1;

    var result = 0;

    unsafe {
        if ((offset + total) > Int64(CPointer<UInt8>(buffer).read())) {
            result = -1
        } else {
            result = Int64(byteArray[offset])
            file_ids[file_id].getOrThrow().offset += total
        }
    }

    commonVariable.r_g0 = result
}

func llvm_store_unalign32_float(addr: Int64, value: Float64): Unit {
    heapClassInst.heapFloat[0] = Float32(value)
    var data = heapClassInst.heap32[0];
    heapClassInst.heap8[addr] = Int8(data & 0xff)
    heapClassInst.heap8[addr + 1] = Int8((Int64(data) >> 8) & 0xff)
    heapClassInst.heap8[addr + 2] = Int8((Int64(data) >> 16) & 0xff)
    heapClassInst.heap8[addr + 3] = Int8((Int64(data) >> 24) & 0xff)
}

func llvm_store_unalign32(addr: Int64, value: Int64): Unit {
    heapClassInst.heap8[addr] = Int8(value & 0xff)
    heapClassInst.heap8[addr + 1] = Int8((value >> 8) & 0xff)
    heapClassInst.heap8[addr + 2] = Int8((value >> 16) & 0xff)
    heapClassInst.heap8[addr + 3] = Int8((value >> 24) & 0xff)
}

func llvm_read_unalign32(addr: Int64): UInt8 {
    var value: UInt8 = 0

    return value;
}

func llvm_read_unalign32_float(addr: Int64): Float32 {
    var value: UInt8 = 0

    return heapClassInst.heapFloat[0];
}

func mandreel_removels(sp: Int64): Unit {
    var sp0 = sp
    let ptr_name_a = Int64(heapClassInst.heap32[sp0 >> 2]);
    sp0 += 4
    let key_a = get_string_from_ptr(ptr_name_a);

    let my_localStorage = mandreel_getlocalstorage()

    my_localStorage.getOrThrow().removeItem(key_a)
    my_localStorage.getOrThrow().removeItem(key_a + "_size")
    commonVariable.r_g0 = 0
}

func mandreel_renamels(sp: Int64): Unit {
    var sp0 = sp
    let ptr_name_a = Int64(heapClassInst.heap32[sp0 >> 2]);
    sp0 += 4
    let ptr_name_b = Int64(heapClassInst.heap32[sp0 >> 2]);
    sp0 += 4

    let key_a = get_string_from_ptr(ptr_name_a);
    let key_b = get_string_from_ptr(ptr_name_b);

    let my_localStorage = mandreel_getlocalstorage();

    let value = my_localStorage.getOrThrow().getItem(key_a)
    let value2 = my_localStorage.getOrThrow().getItem(key_a + "_size");

 
    if (let (Some(V1), Some(V2)) <- (value, value2)) {
        my_localStorage.getOrThrow().setItem(key_b, V1);
        my_localStorage.getOrThrow().setItem(key_b + "_size", V2);

        my_localStorage.getOrThrow().removeItem(key_a)
        my_localStorage.getOrThrow().removeItem(key_a + "_size")
        commonVariable.r_g0 = 0
    } else {
        commonVariable.r_g0 = -1
    }
}

func get_string_from_wptr(ptr: Int64): String {
    var lptr = ptr;
    var ret = "";
    if (lptr == 0) {
        return ret;
    }
    assert((ptr & 1) == 0);
    lptr >>= 1
    var i = 0;
    while (true) {
        if (heapClassInst.heapU16[ptr + i] == 0) {
            break;
        }
        let t = String(Rune(heapClassInst.heapU16[ptr + i]))

        ret += t
        i += 1
    }

    return ret;
}

func fill_wptr_from_string(ptr: Int64, v: String): Unit {
    var lptr = ptr;
    assert((ptr & 1) == 0);
    lptr >>= 1
    heapClassInst.heapU16[ptr] = 0
}

func mandreelInterRetParam(type1: String, value: Any): Int64 {
    match (type1) {
        case "int" =>
          
            if (let Some(rValue) <- (value as Int64)) {
            commonVariable.r_g0 = rValue
        }

        case "float" =>
      
            if (let Some(rValue) <- (value as Float64)) {
            commonVariable.f_g0 = rValue
        }
        case _ => assert(false)
    }
    return 0;
}

func MandreelInterGetFunctionPtr(value: Int64): (Int64) -> Unit {
    return __FUNCTION_TABLE__[value >> 2];
}

func Mandreel_TextureAsync_CheckPending(sp: Int64): Unit {
    commonVariable.r_g0 = Mandreel_TextureAsync_textures - Mandreel_TextureAsync_textures_loaded
}

func Mandreel_TextureAsync_GetProperties(sp: Int64): Unit {
    var sp0 = sp
    let texture_id = Int64(heapClassInst.heap32[sp0 >> 2]);
    sp0 += 4
    let ptr_width = heapClassInst.heap32[sp0 >> 2];
    sp0 += 4
    let ptr_height = heapClassInst.heap32[sp0 >> 2];
    sp0 += 4

    let tex = array_ids_ogl[texture_id];

    if ( /*tex == nil ||*/ tex.mandreel_width == 0) {
        commonVariable.r_g0 = 0
    } else {
        heapClassInst.heap32[Int64(ptr_width) >> 2] = Int32(tex.mandreel_width)
        heapClassInst.heap32[Int64(ptr_height) >> 2] = Int32(tex.mandreel_height)
        commonVariable.r_g0 = 1
    }
}

func MandreelInterWriteString(ptr: Int64, value: String): Unit {
    fill_ptr_from_string(ptr, value);
}

func MandreelInterWriteWString(ptr: Int64, value: String): Unit {
    fill_wptr_from_string(ptr, value);
}

func MandreelInterWriteFloat(ptr: Int64, value: Float32): Unit {
    heapClassInst.heapFloat[ptr >> 2] = value
}

func MandreelPause(): Unit {
    imandreelPauseGame = true
}

func MandreelResume(): Unit {
    imandreelPauseGame = false
}

func MandreelLockFrame(): Int64 {
    assert(gMandreelFrameInframe == false, text: "calling lockframe during render frame");
    assert(gMandreelFrameLocked == false, text: "calling lockframe twice");
    gMandreelFrameLocked = true

    return g_stack_pointer + 800 * 1024;
}

func MandreelUnlockFrame(): Unit {
    assert(gMandreelFrameInframe == false);
    gMandreelFrameLocked = false
}

func MandreelInterWriteInt(ptr: Int64, value: Int64): Unit {
    heapClassInst.heap32[ptr >> 2] = Int32(value)
}

func MandreelInterStringFromWPtr(ptr: Int64): String {
    return get_string_from_wptr(ptr);
}

func MandreelInterStringFromPtr(ptr: Int64): String {
    return get_string_from_ptr(ptr);
}

func mandreel_my_call_external_array(method: String, params: ArrayList<Any>): (Int64, Int64) {
    let result: Int64 = 0
    let resultString: Int64 = 0
    return (result, resultString)
}

func Mandreel_InterJS_Call(sp: Int64): Unit {
    var sp0 = sp
    let method_ptr = heapClassInst.heap32[sp0 >> 2];
    sp0 += 4
    let method = get_string_from_ptr(Int64(method_ptr));
    var params = ArrayList<Any>()
    params.add(sp0);

    var var_int: Int64 = 0;
    var var_string: String = "";
    var var_Float64: Float64 = 0.0;

    var return_type: Int64 = 0;
    var return_ptr: Int64 = 0;
    while (true) {
        var my_type = heapClassInst.heap64[sp0 >> 2];
        sp0 += 4
        if (my_type == MANDREELCALLJS_TYPE_RETURN_VOID) {
            return_type = Int64(my_type)
            break;
        } else if (my_type == MANDREELCALLJS_TYPE_INT) {
            var_int = Int64(heapClassInst.heap32[sp0 >> 2])
            params.add(var_int);
            sp0 += 4
        } else if (my_type == MANDREELCALLJS_TYPE_FLOAT) {
            sp0 = (sp0 + 7) & (!7)
            var_Float64 = Float64(llvm_readDouble(sp0))
            params.add(var_Float64);
            sp0 += 8
        } else if (my_type == MANDREELCALLJS_TYPE_STRING) {
            var_int = Int64(heapClassInst.heap32[sp0 >> 2])
            var_string = get_string_from_ptr(var_int)
            params.add(var_string);
            sp0 += 4
        } else if (my_type == MANDREELCALLJS_TYPE_RETURN_INT) {
            return_type = Int64(my_type)
            return_ptr = Int64(heapClassInst.heap32[sp0 >> 2])
            break;
        } else if (my_type == MANDREELCALLJS_TYPE_RETURN_FLOAT) {
            return_type = Int64(my_type)
            return_ptr = Int64(heapClassInst.heap32[sp0 >> 2])
            break;
        } else {
            assert(false, text: "invalid arguments calling Mandreel_InterJS_Call");
        }
    }

    let result = mandreel_my_call_external_array(method, params);
    commonVariable.r_g0 = result[0]

    if (commonVariable.r_g0 == 0) {
        if (return_type == MANDREELCALLJS_TYPE_RETURN_INT) {
            heapClassInst.heap32[return_ptr >> 2] = Int32(result[1])
        } else if (return_type == MANDREELCALLJS_TYPE_RETURN_FLOAT) {
            heapClassInst.heapFloat[return_ptr >> 2] = Float32(result[1])
        }
    }
}

func Mandreel_InterJS_AsyncCall(sp: Int64): Unit {
    var sp0 = sp
    let method_ptr = heapClassInst.heap32[sp0 >> 2];
    sp0 += 4
    let _func_name = get_string_from_ptr(Int64(method_ptr));
    let param_ptr = heapClassInst.heap32[sp0 >> 2];
    sp0 += 4
    let _param = get_string_from_ptr(Int64(param_ptr));
    mandreelAsyncCallsJs.add(FunClass(_func_name, _param));
}

func MandreelInterCallFunctionAsync(func_name: String, param: String): Unit {
    mandreelAsyncCallsMandreel.add(FunClass(func_name, param));
}

func __mandreel_process_async_calls(): Unit {
    if (mandreelAsyncCallsMandreel.size > 0) {
        var temp_list = ArrayList<FunClass>(mandreelAsyncCallsMandreel.toArray())

        mandreelAsyncCallsMandreel = ArrayList<FunClass>()

        for (i in 0..temp_list.size) {
            let param = temp_list[i].param
            var func_name = temp_list[i].funcName

            let size = ((param.size + 1) + 7) & 0xFFFFFFF8;

            var sp = g_stack_pointer + 800 * 1024;

            var str_ptr = sp - size;
            fill_ptr_from_string(str_ptr, param);

            sp = str_ptr - 4
            heapClassInst.heap32[sp >> 2] = Int32(str_ptr)
        }
    }

    if (mandreelAsyncCallsJs.size > 0) {
        let temp_list = ArrayList<FunClass>(mandreelAsyncCallsJs.toArray())

        mandreelAsyncCallsJs = ArrayList<FunClass>()

        for (i in 0..temp_list.size) {
            let param = temp_list[i].param
            let func_name = temp_list[i].funcName
        }
    }
}

func mandreel_internal_isCanvas(sp: Int64): Unit {
    if (commonVariable.mandreelAppPlatform == "canvas") {
        commonVariable.r_g0 = 1
    } else {
        commonVariable.r_g0 = 0
    }
}

func Mandreel_Device_SetFullScreen(sp: Int64): Unit {
    var sp0 = sp
    let enable = heapClassInst.heap32[sp0 >> 2];
    sp0 += 4
    mandreelAppFullscreen(enable)
}

func myglCreateUniformArrays(): Unit {
    if (uniformArraysCreated == 0) {
        for (i in 0..256) {
            uniformArrays2.add(all: Array<Float64>(i * 2, repeat: 0.0))
            uniformArrays3.add(all: Array<Float64>(i * 3, repeat: 0.0))
            uniformArrays4.add(all: Array<Float64>(i * 4, repeat: 0.0))
        }
        uniformArraysCreated = 1
    }
}

func myglNewSlot(): Int64 {
    var id = mySuperId;
    mySuperId = mySuperId + 1
    return id;
}

func myglFreeSlot(id: Int32): Unit {
    arrayIdsOglEnable.add(Int64(id));
}

func myglCreateTexture(sp: Int64): Unit {
    var id: Int64 = myglNewSlot();
    commonVariable.r_g0 = id
}

func myglCreateRenderBuffer(sp: Int64): Unit {
    let id: Int64 = myglNewSlot();
    array_ids_ogl[id] = imandreel_gl.getOrThrow().createRenderbuffer()
    commonVariable.r_g0 = id
}

func myglCreateFrameBuffer(sp: Int64): Unit {
    let id = myglNewSlot();
    array_ids_ogl[id] = imandreel_gl.getOrThrow().createFramebuffer()
    commonVariable.r_g0 = id
}

func myglCreateBuffer(sp: Int64): Unit {
    let id = myglNewSlot();
    array_ids_ogl[id] = imandreel_gl.getOrThrow().createBuffer()
    commonVariable.r_g0 = id
}

func myglGetShaderInfoLog(sp: Int64): Unit {
    var sp0 = sp
    let program_id: Int32 = heapClassInst.heap32[sp0 >> 2];
    sp0 = sp0 + 4
    let ptr_string: Int32 = heapClassInst.heap32[sp0 >> 2];
    sp0 += 4
    let info_log: String = imandreel_gl.getOrThrow().getShaderInfoLog(array_ids_ogl[Int64(program_id)])
    fill_ptr_from_string(Int64(ptr_string), info_log);
}

func myglGetError(sp: Int64): Unit {
    commonVariable.r_g0 = imandreel_gl.getOrThrow().getError()
    commonVariable.r_g0 = 0
}

func myglGetProgramParameter(sp: Int64): Unit {
    var sp0 = sp
    let program_id: Int32 = heapClassInst.heap32[sp0 >> 2];
    sp0 = sp0 + 4
    let pname: Int32 = heapClassInst.heap32[sp0 >> 2];
    sp0 += 4
    commonVariable.r_g0 = imandreel_gl.getOrThrow().getProgramParameter(array_ids_ogl[Int64(program_id)], Int64(pname))
}

func myglGetActiveAttrib(sp: Int64): Unit {
    var sp0 = sp
    let program_id: Int32 = heapClassInst.heap32[sp0 >> 2];
    sp0 = sp0 + 4
    let index: Int32 = heapClassInst.heap32[sp >> 2];
    sp0 += 4
    let ptr: Int32 = heapClassInst.heap32[sp >> 2];
    sp0 += 4
    let result = imandreel_gl.getOrThrow().getActiveAttrib(array_ids_ogl[Int64(program_id)], Int64(index));
    if (Some(result).isSome()) {
        heapClassInst.heap32[Int64((ptr)) >> 2] = Int32(result.size)
        heapClassInst.heap32[(Int64(ptr) + 4) >> 2] = Int32(result.type1)
        fill_ptr_from_string(Int64(ptr) + 8, result.name);
        commonVariable.r_g0 = 0
    } else {
        commonVariable.r_g0 = 1
    }
}

func myglGetActiveUniform(sp: Int64): Unit {
    var sp0 = sp
    let program_id: Int32 = heapClassInst.heap32[sp0 >> 2];
    sp0 = sp0 + 4
    let index: Int32 = heapClassInst.heap32[sp0 >> 2];
    sp0 += 4
    let ptr: Int32 = heapClassInst.heap32[sp0 >> 2];
    sp0 += 4
    let result = imandreel_gl.getOrThrow().getActiveUniform(array_ids_ogl[Int64(program_id)], Int64(index));
    if (Some(result).isSome()) {
        heapClassInst.heap32[Int64((ptr)) >> 2] = Int32(result.size)
        heapClassInst.heap32[(Int64(ptr) + 4) >> 2] = Int32(result.type1)
        fill_ptr_from_string(Int64(ptr) + 8, result.name);
        commonVariable.r_g0 = 0
    } else {
        commonVariable.r_g0 = 1
    }
}

func mygetProgramParameter(sp: Int64): Unit {
    var sp0 = sp
    let program_id: Int32 = heapClassInst.heap32[sp0 >> 2];
    sp0 = sp0 + 4
    let pname: Int32 = heapClassInst.heap32[sp0 >> 2];
    sp0 += 4
    commonVariable.r_g0 = imandreel_gl.getOrThrow().getProgramParameter(array_ids_ogl[Int64(program_id)], Int64(pname))
}

func mygetShaderParameter(sp: Int64): Unit {
    var sp0 = sp
    let shader_id: Int32 = heapClassInst.heap32[sp0 >> 2];
    sp0 = sp0 + 4
    let pname: Int32 = heapClassInst.heap32[sp0 >> 2];
    sp0 += 4
    commonVariable.r_g0 = imandreel_gl.getOrThrow().getShaderParameter(array_ids_ogl[Int64(shader_id)], pname)
}

func myglInit(sp: Int64): Unit {
    for (i in 0..maxOglId) {
        arrayIdsOglEnable.add(i + 1);
    }
}
