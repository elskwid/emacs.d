;; turn em off
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; disable the splash screen
(setq inhibit-splash-screen t)

;; theme
(load-theme 'base16-chalk-dark t)
