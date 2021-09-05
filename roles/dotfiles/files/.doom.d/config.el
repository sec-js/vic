;; doom
;;
(setq doom-font (font-spec :family "JetBrains Mono" :size 24)
      doom-big-font (font-spec :family "JetBrains Mono" :size 36)
      doom-variable-pitch-font (font-spec :family "Overpass" :size 24)
      doom-unicode-font (font-spec :family "JuliaMono")
      doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))

(setq user-full-name "Victor Igor"
      user-mail-address "victor.0w3@gmail.com")
(setq doom-theme 'doom-monokai-pro)
(setq org-directory "~/org/")
(setq display-line-numbers-type t)

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
(add-hook 'web-mode-hook 'prettier-js-mode)

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

(setq scroll-conservatively 101)
