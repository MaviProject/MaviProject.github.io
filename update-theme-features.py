#!/usr/bin/env python3
import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. 在CSS根变量中添加主题切换支持
theme_css = '''
        /* 主题切换变量 */
        [data-theme="light"] {
            --dark: #f8fafc;
            --dark-light: #e2e8f0;
            --light: #0f172a;
            --gray: #64748b;
            --gray-light: #1e293b;
            --card-bg: rgba(255, 255, 255, 0.9);
            --glass: rgba(0, 0, 0, 0.05);
            --glass-border: rgba(0, 0, 0, 0.1);
        }
        
        [data-theme="light"] body {
            background-image: 
                radial-gradient(circle at 10% 20%, rgba(99, 102, 241, 0.1) 0%, transparent 25%),
                radial-gradient(circle at 90% 80%, rgba(139, 92, 246, 0.1) 0%, transparent 25%),
                radial-gradient(circle at 50% 50%, rgba(217, 70, 239, 0.05) 0%, transparent 30%);
        }
        
        [data-theme="light"] .tech-stack-section {
            background: linear-gradient(135deg, rgba(248, 250, 252, 0.8), rgba(226, 232, 240, 0.9));
        }
        
        [data-theme="light"] footer {
            background: var(--dark-light);
        }
        
        /* 图片懒加载样式 */
        img[data-src] {
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        
        img.loaded {
            opacity: 1;
        }
        
        /* 阅读进度条容器样式 */
        #reading-progress-bar {
            box-shadow: 0 2px 5px rgba(99, 102, 241, 0.3);
        }
'''

# 在CSS的:root定义后插入主题样式
root_end_pattern = r':root \{[\s\S]*?\}'
match = re.search(root_end_pattern, content)
if match:
    root_end = match.end()
    content = content[:root_end] + '\n\n        ' + theme_css + content[root_end:]

# 2. 在JavaScript引用部分添加新脚本
new_scripts = '''
    <!-- 博客增强功能 -->
    <script src="/assets/js/reading-progress.js"></script>
'''

# 在现有脚本前插入新脚本
scripts_pattern = r'</footer>[\s\S]*?<script>'
if re.search(scripts_pattern, content):
    content = re.sub(scripts_pattern, lambda m: '</footer>\n\n' + new_scripts + '\n\n    <script>', content)

# 3. 更新文章图片使用懒加载（示例）
# 这里可以添加代码来修改img标签，但为了简单，我们保持原样

# 保存更新
with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)

print('主题切换和增强功能已添加到首页')
