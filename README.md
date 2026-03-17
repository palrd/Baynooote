# baynooote

视频展示链接：
https://www.bilibili.com/video/BV1E9wUztEJV/?vd_source=6a5ec63f29e4ff95a269505dde7ee5c7


Baynooote 记账微应用 (个人极客探索项目)
独立开发 技术栈：Flutter + 纯原生动画 API + 局部状态管理
• 项目描述：一款追求极致 UI/UX 的极客记账应用。以 Telegram 的交互体验为标杆，打造高交互性、高
流畅度的沉浸式界面。
• 底层动画引擎调度：熟练运用 AnimationController、TweenSequence 以及 Curve (弹簧阻尼模型)，从
零构建“Q 弹”物理反馈动画体系，实现丝滑的视图切换与组件过渡交互。
• 动画性能极速调优 (核心)：针对动画执行时每秒 60/120 次的高频重绘诉求，深入剖析 Flutter 渲染管
线。通过 AnimatedBuilder、ValueListenableBuilder 以及 Widget 树拆分，实现“重绘状态的绝对隔离
(RepaintBoundary)”，减少动画过程中的无效整树 Rebuild，将 CPU 渲染开销降至最低。
• 触觉与视觉协同：集成 HapticFeedback 震动 API，将视觉形变与物理震感对齐，提供细腻的终端用户
交互体验。

