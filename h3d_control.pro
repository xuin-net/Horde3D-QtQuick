QT += core quickcontrols2

INCLUDEPATH += $$PWD/Horde3DEngine \
                $$PWD/Horde3DEngine/GL \
                $$PWD/Horde3DEngine/GLES2 \
                $$PWD/Horde3DUtils  \
                $$PWD/Shared

macos {
    #getnetwork inif framework
    LIBS += -framework SystemConfiguration
    LIBS += -framework Foundation

    #ble init framework
    LIBS += -framework Cocoa
    LIBS += -framework CoreBluetooth

    HEADERS += Horde3DEngine/GL/egRendererBaseGL.h \
               Horde3DEngine/GL/utOpenGL.h
    SOURCES += Horde3DEngine/GL/egRendererBaseGL.cpp \
               Horde3DEngine/GL/utOpenGL.cpp
}

ios{
    HEADERS += Horde3DEngine/GLES2/egRendererBaseGLES2.h \
               Horde3DEngine/GLES2/utOpenGLES2.h
    SOURCES += Horde3DEngine/GLES2/egRendererBaseGLES2.cpp \
               Horde3DEngine/GLES2/utOpenGLES2.cpp

    LIBS += -framework SystemConfiguration
    LIBS += -framework MediaPlayer
}

android{
    HEADERS += Horde3DEngine/GLES2/egRendererBaseGLES2.h \
               Horde3DEngine/GLES2/utOpenGLES2.h
    SOURCES += Horde3DEngine/GLES2/egRendererBaseGLES2.cpp \
               Horde3DEngine/GLES2/utOpenGLES2.cpp
}

HEADERS += h3d_control.h \
    modelThread.h \
    Horde3DEngine/config.h \
    Horde3DEngine/egAnimatables.h \
    Horde3DEngine/egAnimation.h \
    Horde3DEngine/egCamera.h \
    Horde3DEngine/egCom.h \
    Horde3DEngine/egExtensions.h \
    Horde3DEngine/egGeometry.h \
    Horde3DEngine/egLight.h \
    Horde3DEngine/egMaterial.h \
    Horde3DEngine/egModel.h \
    Horde3DEngine/egModules.h \
    Horde3DEngine/egParticle.h \
    Horde3DEngine/egPipeline.h \
    Horde3DEngine/egPrerequisites.h \
    Horde3DEngine/egPrimitives.h \
    Horde3DEngine/egRenderer.h \
    Horde3DEngine/egRendererBase.h \
    Horde3DEngine/egResource.h \
    Horde3DEngine/egScene.h \
    Horde3DEngine/egSceneGraphRes.h \
    Horde3DEngine/egShader.h \
    Horde3DEngine/egTexture.h \
    Horde3DEngine/Horde3D.h \
    Horde3DEngine/utImage.h \
    Horde3DEngine/utTexture.h \
    Horde3DEngine/utTimer.h \
    Shared/rapidxml_print.h \
    Shared/rapidxml.h \
    Shared/utDebug.h \
    Shared/utMath.h \
    Shared/utPlatform.h \
    Shared/utXML.h \
    Horde3DUtils/Horde3DUtils.h

SOURCES += h3d_control.cpp main.cpp \
    modelThread.cpp \
    Horde3DEngine/egAnimatables.cpp \
    Horde3DEngine/egAnimation.cpp \
    Horde3DEngine/egCamera.cpp \
    Horde3DEngine/egCom.cpp \
    Horde3DEngine/egExtensions.cpp \
    Horde3DEngine/egGeometry.cpp \
    Horde3DEngine/egLight.cpp \
    Horde3DEngine/egMain.cpp \
    Horde3DEngine/egMaterial.cpp \
    Horde3DEngine/egModel.cpp \
    Horde3DEngine/egModules.cpp \
    Horde3DEngine/egParticle.cpp \
    Horde3DEngine/egPipeline.cpp \
    Horde3DEngine/egPrimitives.cpp \
    Horde3DEngine/egRenderer.cpp \
    Horde3DEngine/egRendererBase.cpp \
    Horde3DEngine/egResource.cpp \
    Horde3DEngine/egScene.cpp \
    Horde3DEngine/egSceneGraphRes.cpp \
    Horde3DEngine/egShader.cpp \
    Horde3DEngine/egTexture.cpp \
    Horde3DEngine/utImage.cpp \
    Horde3DEngine/utTexture.cpp \
    Horde3DUtils/Horde3DUtils.cpp

RESOURCES += h3d_control.qrc \
    content.qrc

OTHER_FILES +=  main.qml
