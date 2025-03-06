plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin") // Flutter Gradle Plugin must be applied after Android and Kotlin Gradle plugins.
}

android {
    namespace = "com.example.fro"
    compileSdk = 35 

    ndkVersion = "29.0.13113456" 

    defaultConfig {
        applicationId = "com.example.fro"
        minSdk = 21 // Replace with your Flutter minSdkVersion
        targetSdk = 35 // Replace with your Flutter targetSdkVersion
        versionCode = 1
        versionName = "1.0"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

// Flutter module path
flutter {
    source = "../.."
}
