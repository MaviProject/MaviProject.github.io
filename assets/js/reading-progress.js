// 阅读进度指示器
class ReadingProgress {
    constructor() {
        this.progressBar = null;
        this.init();
    }
    
    init() {
        // 创建进度条元素
        this.progressBar = document.createElement('div');
        this.progressBar.id = 'reading-progress-bar';
        this.progressBar.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 0%;
            height: 3px;
            background: linear-gradient(90deg, var(--gradient-1), var(--gradient-3));
            z-index: 9999;
            transition: width 0.2s ease;
            border-radius: 0 2px 2px 0;
        `;
        
        document.body.appendChild(this.progressBar);
        this.setupScrollListener();
    }
    
    setupScrollListener() {
        // 只在文章页面显示
        if (!this.isArticlePage()) return;
        
        window.addEventListener('scroll', () => {
            this.updateProgress();
        });
        
        // 初始更新
        this.updateProgress();
    }
    
    updateProgress() {
        const winHeight = window.innerHeight;
        const docHeight = document.documentElement.scrollHeight;
        const scrollTop = window.scrollY;
        
        const progress = (scrollTop / (docHeight - winHeight)) * 100;
        this.progressBar.style.width = `${Math.min(progress, 100)}%`;
    }
    
    isArticlePage() {
        // 检查当前页面是否是文章页面
        const path = window.location.pathname;
        return path.includes('/detection/') || 
               path.includes('/yolo/') || 
               path.includes('/llama/') ||
               path.includes('/article/');
    }
}

// 图片懒加载
class LazyLoader {
    constructor() {
        this.observer = null;
        this.init();
    }
    
    init() {
        // 检查是否支持IntersectionObserver
        if ('IntersectionObserver' in window) {
            this.observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const img = entry.target;
                        this.loadImage(img);
                        this.observer.unobserve(img);
                    }
                });
            }, {
                rootMargin: '50px 0px',
                threshold: 0.1
            });
            
            this.setupLazyImages();
        } else {
            // 回退方案：直接加载所有图片
            this.loadAllImages();
        }
    }
    
    setupLazyImages() {
        const images = document.querySelectorAll('img[data-src]');
        images.forEach(img => {
            this.observer.observe(img);
        });
    }
    
    loadImage(img) {
        const src = img.getAttribute('data-src');
        if (src) {
            img.src = src;
            img.removeAttribute('data-src');
            img.classList.add('loaded');
        }
    }
    
    loadAllImages() {
        const images = document.querySelectorAll('img[data-src]');
        images.forEach(img => {
            const src = img.getAttribute('data-src');
            if (src) {
                img.src = src;
                img.removeAttribute('data-src');
            }
        });
    }
}

// 主题切换
class ThemeSwitcher {
    constructor() {
        this.currentTheme = 'dark';
        this.init();
    }
    
    init() {
        // 从localStorage读取主题偏好
        const savedTheme = localStorage.getItem('theme');
        if (savedTheme) {
            this.setTheme(savedTheme);
        }
        
        // 创建切换按钮（如果不存在）
        if (!document.getElementById('theme-toggle')) {
            this.createToggleButton();
        }
    }
    
    createToggleButton() {
        const toggleBtn = document.createElement('button');
        toggleBtn.id = 'theme-toggle';
        toggleBtn.innerHTML = '<i class="fas fa-moon"></i>';
        toggleBtn.style.cssText = `
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: var(--gradient-1);
            color: white;
            border: none;
            cursor: pointer;
            z-index: 1000;
            box-shadow: var(--shadow);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            transition: all 0.3s ease;
        `;
        
        toggleBtn.addEventListener('click', () => {
            this.toggleTheme();
        });
        
        document.body.appendChild(toggleBtn);
    }
    
    setTheme(theme) {
        this.currentTheme = theme;
        document.documentElement.setAttribute('data-theme', theme);
        localStorage.setItem('theme', theme);
        
        // 更新按钮图标
        const toggleBtn = document.getElementById('theme-toggle');
        if (toggleBtn) {
            toggleBtn.innerHTML = theme === 'dark' ? 
                '<i class="fas fa-moon"></i>' : 
                '<i class="fas fa-sun"></i>';
        }
    }
    
    toggleTheme() {
        const newTheme = this.currentTheme === 'dark' ? 'light' : 'dark';
        this.setTheme(newTheme);
    }
}

// 初始化所有功能
document.addEventListener('DOMContentLoaded', () => {
    // 阅读进度条
    new ReadingProgress();
    
    // 图片懒加载
    new LazyLoader();
    
    // 主题切换
    new ThemeSwitcher();
    
    console.log('%c📚 博客增强功能已加载', 'color: #6366f1; font-weight: bold;');
});
