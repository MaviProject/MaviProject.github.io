#!/bin/bash
# 生成RSS feed.xml

cat > feed.xml << FEED
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
<channel>
<title>MaviProject 技术博客</title>
<description>计算机视觉、目标检测、大语言模型技术分享</description>
<link>https://maviproject.github.io/</link>
<atom:link href="https://maviproject.github.io/feed.xml" rel="self" type="application/rss+xml"/>
<language>zh-CN</language>
<lastBuildDate>$(date -R)</lastBuildDate>
<generator>MaviProject Blog Generator</generator>

<item>
<title>目标检测基础知识</title>
<link>https://maviproject.github.io/detection/Basic</link>
<guid>https://maviproject.github.io/detection/Basic</guid>
<pubDate>$(date -d "2024-02-28" -R)</pubDate>
<description>介绍目标检测领域的常用术语、准确率、精确率、召回率等基础概念，帮助理解模型评估指标。</description>
<category>目标检测</category>
</item>

<item>
<title>IOU损失函数</title>
<link>https://maviproject.github.io/detection/IOU</link>
<guid>https://maviproject.github.io/detection/IOU</guid>
<pubDate>$(date -d "2024-02-27" -R)</pubDate>
<description>深入解析IoU、GIoU、DIoU、CIoU等边界框回归损失函数，对比各自优缺点及实现方式。</description>
<category>目标检测</category>
</item>

<item>
<title>非极大值抑制(NMS)</title>
<link>https://maviproject.github.io/detection/NMS</link>
<guid>https://maviproject.github.io/detection/NMS</guid>
<pubDate>$(date -d "2024-02-26" -R)</pubDate>
<description>详细介绍NMS算法原理、传统实现方法及其在目标检测中的应用，解决重复检测框问题。</description>
<category>目标检测</category>
</item>

<item>
<title>YOLOv5在Ubuntu环境搭建</title>
<link>https://maviproject.github.io/yolo/install</link>
<guid>https://maviproject.github.io/yolo/install</guid>
<pubDate>$(date -d "2024-02-25" -R)</pubDate>
<description>从系统环境配置、显卡驱动安装到YOLOv5项目部署，详细记录Ubuntu下的完整搭建流程。</description>
<category>YOLO学习</category>
</item>

<item>
<title>输入图像尺寸对训练的影响</title>
<link>https://maviproject.github.io/yolo/input_size</link>
<guid>https://maviproject.github.io/yolo/input_size</guid>
<pubDate>$(date -d "2024-02-24" -R)</pubDate>
<description>分析输入图像尺寸如何影响YOLOv5模型的感受野、全局与局部信息提取，以及训练效果。</description>
<category>YOLO学习</category>
</item>

<item>
<title>YOLOv5深度剖析</title>
<link>https://maviproject.github.io/yolo/yolov5_depth</link>
<guid>https://maviproject.github.io/yolo/yolov5_depth</guid>
<pubDate>$(date -d "2024-02-23" -R)</pubDate>
<description>深入解析YOLOv5的评估方式、混淆矩阵、PR曲线等核心概念，帮助全面理解模型性能。</description>
<category>YOLO学习</category>
</item>

<item>
<title>Llama-2安装运行</title>
<link>https://maviproject.github.io/llama/install</link>
<guid>https://maviproject.github.io/llama/install</guid>
<pubDate>$(date -d "2024-02-22" -R)</pubDate>
<description>指导如何在低显存环境下运行Llama-2，结合Llama.cpp实现模型权重下载与本地部署。</description>
<category>大语言模型</category>
</item>

</channel>
</rss>
FEED

echo "RSS feed.xml 已生成"
