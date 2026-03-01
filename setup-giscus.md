# Giscus评论系统配置指南

## 前提条件
1. 仓库必须为公开仓库 ✅ (MaviProject.github.io 是公开的)
2. 必须启用 GitHub Discussions ✅ (需要手动启用)

## 启用GitHub Discussions
1. 访问仓库设置: https://github.com/MaviProject/MaviProject.github.io/settings
2. 左侧菜单选择 "General"
3. 找到 "Features" 部分
4. 勾选 "Discussions"
5. 点击 "Save changes"

## Giscus应用安装
1. 访问 Giscus 应用: https://github.com/apps/giscus
2. 点击 "Install"
3. 选择 "Only select repositories"
4. 选择 "MaviProject/MaviProject.github.io"
5. 点击 "Install"

## 配置参数
安装后访问: https://giscus.app
填写以下信息:
- Repository: MaviProject/MaviProject.github.io
- Discussion category: Announcements 或新建 "Comments" 分类
- Theme: Dark (匹配博客主题)

## 获取配置代码
Giscus会生成类似以下配置:
```html
<script src="https://giscus.app/client.js"
        data-repo="MaviProject/MaviProject.github.io"
        data-repo-id="R_kgD..."
        data-category="Announcements"
        data-category-id="DIC_kwD..."
        data-mapping="pathname"
        data-strict="0"
        data-reactions-enabled="1"
        data-emit-metadata="0"
        data-input-position="bottom"
        data-theme="dark"
        data-lang="zh-CN"
        crossorigin="anonymous"
        async>
</script>
```

## 集成到博客
将生成的script标签添加到:
1. `_layouts/post.html` - 文章页面
2. 或单独的评论组件中

## 测试
1. 创建一篇测试文章
2. 发表评论测试功能
3. 验证评论显示正常
