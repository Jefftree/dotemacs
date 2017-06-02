(package-initialize)
(require 'package)
(setq package-enable-at-startup nil)

(setq packages-archives '(("org" . "http://orgmode.org/elpa/")
                          ("melpa" . "http://melpa.org/packages/")
                          ("marmalade" . "https://marmalade-repo.org/packages/")))

(defun require-package (package)
  "Ensures that package is installed."
  (unless (or (package-installed-p package)
              (require package nil 'noerror))
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(require-package 'cl-lib)
(require 'cl-lib)

(provide 'init-elpa)
