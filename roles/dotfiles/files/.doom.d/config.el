(setq user-full-name "Victor Igor"
      user-mail-address "victor.0w3@gmail.com")
(setq doom-theme 'doom-monokai-pro)
(setq org-directory "~/org/")
(setq display-line-numbers-type t)

(setq
  global-whitespace-mode +1)

;; Package Configs
;;
;;
;; expand-region
(map! :n "SPC v" #'er/expand-region)

;; prettier-js
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

(setq prettier-js-args '(
  "--trailing-comma" "all"
  "--bracket-spacing" "false"
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

