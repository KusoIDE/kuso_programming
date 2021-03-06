;;   Kuso IDE
;;    Copyright (C) 2010-2014  Sameer Rahmani <lxsameer@gnu.org>
;;
;;    This program is free software: you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation, either version 3 of the License, or
;;    any later version.
;;
;;    This program is distributed in the hope that it will be useful,
;;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;    GNU General Public License for more details.
;;
;;    You should have received a copy of the GNU General Public License
;;    along with this program.  If not, see <http://www.gnu.org/licenses/>.
(message "Initializing 'kuso-programming' plugin.")


;; Autocomplete configurations -----------------------------------
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat default-directory "../ac-dict"))
(ac-config-default)

;; Remove return key from completion map
(define-key ac-completing-map "\r" nil)
(define-key ac-completing-map [return] nil)

(global-auto-complete-mode t)

;; ac-dabbrev configuratio ----------------------------------------
(require 'ac-dabbrev)
(setq ac-sources
      (list ac-source-dabbrev))
(global-set-key (kbd "<backtab>") 'dabbrev-expand)



;; Yasnippet configurations ---------------------------------------
;(add-to-list 'load-path (concat default-directory "../yasnippet"))

;(if (eq (file-exists-p (concat default-directory "../snippets")) nil)
;    (make-directory (concat default-directory "../snippets"))
;  )
(setq yas-snippet-dirs (list (concat default-directory "../snippets")
                             (concat default-directory "../kuso-snippets/snippets")
                             (concat default-directory "../yasnippet/yasmate/snippets")
                             (concat default-directory "../yasnippet/snippets")))
                                        ;(cons "../snippets" yas-snippet-dirs)
(yas-global-mode 1)


;; Projectile -----------------------------------------------------
(projectile-global-mode)
(setq projectile-enable-caching t)

;; Indent Guide ---------------------------------------------------
(require 'indent-guide)
;(setq indent-guide-char (char-to-string ?\u205e))
(indent-guide-global-mode)

;; Enhancements ---------------------------------------------
(autopair-global-mode t)

;; Project-explorer -----------------------------------------
(setq pe/width 30)
(global-set-key (kbd "\C-c q") 'project-explorer-open)

;; Git Gutter Fringe -------------------------------------------------------
;(require 'git-gutter-fringe)
;(global-git-gutter-mode t)
;(setq-default left-fringe-width  10)
;(setq git-gutter-fr:side (quote left-fringe))
;(setq git-gutter:hide-gutter nil)
;(setq git-gutter:lighter "GG")
;(setq linum-format (quote dynamic))

(require 'diff-hl)
(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

(set-face-foreground 'indent-guide-face "#bbb")

;; Flycheck -------------------------------------------------------
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Flyspell -------------------------------------------------------
(require 'flyspell)
(setq flyspell-issue-message-flg nil)
(ac-flyspell-workaround)
