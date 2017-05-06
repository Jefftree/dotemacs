(require-package 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

(require 'tramp)
(setq tramp-default-method "rsync")
(setq tramp-completion-reread-directory-timeout nil)

(defun add-ssh-agent-to-tramp ()
  (cl-pushnew '("-A")
              (cadr (assoc 'tramp-login-args
                           (assoc "ssh" tramp-methods)))
              :test #'equal))
(add-ssh-agent-to-tramp)


(provide 'init-util)
