package com.example.hello_world1

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

  private val CHANNEL = "flutter.key46.com/hello_world"

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    GeneratedPluginRegistrant.registerWith(this)

    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
      // Note: this method is invoked on the main thread.
      if (call.method.equals("hello")) {
        val text = call.argument<String>("text");
        val haloResult = returnHello(text);

        if(haloResult != null){
          result.success(haloResult);
        } else {
          result.error("UNAVAILABLE", "hello not available.", null);
        }
      } else {
        result.notImplemented()
      }
    }
  }

  private fun returnHello(text: String?): String? {
    val halo: String? = "Hello World";

    if(text != null){
      return halo + " " + text;
    }

    return halo
  }
}
