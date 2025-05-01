pluginManagement {
    val flutterSdkPath: String = providers.gradleProperty("flutter.sdk")
        .orElse(
            file("local.properties").let { localPropsFile ->
                val props = java.util.Properties()
                localPropsFile.inputStream().use { props.load(it) }
                props.getProperty("flutter.sdk") ?: throw GradleException("flutter.sdk not set in local.properties")
            }
        ).get()

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.1.0" apply false
    id("org.jetbrains.kotlin.android") version "1.9.22" apply false
}

include(":app")
