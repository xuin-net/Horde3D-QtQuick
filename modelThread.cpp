/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include "modelThread.h"
#include <QQuickWindow>

//调整动画速度
#ifdef Q_OS_IOS
#define SPEED 30.0f
#else
#define SPEED 60.0f
#endif

ModelRenderer::ModelRenderer():
    m_cam(0),
    m_animTime(0)
{
}

ModelRenderer::~ModelRenderer()
{
    h3dRelease();
}


void ModelRenderer::initialize(QString &_fileName)
{
    initializeOpenGLFunctions();

    if (!m_cam)
    {
        // Initialize engine.
        h3dInit(0x0);

        // 配置Horde3d
        h3dSetOption( H3DOptions::LoadTextures, 1 );
        h3dSetOption( H3DOptions::FastAnimation, 1 );
        h3dSetOption( H3DOptions::MaxAnisotropy, 16 );
        h3dSetOption( H3DOptions::ShadowMapSize, 2048 );

        //添加相关资源
        QString _sceneFileName = _fileName;
        QString _animFileName = _fileName;
        modelPipeRes = h3dAddResource( H3DResTypes::Pipeline, "forward.pipeline.xml", 0 );
        modelRes = h3dAddResource( H3DResTypes::SceneGraph,_sceneFileName.append(".scene.xml").toLatin1().constData(), 0 );
        modelAnimRes = h3dAddResource( H3DResTypes::Animation, _animFileName.append(".anim").toLatin1().constData(), 0 );

        //加载资源
        #ifdef Q_OS_MACOS
        h3dutLoadResourcesFromDisk(":/Content/");
        #else
        h3dutLoadResourcesFromDisk(":/Content_GLES2/");
//        h3dutLoadResourcesFromDisk("/storage/emulated/0/Content_es2/");
        #endif

        //配置相关节点
        m_cam = h3dAddCameraNode( H3DRootNode, "Camera", modelPipeRes );
        m_model = h3dAddNodes( H3DRootNode, modelRes );
        h3dSetupModelAnimStage( m_model, 0, modelAnimRes, 0, "", false );

        //配置灯光
        m_light = h3dAddLightNode( H3DRootNode, "Light1", 0, "LIGHTING", "SHADOWMAP" );
        h3dSetNodeTransform( m_light, 0, 15, 10, -60, 0, 0, 1, 1, 1 );
        h3dSetNodeParamF( m_light, H3DLight::RadiusF, 0, 60 );
        h3dSetNodeParamF( m_light, H3DLight::FovF, 0, 90 );
        h3dSetNodeParamI( m_light, H3DLight::ShadowMapCountI, 0 );
        h3dSetNodeParamF( m_light, H3DLight::ShadowMapBiasF, 0, 0.01f );
        h3dSetNodeParamF( m_light, H3DLight::ColorF3, 0, 1.0f );
        h3dSetNodeParamF( m_light, H3DLight::ColorF3, 1, 1.0f );
        h3dSetNodeParamF( m_light, H3DLight::ColorF3, 2, 1.0f );
        h3dSetNodeParamF( m_light, H3DLight::ColorMultiplierF, 0, 1.0f );
    }

}

void ModelRenderer::render(QSize &_size)
{
    //qDebug() << "horde3d渲染中";

    // Resize viewport
    h3dSetNodeParamI( m_cam, H3DCamera::ViewportXI, 0 );
    h3dSetNodeParamI( m_cam, H3DCamera::ViewportYI, 0 );
    h3dSetNodeParamI( m_cam, H3DCamera::ViewportWidthI, _size.width() );
    h3dSetNodeParamI( m_cam, H3DCamera::ViewportHeightI, _size.height() );

    // Set virtual camera parameters
    h3dSetupCameraView( m_cam, 45.0f, (float)_size.width() / _size.height(), 0.1f, 1000.0f );
    h3dResizePipelineBuffers( modelPipeRes, _size.width(), _size.height() );

    //抗锯齿（暂不支持移动端）
    //h3dSetOption( H3DOptions::SampleCount, (float) _sampleCount );

    m_animTime += 1.0f / SPEED;

    // Do animation blending
    h3dSetModelAnimParams( m_model, 0, m_animTime * 30.0f, 1.0f );
    h3dSetModelAnimParams( m_model, 1, m_animTime * 30.0f, 1.0f );
    h3dUpdateModel( m_model, H3DModelUpdateFlags::Animation | H3DModelUpdateFlags::Geometry );


    // Set model parameters
    h3dSetNodeTransform( m_model, 0.169412f, -1.80367f, -5.11041f, 0, 0, 0, 1.0f, 1.0f, 1.0f);

    // Render scene
    h3dRender( m_cam );

    // Finish rendering of frame
    h3dFinalizeFrame();

    // Remove all overlays
    h3dClearOverlays();

    //print engine message
    #ifdef QT_DEBUG
//    printMessage();
    #endif
}

void ModelRenderer::printMessage(){
    int msgLevel;
    float msgTime;
    const char* message;

    while((message = h3dGetMessage(&msgLevel, &msgTime)) && strlen(message) > 0)
    {
        qDebug() << msgLevel << "message from Horde3D at" << msgTime << ":" << message;
    } // end while
}
