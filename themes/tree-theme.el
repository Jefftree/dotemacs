;;; tree-theme.el

;; Forked from <https://github.com/synic/jbeans-emacs>
(deftheme tree "The tree color theme")

(let ((class '((class color) (min-colors 89)))
      ;;                                            GUI       TER
      (tree-fg         (if (display-graphic-p) "#cccccc" "#cccccc"))
      (tree-bg         (if (display-graphic-p) "#151515" "#151515"))
      (tree-grey-0     (if (display-graphic-p) "#151515" "#151515"))
      (tree-grey-1     (if (display-graphic-p) "#112433" "#112433"))
      (tree-grey-2     (if (display-graphic-p) "#222222" "#222222"))
      (tree-grey-3     (if (display-graphic-p) "#333344" "#444455"))
      (tree-grey-4     (if (display-graphic-p) "#363636" "#363636"))
      (tree-grey-5     (if (display-graphic-p) "#444444" "#444444"))
      (tree-grey-6     (if (display-graphic-p) "#7f7f7f" "#7f7f7f"))
      (tree-grey-7     (if (display-graphic-p) "#888888" "#888888"))
      (tree-purple-0   (if (display-graphic-p) "#ff73fd" "#ff73fd"))
      (tree-purple-1   (if (display-graphic-p) "#cd00cd" "#cd00cd"))
      (tree-purple-2   (if (display-graphic-p) "#a40073" "#a40073"))
      (tree-purple-3   (if (display-graphic-p) "#540063" "#540063"))
      (tree-purple-4   (if (display-graphic-p) "#474e90" "#474e90"))
      (tree-blue-0     (if (display-graphic-p) "#8197bf" "#8197bf"))
      (tree-blue-1     (if (display-graphic-p) "#8fbfdc" "#8fbfdc"))
      (tree-blue-2     (if (display-graphic-p) "#b2e2fe" "#b2e2fe"))
      (tree-blue-3     (if (display-graphic-p) "#447799" "#447799"))
      (tree-blue-4     (if (display-graphic-p) "#0b24fb" "#0b24fb"))
      (tree-blue-5     (if (display-graphic-p) "#2dfffe" "#2dfffe"))
      (tree-green-0    (if (display-graphic-p) "#ddffdd" "#ddffdd"))
      (tree-green-1    (if (display-graphic-p) "#b6edb6" "#b6edb6"))
      (tree-green-2    (if (display-graphic-p) "#448844" "#448844"))
      (tree-green-3    (if (display-graphic-p) "#556a32" "#556a32"))
      (tree-green-4    (if (display-graphic-p) "#335533" "#335533"))
      (tree-green-5    (if (display-graphic-p) "#99ad6a" "#99ad6a"))
      (tree-green-6    (if (display-graphic-p) "#a8ff60" "#a8ff60"))
      (tree-green-7    (if (display-graphic-p) "#29fd2f" "#29fd2f"))
      (tree-yellow-0   (if (display-graphic-p) "#ffffcc" "#ffffcc"))
      (tree-yellow-1   (if (display-graphic-p) "#ffff00" "#ffff00"))
      (tree-yellow-2   (if (display-graphic-p) "#eddb87" "#eddb87"))
      (tree-yellow-3   (if (display-graphic-p) "#fad07a" "#fad07a"))
      (tree-orange-0   (if (display-graphic-p) "#ffb964" "#ffb964"))
      (tree-orange-1   (if (display-graphic-p) "#ff8c00" "#ebbd87"))
      (tree-orange-2   (if (display-graphic-p) "#b78521" "#b78521"))
      (tree-red-0      (if (display-graphic-p) "#cb8165" "#cb8165"))
      (tree-red-1      (if (display-graphic-p) "#cf6a4c" "#cf6a4c"))
      (tree-red-2      (if (display-graphic-p) "#de5577" "#de5577"))
      (tree-red-3      (if (display-graphic-p) "#fc644d" "#fc644d"))
      (tree-red-4      (if (display-graphic-p) "#dd0093" "#dd0093"))
      (tree-red-5      (if (display-graphic-p) "#aa4444" "#aa4444"))
      (tree-red-6      (if (display-graphic-p) "#8a3b3c" "#8a3b3c"))
      (tree-red-7      (if (display-graphic-p) "#663333" "#663333"))
      (tree-red-8      (if (display-graphic-p) "#fc0d1b" "#fc0d1b"))
      (tree-red-9      (if (display-graphic-p) "#ffdddd" "#ffdddd"))
      )

      (custom-theme-set-variables
        'tree
        `(nlinum-format "%3i "))

      (custom-theme-set-faces
       'tree
       `(default                             ((,class (:foreground ,tree-fg :background ,tree-bg))))

;;;;; Company
       `(company-tooltip ((, class (:foreground ,tree-fg :background ,tree-grey-0))))
       `(company-scrollbar-fg                ((,class (:background ,tree-grey-1))))
       `(company-scrollbar-bg                ((,class (:background ,tree-grey-0))))
       `(company-tooltip-selection           ((,class (:background ,tree-purple-3))))
       `(company-tooltip-common              ((,class (:foreground, tree-red-8, :inherit company-tooltip :weight bold :underline nil))))

;;;;; Compilation
       `(compilation-error                   ((,class (:foreground ,tree-red-1))))
       `(compilation-info                    ((,class (:foreground ,tree-yellow-3))))
       `(compilation-line-number             ((,class (:foreground ,tree-grey-7))))
       `(compilation-mode-line-exit          ((,class (:foreground ,tree-green-5))))
       `(compilation-mode-line-fail          ((,class (:foreground ,tree-red-1))))
       `(compilation-mode-line-run           ((,class (:foreground ,tree-yellow-3))))

;;;;; Dired
       `(diredp-compressed-file-name         ((,class (:foreground ,tree-red-7))))
       `(diredp-compressed-file-suffix       ((,class (:foreground ,tree-fg))))
       `(diredp-date-time                    ((,class (:foreground ,tree-green-5))))
       `(diredp-deletion                     ((,class (:foreground ,tree-red-1 :background ,tree-bg))))
       `(diredp-dir-heading                  ((,class (:foreground ,tree-yellow-3 :background ,tree-bg))))
       `(diredp-dir-priv                     ((,class (:foreground ,tree-purple-2 :background ,tree-bg))))
       `(diredp-exec-priv                    ((,class (:foreground ,tree-orange-2 :background ,tree-bg))))
       `(diredp-file-name                    ((,class (:foreground ,tree-green-0))))
       `(diredp-file-suffix                  ((,class (:foreground ,tree-fg))))
       `(diredp-flag-mark                    ((,class (:foreground ,tree-blue-0 :weight bold))))
       `(diredp-flag-mark-line               ((,class (:foreground ,tree-purple-4 :weight bold))))
       `(diredp-link-priv                    ((,class (:foreground ,tree-fg))))
       `(diredp-number                       ((,class (:foreground ,tree-grey-6))))
       `(diredp-no-priv                      ((,class (:foreground ,tree-fg :background ,tree-bg))))
       `(diredp-rare-priv                    ((,class (:foreground ,tree-red-1 :background ,tree-bg))))
       `(diredp-read-priv                    ((,class (:foreground ,tree-yellow-3 :background ,tree-bg))))
       `(diredp-symlink                      ((,class (:foreground ,tree-blue-0))))
       `(diredp-dir-name                     ((,class (:foreground ,tree-blue-2))))
       `(diredp-write-priv                   ((,class (:foreground ,tree-blue-0 :background ,tree-bg))))

;;;;;; EShell
       `(eshell-prompt                       ((,class (:foreground ,tree-red-1))))
       `(eshell-ls-directory                 ((,class (:weight normal :foreground ,tree-green-6))))
       `(eshell-ls-executable                ((,class (:weight normal :foreground ,tree-red-1))))
       `(eshell-ls-product                   ((,class (:foreground ,tree-fg))))
       `(eshell-ls-symlink                   ((,class (:weight normal :foreground ,tree-purple-1))))

;;;;; Evil
       `(evil-visual-mark-face               ((,class (:weight ultra-bold :box ,tree-blue-0 :foreground ,tree-green-7))))

;;;;; Fonts
       `(font-lock-builtin-face              ((,class (:foreground ,tree-blue-1))))
       `(font-lock-comment-face              ((,class (:foreground ,tree-grey-7))))
       `(font-lock-comment-delimiter-face              ((,class (:foreground ,tree-green-3))))
       `(font-lock-constant-face             ((,class (:foreground ,tree-blue-3))))
       `(font-lock-doc-face                  ((,class (:foreground ,tree-green-5))))
       `(font-lock-function-name-face        ((,class (:foreground ,tree-yellow-3))))
       `(font-lock-keyword-face              ((,class (:foreground ,tree-blue-0))))
       `(font-lock-preprocessor-face         ((,class (:foreground ,tree-fg))))
       `(font-lock-string-face               ((,class (:foreground ,tree-green-5))))
       `(font-lock-type-face                 ((,class (:foreground ,tree-orange-0))))
       `(font-lock-variable-name-face        ((,class (:foreground ,tree-red-1))))
       `(font-lock-warning-face              ((,class (:foreground ,tree-red-4))))
       `(font-lock-regexp-grouping-construct ((,class (:foreground ,tree-yellow-3 :bold t))))
       `(font-lock-regexp-grouping-backslash ((,class (:foreground ,tree-red-1 :bold t))))

;;;;; Fringe
       `(fringe                              ((,class (:foreground ,tree-fg :background ,nil))))

;;;;; Header
       `(header-line                         ((,class (:foreground ,tree-fg))))

;;;;; Helm
       `(helm-visible-mark                   ((,class (:background ,tree-green-4 :foreground ,tree-bg))))
       `(helm-buffer-file                    ((,class (:foreground ,tree-fg))))
       `(helm-buffer-directory               ((,class (:foreground ,tree-blue-0))))
       `(helm-buffer-process                 ((,class (:foreground ,tree-yellow-3))))
       `(helm-buffer-size                    ((,class (:foreground ,tree-fg))))
       `(helm-candidate-number               ((,class (:foreground ,tree-fg :background ,tree-bg))))
       `(helm-grep-lineno                    ((,class (:foreground ,tree-fg))))
       `(helm-grep-finish                    ((,class (:foreground ,tree-blue-2))))
       `(helm-match                          ((,class (:foreground ,tree-red-4 :background ,tree-bg))))
       `(helm-moccur-buffer                  ((,class (:foreground ,tree-yellow-3))))
       `(helm-selection                      ((,class (:background ,tree-grey-3))))
       `(helm-source-header                  ((,class (:foreground ,tree-fg :bold t :background ,tree-green-4))))
       `(helm-swoop-target-line-face         ((,class (:foreground ,tree-fg :background ,tree-grey-4))))
       `(helm-swoop-target-word-face         ((,class (:foreground ,tree-red-4))))
       `(helm-ff-file                        ((,class (:foreground ,tree-fg))))
       `(helm-ff-directory                   ((,class (:foreground ,tree-blue-2))))
       `(helm-ff-executable                  ((,class (:foreground ,tree-green-5))))

;;;;; Highlight
       `(highlight                           ((,class (:background ,tree-grey-3))))
       `(hl-line                             ((,class (:background ,tree-grey-2))))

;;;;; iSearch
       `(isearch                             ((,class (:foreground ,tree-fg :background ,tree-red-4))))
       `(isearch-fail                        ((,class (:background ,tree-red-4))))

;;;;; Ido
       `(ido-first-match                     ((,class (:foreground ,tree-yellow-3))))
       `(ido-only-match                      ((,class (:foreground ,tree-green-5))))
       `(ido-subdir                          ((,class (:foreground ,tree-fg))))
       `(ido-virtual                         ((,class (:foreground
                                                       ,tree-blue-0))))

;;;;; Lazy highlight
       `(lazy-highlight                      ((,class (:foreground ,tree-red-4 :background nil))))

;;;;; Linum
       `(linum                               ((,class (:foreground ,tree-grey-6 :background ,nil))))

;;;;; Ediff
       `(ediff-even-diff-A                   ((,class (:background ,tree-grey-2 :foreground ,tree-fg))))
       `(ediff-even-diff-B                   ((,class (:background ,tree-grey-3 :foreground ,tree-fg))))
       `(ediff-even-diff-C                   ((,class (:background ,tree-grey-3 :foreground ,tree-fg))))
       `(ediff-odd-diff-A                    ((,class (:background ,tree-grey-2 :foreground ,tree-fg))))
       `(ediff-odd-diff-B                    ((,class (:background ,tree-grey-3 :foreground ,tree-fg))))
       `(ediff-odd-diff-C                    ((,class (:background ,tree-grey-5 :foreground ,tree-fg))))

;;;;; flycheck
       `(flycheck-error                      ((((supports :underline (:style wave)))
                                               (:underline (:style wave :color ,tree-red-4) :inherit unspecified))
                                              (,class (:underline (:style line :color ,tree-red-4)))))
       `(flycheck-warning                    ((((supports :underline (:style wave)))
                                               (:underline (:style wave :color ,tree-yellow-3) :inherit unspecified))
                                              (,class (:underline (:style line :color ,tree-yellow-3)))))
       `(flycheck-info                       ((((supports :underline (:style wave)))
                                               (:underline (:style wave :color ,tree-blue-5) :inherit unspecified))
                                              (,class (:underline (:style line :color ,tree-blue-5)))))
       `(flycheck-fringe-error               ((,class (:foreground ,tree-red-4 :weight bold))))
       `(flycheck-fringe-warning             ((,class (:foreground ,tree-yellow-3 :weight bold))))
       `(flycheck-fringe-info                ((,class (:foreground ,tree-blue-5 :weight bold))))

;;;;; flyspell
       `(flyspell-duplicate                  ((((supports :underline (:style wave)))
                                               (:underline (:style wave :color ,tree-orange-1) :inherit unspecified))
                                              (,class (:underline (:style line :color ,tree-orange-1)))))
       `(flyspell-incorrect                  ((((supports :underline (:style wave)))
                                               (:underline (:style wave :color ,tree-red-8) :inherit unspecified))
                                              (,class (:underline (:style line :color ,tree-red-8)))))

;;;;; Git
       `(git-commit-comment-file             ((,class (:background ,tree-bg :foreground ,tree-fg))))
       `(git-commit-summary                  ((,class (:background ,tree-bg :foreground ,tree-blue-0))))
       `(git-commit-comment-heading          ((,class (:foreground ,tree-yellow-3))))

;;;;; Git-gutter

       `(git-gutter-fr:modified              ((,class (:foreground ,tree-yellow-3 :background , tree-bg))))
       `(git-gutter-fr:added                 ((,class (:foreground ,tree-green-6 :background , tree-bg))))
       `(git-gutter-fr:deleted               ((,class (:foreground ,tree-red-8 :background , tree-bg))))

;;;;; Magit
       `(magit-blame-heading                 ((,class (:background ,tree-grey-2 :box ,tree-purple-4 :weight bold :foreground ,tree-fg))))
       `(magit-blame-date                    ((,class (:background ,tree-grey-0 :box ,tree-green-3 :weight bold :foreground ,tree-green-5))))
       `(magit-blame-name                    ((,class (:background ,tree-grey-0 :box ,tree-green-3 :weight bold :foreground ,tree-red-0))))
       `(magit-blame-hash                    ((,class (:background ,tree-grey-0 :box ,tree-green-3 :weight bold :foreground ,tree-blue-3))))
       `(magit-bisect-bad                    ((,class (:foreground ,tree-red-6))))
       `(magit-bisect-good                   ((,class (:foreground ,tree-green-3))))
       `(magit-bisect-skip                   ((,class (:foreground ,tree-orange-2))))
       `(magit-blame-summary                 ((,class (:inherit magit-blame-heading))))
       `(magit-branch-current                ((,class (:inherit magit-branch-local :box 1))))
       `(magit-branch-local                  ((,class (:foreground ,tree-blue-2))))
       `(magit-branch-remote                 ((,class (:foreground ,tree-green-5))))
       `(magit-cherry-equivalent             ((,class (:foreground ,tree-purple-1))))
       `(magit-cherry-unmatched              ((,class (:foreground ,tree-blue-5))))
       `(magit-diff-added                    ((,class (:background ,tree-green-4 :foreground ,tree-green-0))))
       `(magit-diff-added-highlight          ((,class (:background ,tree-green-4 :foreground ,tree-green-0))))
       `(magit-diff-base                     ((,class (:background ,tree-green-3 :foreground ,tree-yellow-0))))
       `(magit-diff-base-highlight           ((,class (:background ,tree-green-3 :foreground ,tree-yellow-0))))
       `(magit-diff-conflict-heading         ((,class (:inherit magit-diff-hunk-heading))))
       `(magit-diff-context                  ((,class (:background ,tree-bg :foreground ,tree-fg))))
       `(magit-diff-context-highlight        ((,class (:background ,tree-bg :foreground ,tree-fg))))
       `(magit-diff-file-heading             ((,class (:foreground ,tree-blue-0 :weight bold))))
       `(magit-diff-file-heading-highlight   ((,class (:foreground ,tree-blue-0 :weight normal))))
       `(magit-diff-file-heading-selection   ((,class (:background ,tree-bg :foreground ,tree-fg))))
       `(magit-diff-hunk-heading             ((,class (:background ,tree-grey-3 :box ,tree-grey-3  :foreground ,tree-fg :weight bold))))
       `(magit-diff-hunk-heading-highlight   ((,class (:background ,tree-grey-3 :box ,tree-grey-7 :weight bold :foreground ,tree-fg))))
       `(magit-diff-hunk-heading-selection   ((,class (:inherit magit-diff-hunk-heading-highlight :foreground ,tree-red-0))))
       `(magit-diff-lines-boundary           ((,class (:inherit magit-diff-lines-heading))))
       `(magit-diff-lines-heading            ((,class (:inherit magit-diff-hunk-heading-highlight :background ,tree-red-6 :foreground ,tree-fg))))
       `(magit-diff-our                      ((,class (:inherit magit-diff-removed))))
       `(magit-diff-our-highlight            ((,class (:inherit magit-diff-removed-highlight))))
       `(magit-diff-removed                  ((,class (:background ,tree-red-7 :foreground ,tree-red-9))))
       `(magit-diff-removed-highlight        ((,class (:background ,tree-red-7 :foreground ,tree-red-9))))
       `(magit-diff-their                    ((,class (:inherit magit-diff-added))))
       `(magit-diff-their-highlight          ((,class (:inherit magit-diff-added-highlight))))
       `(magit-diff-whitespace-warning       ((,class (:inherit trailing-whitespace))))
       `(magit-diffstat-added                ((,class (:foreground ,tree-green-2))))
       `(magit-diffstat-removed              ((,class (:foreground ,tree-red-5))))
       `(magit-dimmed                        ((,class (:background ,tree-bg :foreground ,tree-grey-6))))
       `(magit-filename                      ((,class (:foreground ,tree-orange-2 :weight normal))))
       `(magit-hash                          ((,class (:foreground ,tree-grey-5))))
       `(magit-head                          ((,class (:inherit magit-branch-local))))
       `(magit-header-line                   ((,class (:inherit magit-section-heading))))
       `(magit-log-author                    ((,class (:foreground ,tree-blue-0))))
       `(magit-log-date                      ((,class (:foreground ,tree-green-5))))
       `(magit-log-graph                     ((,class (:foreground ,tree-fg))))
       `(magit-popup-argument                ((,class (:inherit font-lock-warning-face))))
       `(magit-popup-disabled-argument       ((,class (:inherit shadow))))
       `(magit-popup-heading                 ((,class (:inherit font-lock-keyword-face))))
       `(magit-popup-key                     ((,class (:inherit font-lock-builtin-face))))
       `(magit-popup-option-value            ((,class (:inherit font-lock-string-face))))
       `(magit-process-ng                    ((,class (:inherit magit-section-heading :foreground ,tree-red-8))))
       `(magit-process-ok                    ((,class (:inherit magit-section-heading :foreground ,tree-green-7))))
       `(magit-reflog-amend                  ((,class (:foreground ,tree-purple-1))))
       `(magit-reflog-checkout               ((,class (:foreground ,tree-blue-5))))
       `(magit-reflog-cherry-pick            ((,class (:foreground ,tree-green-7))))
       `(magit-reflog-commit                 ((,class (:foreground ,tree-green-7))))
       `(magit-reflog-merge                  ((,class (:foreground ,tree-green-7))))
       `(magit-reflog-other                  ((,class (:foreground ,tree-blue-5))))
       `(magit-reflog-rebase                 ((,class (:foreground ,tree-purple-1))))
       `(magit-reflog-remote                 ((,class (:foreground ,tree-blue-5))))
       `(magit-reflog-reset                  ((,class (:foreground ,tree-red-8))))
       `(magit-refname                       ((,class (:background ,tree-bg :foreground ,tree-fg))))
       `(magit-refname-stash                 ((,class (:inherit magit-refname))))
       `(magit-refname-wip                   ((,class (:inherit magit-refname))))
       `(magit-section-heading               ((,class (:background ,tree-bg :foreground ,tree-yellow-3))))
       `(magit-section-highlight             ((,class (:background ,tree-bg))))
       `(magit-section-secondary-heading     ((,class (:background ,tree-bg :weight bold))))
       `(magit-sequence-done                 ((,class (:inherit magit-hash))))
       `(magit-sequence-drop                 ((,class (:foreground ,tree-red-5))))
       `(magit-sequence-head                 ((,class (:foreground ,tree-blue-2))))
       `(magit-sequence-onto                 ((,class (:inherit magit-sequence-done))))
       `(magit-sequence-part                 ((,class (:foreground ,tree-yellow-2))))
       `(magit-sequence-pick                 ((,class (:inherit default))))
       `(magit-sequence-stop                 ((,class (:foreground ,tree-green-1))))
       `(magit-signature-bad                 ((,class (:foreground ,tree-red-8))))
       `(magit-signature-good                ((,class (:foreground ,tree-green-7))))
       `(magit-signature-untrusted           ((,class (:foreground ,tree-blue-5))))
       `(magit-tag                           ((,class (:foreground ,tree-yellow-2))))

;;;;; Match
       `(match                               ((,class (:background ,tree-red-4))))

;;;;; Minibuffer
       `(minibuffer-prompt                   ((,class (:foreground ,tree-yellow-3))))

;;;;; Modeline
       `(mode-line                           ((,class (:foreground ,tree-green-6 :background ,tree-grey-0 :weight bold))))
   `(mode-line-buffer-id ((,class (:foreground ,tree-yellow-2 :weight bold))))
       `(mode-line-inactive                  ((,class (:foreground ,tree-grey-6 :background ,tree-grey-0))))
       `(powerline-active1 ((,class (:background ,tree-grey-2 :inherit mode-line))))
       `(powerline-active2 ((,class (:background ,tree-grey-0 :inherit mode-line))))
       `(powerline-inactive1 ((,class (:background ,tree-grey-1 :inherit mode-line-inactive))))
       `(powerline-inactive2 ((,class (:background ,tree-grey-1 :inherit mode-line-inactive))))

;;;;; NeoTree
       `(neo-dir-link-face                   ((,class (:foreground ,tree-blue-0))))
       `(neo-file-link-face                  ((,class (:foreground ,tree-fg))))

;;;;; Org
       `(org-checkbox                        ((,class (:foreground ,tree-green-5))))
       `(org-date                            ((,class (:foreground ,tree-blue-0))))
       `(org-document-title                  ((,class (:foreground ,tree-red-9))))
       `(org-todo                            ((,class (:foreground ,tree-red-3 :weight bold))))
       `(org-done                            ((,class (:foreground ,tree-green-6))))
       `(org-headline-done                   ((,class (:foreground ,tree-grey-7))))
       `(org-level-1                         ((,class (:foreground ,tree-orange-0 :weight bold))))
       `(org-level-2                         ((,class (:foreground ,tree-blue-2))))
       `(org-level-3                         ((,class (:foreground ,tree-yellow-2))))
       `(org-level-4                         ((,class (:foreground ,tree-red-3))))
       `(org-level-5                         ((,class (:foreground ,tree-green-1))))
       `(org-level-6                         ((,class (:foreground ,tree-purple-1))))
       `(org-link                            ((,class (:foreground ,tree-blue-1 :underline t))))
       `(org-special-keyword                 ((,class (:foreground ,tree-blue-0))))
       `(org-table                           ((,class (:foreground ,tree-orange-0))))

;;;;; Region
       `(region                              ((,class (:background ,tree-grey-3))))

;;;;; Smerge
       `(smerge-markers                      ((,class (:foreground ,tree-yellow-3 :background ,tree-grey-0))))
       `(smerge-refined-change               ((,class (:foreground ,tree-green-5))))

;;;;; SmartParens
       `(sp-pair-overlay-face                ((((class color) (min-colors 89)) (:background ,tree-grey-2))))
       `(sp-show-pair-match-face             ((((class color) (min-colors 89)) (:background ,tree-grey-5))))

;;;;; Spacemacs
       `(spacemacs-normal-face               ((,class (:foreground ,tree-bg :background ,tree-orange-2))))
       `(spacemacs-motion-face               ((,class (:foreground ,tree-bg :background ,tree-purple-2))))
       `(spacemacs-insert-face               ((,class (:foreground ,tree-bg :background ,tree-green-2))))
       `(spacemacs-visual-face               ((,class (:foreground ,tree-bg :background ,tree-grey-5))))
(setq ns-use-srgb-colorspace nil)
       `(spacemacs-lisp-face                 ((,class (:foreground ,tree-bg :background ,tree-purple-1))))
       `(spacemacs-replace-face              ((,class (:foreground ,tree-bg :background ,tree-red-1))))
       `(spacemacs-iedit-face                ((,class (:foreground ,tree-bg :background ,tree-red-8))))
       `(spacemacs-iedit-insert-face         ((,class (:foreground ,tree-bg :background ,tree-red-8))))
       `(spacemacs-evilified-face            ((,class (:foreground ,tree-bg :background ,tree-green-3))))
       `(spacemacs-emacs-face                ((,class (:foreground ,tree-bg :background ,tree-blue-5))))

;;;;; TabBar
       `(tabbar-default                      ((,class (:inherit variable-pitch :background ,tree-bg :foreground ,tree-fg :height 0.8))))
       `(tabbar-modified                     ((,class (:inherit tabbar-default :foreground ,tree-green-5 :box (:line-width 1 :color ,tree-grey-5 style: released-button)))))
       `(tabbar-selected                     ((,class (:inherit tabbar-default :foreground ,tree-blue-0 :box (:line-width 1 :color ,tree-fg style: released-button)))))
       `(tabbar-unselected                   ((,class (:inherit tabbar-default :box (:line-width 1 :color ,tree-grey-6 style: released-button)))))

;;;;; Whitespace
       `(trailing-whitespace                 ((,class (:background ,tree-red-4))))

;;;;; Vertical border
       `(vertical-border                     ((,class (:foreground ,tree-grey-3))))

;;;;; Web Mode
       `(web-mode-builtin-face               ((,class (:foreground ,tree-blue-1))))
       `(web-mode-html-attr-name-face        ((,class (:foreground ,tree-blue-0))))
       `(web-mode-html-tag-face              ((,class (:foreground ,tree-orange-0))))
       `(web-mode-symbol-face                ((,class (:foreground ,tree-blue-3))))
       `(web-mode-function-name-face         ((,class (:foreground ,tree-orange-0))))
       `(web-mode-block-control-face         ((,class (:foreground ,tree-red-1))))
       `(web-mode-variable-name-face         ((,class (:foreground ,tree-blue-2))))

;;;;; More Whitespace
       `(whitespace-trailing                 ((,class (:background ,tree-red-4))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'tree)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
;;; tree-theme.el ends here
