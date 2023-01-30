package com.medical360oth.medical360_oth

import android.annotation.SuppressLint
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import android.provider.Settings.Secure
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {
    private val DEVICE_Id = "com.MediMe/DeviceIdInfo";

    private  lateinit var idDevicechannel : MethodChannel

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        idDevicechannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, DEVICE_Id)

        idDevicechannel.setMethodCallHandler {call, result ->
            if(call.method == "getDeviceId")  {
                val deviceIdData = getDeviceId()
                result.success(deviceIdData)
            }
        }
    }

    @SuppressLint("HardwareIds")
    private fun getDeviceId(): String {
        return Secure.getString(
            contentResolver,
             Secure.ANDROID_ID
         )
    }
}
