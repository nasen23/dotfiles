;;; ~/.dotfiles/doom.d/+chinese.el -*- lexical-binding: t; -*-


(use-package! fcitx
  :after evil
  :config
  (when (executable-find "fcitx-remote")
    (fcitx-evil-turn-on)))


(use-package! pangu-spacing
  :hook (text-mode . pangu-spacing-mode)
  :config
  ;; Always insert `real' space in org-mode.
  (setq-hook! 'org-mode-hook pangu-spacing-real-insert-separtor t))


(use-package! youdao-dictionary
  :defer 5
  :config
  (map! :leader
        "t c" #'youdao-dictionary-search-at-point-tooltip
        "t v" #'youdao-dictionary-play-voice-at-point))


;;; Hacks
(defadvice! +chinese--org-html-paragraph-a (args)
  "Join consecutive Chinese lines into a single long line without unwanted space
when exporting org-mode to html."
  :filter-args #'org-html-paragraph
  (cl-destructuring-bind (paragraph contents info) args
    (let* ((fix-regexp "[[:multibyte:]]")
           (origin-contents
            (replace-regexp-in-string
             "<[Bb][Rr] */>"
             ""
             contents))
           (fixed-contents
            (replace-regexp-in-string
             (concat "\\(" fix-regexp "\\) *\n *\\(" fix-regexp "\\)")
             "\\1\\2"
             origin-contents)))
      (list paragraph fixed-contents info))))


;;; chinese word count
(after! org
  (defvar word-count-rule-chinese "\\cc"
    "A regexp string to match chinese characters.")

  (defvar word-count-rule-nonespace "[^[:space:]]")

  (defvar word-count-rule-ansci "[A-Za-z]")

  (defun regexp-words-count (start end regexp)
    (let ((count 0))
      (save-excursion
        (goto-char start)
        (while (and (< (point) end) (re-search-forward regexp end t))
          (setq count (1+ count))))
      count))

  (defun my/chinese-word-count (&optional beg end)
    "Chinese word count."
    (interactive (list (mark) (point)))
    (let ((min (if (= beg end) (point-min) beg))
          (max (if (= beg end) (point-max) end))
          list)
      (setq list
            (mapcar (lambda (r)
                      (regexp-words-count min max r))
                    (list
                     word-count-rule-chinese
                     word-count-rule-nonespace
                     word-count-rule-ansci
                     )))
      (message "字数:%d,字符数（不计空格）:%d,字符数（计空格）:%d,非中文单词:%d,中文:%d"
               (+ (car list) (car (last list)))
               (cadr list)
               (- max min)
               (car (last list))
               (car list))))
  )
