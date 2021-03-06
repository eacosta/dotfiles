(use-package org
  :ensure t
  :config
  ;; Export
  (require 'ob-clojure)
  (require 'cider)
  (setq org-html-validation-link nil)
  (setq org-export-html-postamble nil)
  (setq org-export-backends '(ascii html icalendar latex md))
  (setq org-use-sub-superscripts "{}")
  
  ;; File handling
  (setq org-directory "~/Dropbox/org")
  (setq org-default-notes-file (concat org-directory "/default.org"))
  (setq org-log-done t
        org-startup-indented t)

  ;; Agenda
  (setq org-agenda-show-log t
        org-agenda-todo-ignore-scheduled t
        org-agenda-todo-ignore-deadlines t
        org-agenda-skip-deadline-if-done t
        org-agenda-skip-scheduled-if-done t
        org-agenda-include-diary t
        org-agenda-files (list "~/Dropbox/org/agenda.org"))

  ;; Todo Lists
  (setq org-todo-keywords '((type "TODO" "IN-PROGRESS" "|" "DONE"))
        org-todo-keyword-faces '(("INPROGRESS" . (:foreground "blue" :weight bold))))
  (add-hook 'org-mode-hook
            (lambda ()
              (flyspell-mode)
              (auto-fill-mode)))

  (setq org-babel-clojure-backend 'cider
        org-fontify-done-headline t
        org-src-fontify-natively t
        org-confirm-babel-evaluate nil
        org-src-window-setup 'current-window)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (sh         . t)
     (clojure    . t)
     (java       . t)
     (js         . t)
     (ruby       . t)
     (python     . t)))

  (add-to-list 'org-babel-tangle-lang-exts '("clojure" . "clj"))
  (add-to-list 'org-babel-tangle-lang-exts '("js"      . "js"))
  :bind
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package ox-reveal
  :ensure t
  :config
  (setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/"))

(use-package htmlize
  :ensure t)

(require 'prelude-latex)
