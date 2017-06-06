;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(eval-when-compile (require 'cl))
(lexical-let ((emacs-start-time (current-time)))
  (add-hook 'emacs-startup-hook
            (lambda ()
              (let ((elapsed (float-time (time-subtract (current-time) emacs-start-time))))
                (message "[Emacs initialized in %.3fs]" elapsed)))))

(setq gc-cons-threshold (* 256 1024 1024))
(package-initialize)

(add-hook 'emacs-startup-hook 'toggle-frame-maximized)

;; Load all lisp files
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

; Prevent blob at bottom of init.el
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

(setq dotemacs-cache-directory (concat user-emacs-directory ".cache/"))

(defmacro after (feature &rest body)
  (declare (indent 1))
  (cond
   ((vectorp feature)
    (let ((prog (macroexp-progn body)))
      (cl-loop for f across feature
               do
               (progn
                 (setq prog (append `(',f) `(,prog)))
                 (setq prog (append '(with-eval-after-load) prog))))
      prog))
   (t
    `(with-eval-after-load ,feature ,@body))))


(require 'init-elpa)
(require 'init-core)
(require 'init-evil)
(require 'init-helm)
(require 'init-hydra)
(require 'init-company)
(require 'init-theme)
(require 'init-flycheck)
(require 'init-eshell)
(require 'init-org)
(require 'init-misc)
(require 'init-bindings)
(require 'init-util)

(setq default-directory "~/" )
