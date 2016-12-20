(defun config-evil-leader ()
  "Configure evil leader mode."
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "w"  'save-buffer))

(require-package 'evil)
(require 'evil)
(evil-mode)

(require-package 'evil-surround)
(global-evil-surround-mode)

(require-package 'evil-leader)
(global-evil-leader-mode)
(config-evil-leader)

(provide 'init-evil)

