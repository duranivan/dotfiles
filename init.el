(require 'package)

;; Not required becuse of Cask and Pallet
; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
; (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
;; (package-initialize) ;; not needed with pallet
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("be4025b1954e4ac2a6d584ccfa7141334ddd78423399447b96b6fa582f206194" "2a5be663818e1e23fd2175cc8dac8a2015dcde6b2e07536712451b14658bbf68" "e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" "4b0a19938f70820b2f24c795cbc1e1c71ebe69fbc03f102deb5c0196b53e04bd" "f9805a89d4309ca29b68c4a6b3d8f13f7931603e59b881515a27535d6ffa1a6e" default)))
 '(markdown-command "markdown")
 '(nlinum-format "%d ")
 '(nlinum-relative-redisplay-delay 0)
 '(package-selected-packages
   (quote
    (evil-easymotion helm-ag auto-complete evil-matchit evil-mc yaml-mode nlinum-relative spaceline helm-descbinds helm-swoop helm-flx helm-fuzzier helm mmm-mode fill-column-indicator markdown-preview-mode markdown-mode robe powerline-evil inf-ruby imenu-anywhere highlight-indent-guides flx counsel swiper company evil-surround evil-leader evil-commentary powerline goto-chg smartparens undo-tree package-build shut-up epl git commander f dash s pallet key-chord ujelly-theme evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:foreground "#626262" :slant italic)))))

(when (eq system-type 'darwin)
  (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")) ;; mac specific settings
(when (eq system-type 'gnu/linux) 
  (require 'cask "~/.cask/cask.el"))

(cask-initialize)

(require 'pallet)
(pallet-mode t)


;; =============================================================================
;; Evil
;; =============================================================================

(global-evil-surround-mode 1)

(setq key-chord-two-keys-delay 0.3)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-insert-state-map "JK" 'evil-normal-state)
(key-chord-define evil-insert-state-map "Jk" 'evil-normal-state)

(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "."  'switch-to-prev-buffer
  "/"  'suspend-frame
  "r"  'eshell-here
  "an" 'helm-imenu-anywhere
  "ag" 'helm-do-ag
  "b"  'helm-mini
  "d"  'helm-descbinds
  "e"  'save-buffers-kill-terminal
  "i"  (lambda ()
         (interactive)
         (find-file "~/.emacs.d/init.el"))
  "l"  'whitespace-mode    ;; Show invisible characters
  "m"  'switch-to-next-buffer
  "q"  'kill-this-buffer
  "s"  'save-buffer
  "z"  (lambda ()
         (interactive)
         (load-file "~/.emacs.d/init.el")))

;; Resizing windows
(define-key evil-normal-state-map (kbd "<left>") 'shrink-window-horizontally)
(define-key evil-normal-state-map (kbd "<right>") 'enlarge-window-horizontally)
(define-key evil-normal-state-map (kbd "<down>") 'shrink-window)
(define-key evil-normal-state-map (kbd "<up>") 'enlarge-window)

;; Better indentation
(define-key evil-visual-state-map (kbd ">") 'better_indentation_right)
(define-key evil-visual-state-map (kbd "<") 'better_indentation_left)

(defun better_indentation_right ()
  (interactive)
  (evil-shift-right (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))
(defun better_indentation_left ()
  (interactive)
  (evil-shift-left (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

;; Scrolling
(define-key evil-normal-state-map (kbd "C-j") 'evil-scroll-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-scroll-up)

;; Evil-commentary
(evil-commentary-mode)

;; Evil - Multiple Cursors
(global-evil-mc-mode  1) ;; enable

;; Evil-matchit
(global-evil-matchit-mode 1)

;; Evil-Easymotion
(evilem-default-keybindings "SPC")


(evil-mode 1)


;;==============================================================================
;; Autocompletetion 
;;==============================================================================

;; Company
(global-company-mode t)
(setq company-tooltip-limit 12)                      ; bigger popup window
(setq company-idle-delay .1)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
;; (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
(setq company-dabbrev-downcase nil)                  ; Do not convert to lowercase
(setq company-selection-wrap-around t)               ; continue from top when reaching bottom
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; =============================================================================
;; Ruby
;; =============================================================================

;; Inf-ruby
(add-hook 'compilation-filter-hook 'inf-ruby-auto-enter)

;; Robe
(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))

;; =============================================================================
;; Helm
;; =============================================================================

;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

(global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

(helm-flx-mode t)
(helm-fuzzier-mode t)
(helm-descbinds-mode)

(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-imenu-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)
(setq helm-swoop-use-fuzzy-match t)
(setq helm-ag-fuzzy-match t)

(setq helm-autoresize-mode t)
(setq helm-buffer-max-length 20)
(setq helm-autoresize-min-height 10)
(setq helm-autoresize-max-height 20)

;; =============================================================================
;; Ivy
;; =============================================================================

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))

;; =============================================================================
;; Themes and looks
;; =============================================================================

;; ujelly theme
(load-theme 'ujelly)

;; Powerline
;; (powerline-default-theme)
;; (powerline-evil-vim-color-theme)
(display-time-mode t)
(require 'spaceline-config)
(spaceline-spacemacs-theme)
(spaceline-helm-mode)

;; Highlight Current Line
(global-hl-line-mode +1)
(set-face-background hl-line-face "#444444")

;; ;; Line numbers
;; (global-linum-mode t)
;; (setq-default truncate-lines t)

;; (defun linum-format-func (line)
;;   (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
;;      (propertize (format (format "%%%dd " w) line) 'face 'linum)))

;; (setq linum-format 'linum-format-func)
;; ;; use customized linum-format: add an addition space after the line number

(global-nlinum-mode t)
(nlinum-relative-setup-evil)
(setq nlinum-relative-redisplay-delay 0)
(add-hook 'prog-mode-hook #'nlinum-relative-mode)

;; show the column number in the status bar
(column-number-mode t)

(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)

;; =============================================================================
;; Markdown
;; =============================================================================

;; (require 'mmm-auto)
;; (setq mmm-global-mode 't)
;; (setq mmm-submode-decoration-level 0)

;; (mmm-add-classes
;;  '((markdown-ruby
;;     :submode ruby-mode
;;     :front "^```ruby[\n\r]+"
;;     :back "^```$")))

;; (mmm-add-mode-ext-class 'markdown-mode nil 'markdown-ruby)

;; =============================================================================
;; Anything else
;; =============================================================================

;; Disable auto-save and backup files
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Disable menu bar and toolbar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Parens handling
;; Show and create matching parens automatically
(show-paren-mode 1)
(require 'smartparens-config)
(smartparens-global-mode 1)
(show-smartparens-global-mode +1)
(setq sp-autoescape-string-quote nil)
;; Do not highlight paren area
(setq sp-highlight-pair-overlay nil)
(setq sp-highlight-wrap-overlay nil)
(setq sp-highlight-wrap-tag-overlay nil)
;; Do not use default slight delay
(setq show-paren-delay 0)
(set-face-background 'sp-show-pair-match-face "magenta")
;; (set-face-background 'sp-show-pair-match-face "blue")
;; Find colors list with M-x list-colors-display

;; Use fill column
;; (setq fill-column 80)

;; Highlight lines beyond 80 column
;; (setq whitespace-line-column 80) ;; limit line length
;; (setq whitespace-style '(face lines-tail))
;; (add-hook 'prog-mode-hook 'whitespace-mode)
;; Fill column indicator
(setq fci-rule-width 1)
(setq fci-rule-color "#444444")
(setq fci-rule-column 80)
(add-hook 'prog-mode-hook 'fci-mode)

;; ;; ;; Remember the cursor position of files when reopening them
(save-place-mode 1)

;; Space indentation - I want tab as two spaces everywhere
(setq-default indent-tabs-mode nil)
(setq-default indent-line-function 2)
(setq-default tab-width 2)

;; Function to open a windown with E-Shell and run file in different environments
(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* (
         (parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t))))

         (-suffix-map
          ;; (‹extension› . ‹shell program name›)
          `(
            ("php" . "php")
            ("py" . "python")
            ;; ("py3" . ,(if (string-equal system-type "windows-nt") "c:/Python32/python.exe" "python3"))
            ("rb" . "ruby")
            ("js" . "node") ; node.js
            ("sh" . "bash")
            ("latex" . "pdflatex")
            ))

         -fname
         -fSuffix
         -prog-name)

    (when (null (buffer-file-name)) (save-buffer))
    (when (buffer-modified-p) (save-buffer))

    (setq -fname (buffer-file-name))
    (setq -fSuffix (file-name-extension -fname))
    (setq -prog-name (cdr (assoc -fSuffix -suffix-map)))

    (if (get-buffer-window (concat "*eshell: " name "*"))
        (progn
          ;; (other-window (get-buffer-window (concat "*eshell: " name "*")))
          (other-window 1)
          (insert "clear")
          (eshell-send-input)
          (insert (concat -prog-name " "-fname))
          (eshell-send-input))
      (split-window-vertically (- height))
      (other-window 1)
      (eshell "new")
      (rename-buffer (concat "*eshell: " name "*"))
      (insert (concat -prog-name " "-fname))
      (eshell-send-input))))

;; Fucntion to exit the Eshell and close the window
(defun eshell-exit ()
  (interactive)
  (insert "exit")
  (eshell-send-input)
  (delete-window))

(global-set-key (kbd "M-d") 'eshell-exit)

;; Customize Eshell's prompt
(setq eshell-prompt-function
          (lambda ()
           (concat (getenv "USER") ":" " " (format-time-string "%Y-%m-%d %H:%M" (current-time))
           (if (= (user-uid) 0) " # " " $ "))))
