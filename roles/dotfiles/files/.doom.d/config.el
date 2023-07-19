(setq doom-font (font-spec :family "Fira Code" :size 18)
      doom-big-font (font-spec :family "JetBrains Mono" :size 32)
      doom-variable-pitch-font (font-spec :family "Overpass" :size 20)
      doom-unicode-font (font-spec :family "JuliaMono")
      doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light)
      projectile-project-search-path '("~/Documents/work" "~/Documents/personal"))

(setq user-full-name "Victor Igor"
      user-mail-address "victor.0w3@gmail.com")

(setq fancy-splash-image "~/Pictures/wallpaper/dinocode.png")

;; (setq +doom-dashboard-menu-sections (cl-subseq +doom-dashboard-menu-sections 0 2))

(assoc-delete-all "Open project" +doom-dashboard-menu-sections)
(assoc-delete-all "Reload last eession" +doom-dashboard-menu-sections)
(assoc-delete-all "Open org-agenda" +doom-dashboard-menu-sections)
(assoc-delete-all "Recently opened files" +doom-dashboard-menu-sections)
(assoc-delete-all "Jump to bookmark" +doom-dashboard-menu-sections)
(assoc-delete-all "Open private configuration" +doom-dashboard-menu-sections)
(assoc-delete-all "Open documentation" +doom-dashboard-menu-sections)

(setq display-line-numbers-type t)

(setq doom-theme 'doom-monokai-pro)

(setq org-directory "~/org/")

(setq display-line-numbers-type t)

(add-hook 'window-setup-hook #'toggle-frame-maximized)

(add-hook 'dired-mode-hook
      (lambda ()
        (dired-hide-details-mode)
        (dired-sort-toggle-or-edit)))

(setq
  global-whitespace-mode +1)
;; Package Configs
;;
;;
;; expand-region
(map! :n "SPC v" #'er/expand-region)
;;
;;
;;
;;Avy
(map! :n "SPC j" #'avy-goto-char)
(map! :n "SPC k" #'avy-goto-char)

;; prettier-js
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

(exec-path-from-shell-initialize)

(setq prettier-js-args '(
  "--trailing-comma" "all"
  "--bracket-spacing" "true"
))


;; JS

(setq-default
  ident-tabs-mode nil)

(map! :leader
      (:prefix-map ("e" . "eval")
       ("r" #'nodejs-repl-send-region)
       ("f" #'nodejs-repl-load-file)))
(map! :leader
      :ne "l" #'js2r-log-this)

(map! :leader
      (:prefix-map ("t" . "toggle")
       ("-" #'centered-cursor-mode)))

;; (map! :leader
;;       (:prefix-map ("o" . "open")
;;        ("p" #'treemacs-display-current-project-exclusively)))

(setq scroll-conservatively 101)

(require 'mmm-mode)

(mmm-add-classes
    '((js-graphql
          :submode graphql-mode
          :face mmm-declaration-submode-face
          :front "[^a-zA-Z]gql`" ;; regex to find the opening tag
          :back "`"))) ;; regex to find the closing tag

(mmm-add-mode-ext-class 'js-mode nil 'js-graphql)

(setq mmm-global-mode 'maybe)
(setq mmm-submode-decoration-level 0)

(add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 2)))


;;markdown
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))


;;add icons
(set-fontset-font t 'unicode (font-spec :family "all-the-icons") nil 'append)
(set-fontset-font t 'unicode (font-spec :family "file-icons") nil 'append)
(set-fontset-font t 'unicode (font-spec :family "Material Icons") nil 'append)
(set-fontset-font t 'unicode (font-spec :family "github-octicons") nil 'append)
(set-fontset-font t 'unicode (font-spec :family "FontAwesome") nil 'append)
(set-fontset-font t 'unicode (font-spec :family "Weather Icons") nil 'append)
(unicode-fonts-setup)


;;beautify
;;

(eval-after-load 'css-mode
  '(add-hook 'css-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))

(eval-after-load 'scss-mode
  '(add-hook 'scss-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))

(eval-after-load 'stylus-mode
  '(add-hook 'stylus-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))


;; astro
(setq auto-mode-alist
    (append '((".*\\.astro\\'" . web-mode))
        auto-mode-alist))
